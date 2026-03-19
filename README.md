# BELLABEAT  
## Smart Device Usage Analysis  

**FitBit Fitness Tracker Data** | Google Data Analytics Capstone  
Dataset by Möbius | Kaggle  

---

## 1. Business Task  

Analyze FitBit smart device usage data to identify consumer behaviour trends and apply those insights to inform Bellabeat’s marketing strategy for one of its products.  

### Guiding Questions  
- What are some trends in smart device usage?  
- How could these trends apply to Bellabeat customers?  
- How could these trends help influence Bellabeat’s marketing strategy?  

### Product Focus  
The insights from this analysis are applied to the **Bellabeat Leaf** — a wellness tracker worn as a bracelet, necklace, or clip that tracks activity, sleep, and stress.  

---

## 2. Dataset Limitations  

Before drawing conclusions from this data, it is essential to acknowledge the following limitations. A strong analysis is transparent about what the data cannot tell us, not just what it can.  

### 2.1 Small Sample Size  
**Limitation:** The dataset contains only 30 FitBit users. This is far below the threshold typically required for statistically significant conclusions. Results may not be representative of the broader population of smart device users or Bellabeat’s customer base.  

**Recommendation for future analysis:**  
A sample of at least **200–500 users** would provide more reliable trends.  

---

### 2.2 Outdated Data  
**Limitation:** The data was collected in 2016 — nearly a decade ago. Smart device usage habits, fitness culture, and wearable technology capabilities have changed significantly since then.  

**Recommendation for future analysis:**  
Bellabeat should commission or source a more recent dataset (**2022 onwards**) to reflect current consumer behaviour.  

---

### 2.3 No Demographic Information  
**Limitation:** The dataset contains no information about age, gender, location, or lifestyle. Bellabeat targets women, but we cannot confirm representation in this dataset.  

---

### 2.4 Self-Selected Participants  
**Limitation:** Participants voluntarily submitted their FitBit data, introducing **selection bias**. These users may already be more health-conscious than average.  

---

### 2.5 Inconsistent Tracking  
**Limitation:** Not all users tracked every day. The sleep dataset has significantly fewer entries than the activity dataset, reducing reliability of sleep-related insights.  

---

### Summary Table  

| Limitation | Impact | Severity |
|----------|--------|---------|
| Small sample (30 users) | Low statistical reliability | High |
| Data from 2016 | May not reflect current habits | High |
| No demographic data | Cannot confirm target audience match | Medium |
| Self-selected participants | Possible upward bias in metrics | Medium |
| Inconsistent sleep tracking | Sleep insights less reliable | Medium |

---

## 3. Key Insights & Analysis  

Insights were derived from Power BI visualizations based on BigQuery results. Each insight connects directly to a Bellabeat marketing recommendation.  

---

### Insight 1: Activity Level Segments  

**Chart:** Donut Chart (User activity levels)  

**Finding:**  
Most users fall at extreme ends:  
- Sedentary: **32.23%**  
- Very Active: **32.23%**  
- Lightly & Moderately Active: Remaining users  

Users are largely either inactive or highly active, with fewer in the middle.  

**Recommendation:**  
Introduce **daily push notifications** encouraging movement, especially targeting sedentary users.  

---

### Insight 2: Sleep Quality Segments  

**Chart:** Donut Chart (Sleep quality distribution)  

**Finding:**  
- **54.17%** under-sleep (<7 hrs)  
- **41.67%** normal sleep (7–9 hrs)  
- **4.17%** over-sleep (>9 hrs)  

Most users are not getting adequate rest.  

**Recommendation:**  
Add **sleep awareness features** and **bedtime reminders** to position the Leaf as a sleep wellness companion.  

---

### Insight 3: Sedentary Time vs Sleep Quality  

**Chart:** Bar Chart (Sleep vs sedentary levels)  

**Finding:**  
- Low sedentary: **8.61 hrs sleep**  
- Moderate sedentary: ~**7 hrs**  
- High sedentary: **3.68 hrs**  

Higher sedentary time strongly correlates with poorer sleep.  

**Recommendation:**  
Introduce a **“Wind Down” feature** tied to inactivity alerts to encourage better sleep habits.  

---

### Insight 4: Physical Activity vs Sleep Quality  

**Chart:** Scatter Plot (Steps vs sleep)  

**Finding:**  
Higher daily steps are associated with more hours of sleep.  

**Recommendation:**  
Use marketing messaging that links:  
- Physical activity  
- Better sleep  
- Youthful, energised appearance  

---

### Insight 5: Average Steps by Day of Week  

**Chart:** Bar Chart (Steps per weekday)  

**Finding:**  
- **Saturday & Tuesday:** Highest activity  
- **Sunday:** Lowest activity  

**Recommendation:**  
Send **motivational notifications on Sundays**, encouraging light activity to improve sleep quality.  

---

## 4. Summary of Insights & Recommendations  

| Chart | Key Finding | Bellabeat Recommendation |
|------|------------|--------------------------|
| Activity Segments | Users split between sedentary & very active | Daily push notifications |
| Sleep Segments | 54.17% under-sleeping | Sleep reminders & awareness |
| Sedentary vs Sleep | High sedentary → very low sleep | “Wind Down” feature |
| Activity vs Sleep | More steps = more sleep | Marketing linking activity & wellness |
| Steps by Day | Sunday least active | Sunday nudges |

---

## 5. Important Caveats  

All insights are **directional**, based on a small dataset of 30 users from 2016. These should be treated as exploratory findings.  

### Key Limitations  
- Small sample size (30 users)  
- No demographic validation (target = women)  
- Outdated data (2016)  
- Correlations are **associational, not causal**  

---

## Recommended Next Step  

Commission a **larger, recent dataset** segmented by:  
- Gender  
- Age group  
- Lifestyle  

This will help validate findings before making major marketing investment decisions.  
