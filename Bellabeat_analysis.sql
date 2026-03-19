
-- ============================================================
-- BELLABEAT SMART DEVICE USAGE ANALYSIS
-- Google Data Analytics Capstone Project
-- Dataset: FitBit Fitness Tracker Data (Kaggle - Möbius)
-- Tool: BigQuery SQL
-- Date: 03/2026
-- ============================================================
-- TABLES USED:
--   bellabeat.daily_activity  (940 rows)
--   bellabeat.sleep_day       (410 rows)
-- ============================================================



QUERY 1: Overall Activity Summary
-- Purpose: Get a high-level picture of user behaviour
--          across the full dataset
-- ============================================================
SELECT
  ROUND(AVG(TotalSteps), 0)          AS avg_daily_steps,
  ROUND(AVG(TotalDistance), 2)       AS avg_distance_km,
  ROUND(AVG(Calories), 0)            AS avg_calories_burned,
  ROUND(AVG(SedentaryMinutes), 0)    AS avg_sedentary_mins,
  ROUND(AVG(VeryActiveMinutes), 0)   AS avg_very_active_mins,
  ROUND(AVG(LightlyActiveMinutes),0) AS avg_lightly_active_mins
FROM bellabeat_analysis.daily_activity

QUERY 2: User Activity Segmentation
-- Purpose: Classify each user as Sedentary, Lightly Active,
--          Fairly Active, or Very Active based on avg steps
-- ============================================================
WITH user_avg AS (
  SELECT
    Id,
    ROUND(AVG(TotalSteps), 0)       AS avg_steps,
    ROUND(AVG(Calories), 0)         AS avg_calories,
    ROUND(AVG(SedentaryMinutes), 0) AS avg_sedentary_mins
  FROM bellabeat_analysis.daily_activity
  GROUP BY Id
)
SELECT
  Id,
  avg_steps,
  avg_calories,
  avg_sedentary_mins,
  CASE
    WHEN avg_steps < 5000                THEN 'Sedentary'
    WHEN avg_steps BETWEEN 5000 AND 7499 THEN 'Lightly Active'
    WHEN avg_steps BETWEEN 7500 AND 9999 THEN 'Fairly Active'
    WHEN avg_steps >= 10000              THEN 'Very Active'
  END AS activity_segment
FROM user_avg
ORDER BY avg_steps DESC


QUERY 3: Daily Step Trend by Day of Week
-- Purpose: Reveal which days users are most and least active
            to inform Bellabeat push notification timing
-- ============================================================

SELECT FORMAT_DATE('%A', DATE(ActivityDate)) AS day_of_week,
       AVG(TotalSteps) AS avg_steps
FROM bellabeat_analysis.daily_activity
GROUP BY day_of_week
ORDER BY avg_steps DESC


-- ============================================================
-- QUERY 4: Sleep Summary & Quality
-- Purpose: Calculate average sleep duration and time
--          spent awake in bed across all users
-- ============================================================
SELECT
  ROUND(AVG(TotalMinutesAsleep) / 60, 2)              AS avg_hours_asleep,
  ROUND(AVG(TotalTimeInBed) / 60, 2)                  AS avg_hours_in_bed,
  ROUND(AVG(TotalTimeInBed - TotalMinutesAsleep), 0)  AS avg_mins_awake_in_bed,
  COUNT(DISTINCT Id)                                   AS total_users_tracked
FROM bellabeat_analysis.sleep_day

-- ============================================================
-- QUERY 5: Per-User Sleep Segmentation
-- Purpose: Flag users as Under-sleeping, Normal, or
--          Over-sleeping based on WHO recommended 7-9 hours
-- ============================================================
WITH user_sleep AS (
SELECT
    Id,
    ROUND(AVG(TotalMinutesAsleep) / 60, 2) AS avg_hours_asleep,
    ROUND(AVG(TotalTimeInBed) / 60, 2)     AS avg_hours_in_bed
  FROM bellabeat_analysis.sleep_day
  GROUP BY Id
)
SELECT
  Id,
  avg_hours_asleep,
  avg_hours_in_bed,
  CASE
    WHEN avg_hours_asleep < 7  THEN 'Under-sleeping'
    WHEN avg_hours_asleep <= 9 THEN 'Normal'
    WHEN avg_hours_asleep > 9  THEN 'Over-sleeping'
  END AS sleep_quality
FROM user_sleep
ORDER BY avg_hours_asleep


-- ============================================================
-- QUERY 6: Activity vs Sleep Correlation (Key Join Query)
-- Purpose: Join both tables to explore whether more active
--          users sleep better — the core analytical insight
-- ============================================================
SELECT
  a.Id,
  ROUND(AVG(a.TotalSteps), 0)                            AS avg_steps,
  ROUND(AVG(a.VeryActiveMinutes), 0)                     AS avg_very_active_mins,
  ROUND(AVG(a.SedentaryMinutes), 0)                      AS avg_sedentary_mins,
  ROUND(AVG(s.TotalMinutesAsleep) / 60, 2)               AS avg_hours_asleep,
  ROUND(AVG(s.TotalTimeInBed - s.TotalMinutesAsleep), 0) AS avg_mins_awake_in_bed
FROM bellabeat_analysis.daily_activity a
INNER JOIN bellabeat_analysis.sleep_day s
  ON a.Id = s.Id
  AND a.ActivityDate = s.SleepDay
GROUP BY a.Id
ORDER BY avg_steps DESC


-- ============================================================
-- QUERY 7: Sedentary Time vs Sleep Quality
-- Purpose: Test whether high sedentary time is associated
--          with poor sleep — a key Bellabeat marketing angle
-- ============================================================
SELECT
  CASE
    WHEN a.SedentaryMinutes < 600  THEN 'Low Sedentary (<10h)'
    WHEN a.SedentaryMinutes <= 900 THEN 'Moderate Sedentary (10-15h)'
    WHEN a.SedentaryMinutes > 900  THEN 'High Sedentary (>15h)'
  END AS sedentary_category,
  ROUND(AVG(s.TotalMinutesAsleep) / 60, 2) AS avg_hours_asleep,
  ROUND(AVG(a.Calories), 0)                AS avg_calories,
  COUNT(*)                                 AS record_count
FROM bellabeat_analysis.daily_activity a
INNER JOIN bellabeat_analysis.sleep_day s
  ON a.Id = s.Id
  AND a.ActivityDate = s.SleepDay
GROUP BY sedentary_category
ORDER BY avg_hours_asleep DESC
