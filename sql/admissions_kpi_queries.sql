Undergraduate Admissions & Enrollment Analytics
KPI and dashboard queries

1. Executive KPI Summary
SELECT
  COUNT(*) AS total_applicants,
  SUM(CASE WHEN Admitted = TRUE THEN 1 ELSE 0 END) AS total_admitted,
  SUM(CASE WHEN Enrolled = TRUE THEN 1 ELSE 0 END) AS total_enrolled,
  ROUND(100 * SUM(CASE WHEN Admitted = TRUE THEN 1 ELSE 0 END) / COUNT(*), 2) AS admission_rate,
  ROUND(
    100 * SUM(CASE WHEN Enrolled = TRUE THEN 1 ELSE 0 END) /
    SUM(CASE WHEN Admitted = TRUE THEN 1 ELSE 0 END),
    2
  ) AS yield_rate
FROM `project-ef2a3aed-6b63-4885-9aa.higher_education_analytics.undergraduate_admissions_enrollment`;

2. Admissions Funnel Table
CREATE OR REPLACE TABLE
`project-ef2a3aed-6b63-4885-9aa.higher_education_analytics.admissions_funnel`
AS
SELECT 'Applicants' AS Stage, 36603 AS Count
UNION ALL
SELECT 'Admitted', 23931
UNION ALL
SELECT 'Enrolled', 6320;


3. Term-Level Admissions and Enrollment Trend
SELECT
  Application_Term,
  COUNT(*) AS applicants,
  SUM(CASE WHEN Admitted = TRUE THEN 1 ELSE 0 END) AS admitted,
  SUM(CASE WHEN Enrolled = TRUE THEN 1 ELSE 0 END) AS enrolled,
  ROUND(100 * SUM(CASE WHEN Admitted = TRUE THEN 1 ELSE 0 END) / COUNT(*), 2) AS admission_rate,
  ROUND(
    100 * SUM(CASE WHEN Enrolled = TRUE THEN 1 ELSE 0 END) /
    SUM(CASE WHEN Admitted = TRUE THEN 1 ELSE 0 END),
    2
  ) AS yield_rate
FROM `project-ef2a3aed-6b63-4885-9aa.higher_education_analytics.undergraduate_admissions_enrollment`
GROUP BY Application_Term
ORDER BY Application_Term;


4. Yield Rate by Ethnicity
SELECT
  Ethnicity,
  COUNT(*) AS applicants,
  SUM(CASE WHEN Admitted = TRUE THEN 1 ELSE 0 END) AS admitted,
  SUM(CASE WHEN Enrolled = TRUE THEN 1 ELSE 0 END) AS enrolled,
  ROUND(
    100 * SUM(CASE WHEN Enrolled = TRUE THEN 1 ELSE 0 END) /
    SUM(CASE WHEN Admitted = TRUE THEN 1 ELSE 0 END),
    2
  ) AS yield_rate
FROM `project-ef2a3aed-6b63-4885-9aa.higher_education_analytics.undergraduate_admissions_enrollment`
GROUP BY Ethnicity
ORDER BY yield_rate DESC;

5. Average GPA by Admission Status
SELECT
  Admitted,
  ROUND(AVG(HS_GPA), 2) AS average_hs_gpa
FROM `project-ef2a3aed-6b63-4885-9aa.higher_education_analytics.undergraduate_admissions_enrollment`
GROUP BY Admitted;


6. Average GPA by Enrollment Status
SELECT
  Enrolled,
  ROUND(AVG(HS_GPA), 2) AS average_hs_gpa
FROM `project-ef2a3aed-6b63-4885-9aa.higher_education_analytics.undergraduate_admissions_enrollment`
GROUP BY Enrolled;
