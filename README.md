# Undergraduate Admissions & Enrollment Analytics Using BigQuery and Looker Studio

## Overview

This project analyzes undergraduate admissions and enrollment data from Fall 2021 through Fall 2025 using SQL, Google BigQuery, Python, and Looker Studio. The goal was to transform raw institutional admissions data into meaningful insights through exploratory data analysis, data validation, KPI reporting, admissions funnel analysis, demographic analysis, GPA analysis, and interactive dashboard development.

This project focuses on descriptive analytics, EDA, SQL reporting, dashboard design, and business intelligence. Forecasting and predictive modeling will be developed as separate projects.

---

## Project Objective

The objective of this project was to analyze undergraduate admissions and enrollment data to understand application trends, admission outcomes, enrollment conversion, and key student characteristics. The analysis supports data-driven enrollment management by identifying patterns in applicants, admitted students, enrolled students, admission rates, yield rates, demographic groups, GPA, and financial aid application status.

---

## Business Questions

This project was designed to answer the following questions:

* How many students applied, were admitted, and enrolled?
* What are the overall admission and yield rates?
* How did applications, admissions, and enrollment change from Fall 2021 to Fall 2025?
* Which student groups contributed most to enrollment?
* How does high school GPA differ between admitted and non-admitted students?
* How does GPA differ between enrolled and non-enrolled students?
* Is financial aid application status associated with enrollment outcomes?
* Where does the largest drop occur in the admissions funnel?

---

## Tools & Technologies

* Python
* SQL
* Google BigQuery
* Looker Studio
* Data Cleaning
* Exploratory Data Analysis
* Data Validation
* KPI Reporting
* Dashboard Development
* Data Visualization

---

## Project Resources

* Interactive Dashboard: [Looker Studio Dashboard Link](https://datastudio.google.com/reporting/cbf642e0-8158-4555-ae76-b35edd2653ee)]
* Dataset Documentation: [Add Data Dictionary Link]
* SQL Scripts: [Add SQL Folder Link]
* BigQuery Project/Table: [Add BigQuery Link]
* Portfolio Website: [Add Portfolio Link]

---

## Data Source

The project uses de-identified undergraduate admissions and enrollment records from Fall 2021 through Fall 2025.

The raw dataset contained applicant-level records with fields related to admission status, enrollment status, application term, gender, ethnicity, age, high school GPA, test scores, financial aid application status, and first-generation indicator.

To protect privacy, sensitive identifiers were removed before analysis and public presentation.

---

## Step 1: Data Understanding

The first step was to inspect the structure of the dataset and understand the available variables. The dataset contained 36,604 rows initially, including one summary row that was not a real applicant record.

After reviewing the data, the summary row was removed, leaving 36,603 valid applicant records.

Key fields used in the analysis included:

* Application_Term
* Admitted
* Enrolled
* Gender
* Ethnicity
* Age
* HS_GPA
* FinAid_Applicant
* FirstGen_Ind

Sensitive identifiers were removed from the public version of the project.

---

## Step 2: Data Cleaning and Validation

The dataset was cleaned using Python before being uploaded to BigQuery. The cleaning process included:

* Removing the summary row
* Removing sensitive identifier fields
* Converting numeric fields to proper data types
* Checking missing values
* Validating admission and enrollment indicators
* Reviewing categorical fields such as gender, ethnicity, financial aid status, and application term

The final cleaned dataset contained:

| Item                 |                                       Value |
| -------------------- | ------------------------------------------: |
| Records              |                                      36,603 |
| Time Period          |                         Fall 2021–Fall 2025 |
| Main Outcome Fields  |                          Admitted, Enrolled |
| Main Analysis Fields | Term, Gender, Ethnicity, GPA, Financial Aid |

---

## Step 3: BigQuery Data Warehouse Setup

After cleaning, the dataset was uploaded into Google BigQuery for SQL-based analysis and dashboard reporting.

### BigQuery Dataset

```text
higher_education_analytics
```

### Primary Table

```text
undergraduate_admissions_enrollment
```

A separate funnel table was also created for the admissions funnel visualization.

### Funnel Table

```text
admissions_funnel
```

This table included three stages:

| Stage      |  Count |
| ---------- | -----: |
| Applicants | 36,603 |
| Admitted   | 23,931 |
| Enrolled   |  6,320 |

---

## Step 4: SQL Analysis

SQL queries were written in BigQuery to calculate key institutional metrics, including:

* Total applicants
* Total admitted students
* Total enrolled students
* Admission rate
* Yield rate
* Applicants by term
* Admitted students by term
* Enrolled students by term
* Enrollment by gender
* Enrollment by ethnicity
* Yield rate by demographic group
* GPA summaries by admission and enrollment status

### Executive KPI Query

The main KPI query calculated total applicants, admitted students, enrolled students, admission rate, and yield rate.

```sql
SELECT
  COUNT(*) AS applicants,
  SUM(CASE WHEN Admitted = TRUE THEN 1 ELSE 0 END) AS admitted,
  SUM(CASE WHEN Enrolled = TRUE THEN 1 ELSE 0 END) AS enrolled,
  ROUND(
    100 * SUM(CASE WHEN Admitted = TRUE THEN 1 ELSE 0 END) / COUNT(*),
    2
  ) AS admission_rate,
  ROUND(
    100 * SUM(CASE WHEN Enrolled = TRUE THEN 1 ELSE 0 END) /
    SUM(CASE WHEN Admitted = TRUE THEN 1 ELSE 0 END),
    2
  ) AS yield_rate
FROM `project-ef2a3aed-6b63-4885-9aa.higher_education_analytics.undergraduate_admissions_enrollment`;
```

---

## Step 5: Exploratory Data Analysis

Exploratory data analysis was performed to understand the structure, quality, and patterns in the dataset.

EDA included:

* Missing value analysis
* Admission and enrollment distribution
* Application term distribution
* Gender distribution
* Ethnicity distribution
* GPA comparison by admission status
* GPA comparison by enrollment status
* Financial aid application analysis
* Admissions funnel analysis

---

## Step 6: Dashboard Development

An interactive dashboard was developed in Looker Studio and connected directly to BigQuery. The dashboard was designed to provide a professional executive-level view of admissions and enrollment performance.

### Dashboard Page 1: Executive Overview

This page summarizes the main institutional KPIs.

Included metrics:

* Total Applicants
* Total Admitted
* Total Enrolled
* Admission Rate
* Yield Rate

Included visuals:

* Admissions pipeline trend by application term
* Enrollment distribution by gender
* Enrollment distribution by ethnicity
* Enrollment share by application term

Dashboard Screenshot: [Insert Page 1 Screenshot]

---

### Dashboard Page 2: Enrollment Conversion and Yield Analytics

This page focuses on applicant progression and enrollment conversion.

Included visuals:

* Admissions conversion funnel
* Yield rate by ethnicity
* Yield rate by gender
* Enrollment outcomes by financial aid application status
* Admission rate vs yield rate comparison

Dashboard Screenshot: [Insert Page 2 Screenshot]

---

## Executive Summary

A total of 36,603 undergraduate applicant records were analyzed across Fall 2021 through Fall 2025.

| Metric           |  Value |
| ---------------- | -----: |
| Total Applicants | 36,603 |
| Total Admitted   | 23,931 |
| Total Enrolled   |  6,320 |
| Admission Rate   | 65.38% |
| Yield Rate       | 26.41% |

The analysis shows that the institution had a strong applicant pool and a stable admission rate. However, the largest drop occurred between admitted students and enrolled students, suggesting that enrollment conversion and yield are important areas for strategic attention.

---

## Key Findings

### 1. Admissions Funnel

The admissions funnel showed the movement from applicant to admitted student to enrolled student.

| Stage      |  Count |
| ---------- | -----: |
| Applicants | 36,603 |
| Admitted   | 23,931 |
| Enrolled   |  6,320 |

The largest drop occurred after admission, where many admitted students did not enroll. This highlights the importance of improving post-admission engagement and yield strategies.

Visualization: [Insert Admissions Funnel Screenshot]

---

### 2. Admission and Enrollment Trends

Applications increased significantly between Fall 2021 and Fall 2024. Enrollment also increased, but at a slower pace compared with application growth.

This suggests that application volume alone does not fully explain enrollment growth. Improving the conversion of admitted students into enrolled students may be an important opportunity.

Visualization: [Insert Trend Chart Screenshot]

---

### 3. Gender Analysis

Female students represented the largest applicant group and also accounted for the majority of enrolled students.

This analysis helps identify applicant and enrollment composition by gender and supports demographic reporting for institutional planning.

Visualization: [Insert Gender Dashboard Screenshot]

---

### 4. Ethnicity Analysis

Hispanic and Black students represented the largest applicant groups. Enrollment distribution varied across ethnic groups, showing differences between applicant volume and enrollment outcomes.

This analysis provides insight into recruitment composition and student population trends.

Visualization: [Insert Ethnicity Dashboard Screenshot]

---

### 5. GPA Analysis

Academic performance showed a strong relationship with admission and enrollment outcomes.

| Group                 | Average HS GPA |
| --------------------- | -------------: |
| Admitted Students     |           3.39 |
| Non-Admitted Students |           2.85 |
| Enrolled Students     |           3.45 |
| Non-Enrolled Students |           3.22 |

Students who were admitted had a higher average high school GPA than students who were not admitted. Students who enrolled also had a higher average GPA than students who did not enroll.

This suggests that GPA is an important academic indicator associated with both admission and enrollment outcomes.

Visualization: [Insert GPA Analysis Screenshot]

---

### 6. Financial Aid Analysis

Financial aid application status showed a meaningful relationship with enrollment outcomes. Students who applied for financial aid had a higher enrollment rate than students who did not apply.

This finding suggests that financial aid engagement may play an important role in enrollment decisions.

Visualization: [Insert Financial Aid Analysis Screenshot]

---

## Dashboard Design

The dashboard was designed using a clean executive reporting style with a deep blue color theme. The design focused on clarity, readability, and quick interpretation by stakeholders.

Design elements included:

* KPI scorecards
* Funnel chart
* Bar charts
* Donut charts
* Trend charts
* Clean white card layout
* Deep blue visual theme
* Minimal text with clear chart titles

---

## Skills Demonstrated

This project demonstrates:

* SQL query development
* Google BigQuery analytics
* Exploratory data analysis
* Data cleaning and validation
* ETL workflow development
* KPI reporting
* Dashboard development
* Looker Studio visualization
* Enrollment analytics
* Business intelligence reporting
* Stakeholder-focused storytelling

---

## Repository Structure

```text
undergraduate-admissions-enrollment-analytics/
│
├── README.md
├── data/
│   └── cleaned_dataset_documentation.md
│
├── sql/
│   ├── executive_kpis.sql
│   ├── enrollment_trends.sql
│   ├── admissions_funnel.sql
│   ├── demographic_analysis.sql
│   ├── gpa_analysis.sql
│   └── financial_aid_analysis.sql
│
├── dashboards/
│   ├── executive_overview.png
│   └── conversion_yield_dashboard.png
│
└── documentation/
    └── data_dictionary.md
```

---

## Conclusion

This project demonstrates how admissions and enrollment data can be transformed into actionable insights using SQL, BigQuery, and Looker Studio. By combining exploratory data analysis, KPI reporting, enrollment funnel analysis, demographic analysis, and dashboard development, the project provides a clear view of undergraduate admissions and enrollment performance.

The analysis shows that while application and admission volumes were strong, enrollment conversion remains a key area for improvement. The dashboard can help decision-makers monitor admissions performance, understand student demographics, and identify opportunities to improve enrollment yield.

---

## Author

**Md. Rashedul Hoque**
Data Analytics | Business Intelligence | Dashboard Development

LinkedIn: [Add LinkedIn Link]
Portfolio: [Add Portfolio Link]
GitHub: [Add GitHub Link]
