
#  Analysis of Patient Record Project Using SQL

This project showcases how SQL can be applied to analyze biostatistics data, particularly focusing on patient demographics, diagnosis patterns, treatment outcomes, and hospital utilization.

---

## 🎯 Objective

The goal of this project is to demonstrate core SQL skills by analyzing a clinical dataset. The analysis aims to:

- Understand patient demographic distributions
- Identify patterns in diagnoses and treatment outcomes
- Evaluate hospital resource utilization
- Provide actionable insights for healthcare decision-making

---

## 📁 Dataset Overview

The dataset includes patient records with the following columns:

- **PatientID**: Unique identifier for each patient  
- **Age**: Age of the patient  
- **Gender**: Male or Female  
- **Diagnosis**: Disease or condition diagnosed (e.g., Diabetes, Cancer)  
- **Admission_Date** / **Discharge_Date**: Dates of hospital admission and discharge  
- **TreatmentOutcome**: Outcome of treatment (e.g., Recovered, Deceased, Referred)  
- **Hospital_Stay_Days**: Number of days spent in the hospital  
- **Region**: Geographic region of the patient  

---

## 🧠 SQL Analyses Performed

The project includes 17 SQL queries, such as:

1. Total number of patients  
2. Gender-based distribution  
3. Age group segmentation  
4. Most frequent diagnoses  
5. Average hospital stay per diagnosis  
6. Mortality and recovery rates  
7. Admissions by month  
8. Diagnosis trends by region and gender  
9. Top spending patients and longest hospital stays  etc

---



## 📊 SQL Queries Used

Here are the 15 SQL queries performed on the dataset:

1. **Total number of patients**
```sql
    SELECT COUNT(*) AS TotalPatients 
    FROM Patient_Records;
```

2. **Gender-based distribution**
```sql
   SELECT Gender, COUNT(*) AS PatientCount
   FROM Patient_Records
   GROUP BY Gender;
```

3. **Age group segmentation**
```sql
SELECT 
  CASE
    WHEN Age < 18 THEN 'Under 18'
    WHEN Age BETWEEN 18 AND 35 THEN '18-35'
    WHEN Age BETWEEN 36 AND 60 THEN '36-60'
    ELSE '60+'
  END AS AgeGroup,
  COUNT(*) AS Count
FROM Patient_Records
GROUP BY AgeGroup;
```

4. **Distribution of Patients by diagnoses**
```sql
    SELECT Diagnosis, COUNT(*) AS DiagnosisCount
    FROM Patient_Records
    GROUP BY Diagnosis
    ORDER BY DiagnosisCount DESC;
```

5. **Average hospital stay per diagnosis**
```sql
    SELECT Diagnosis, ROUND(AVG(Hospital_Stay_Days),2) AS AvgStayDays
    FROM Patient_Records
    GROUP BY Diagnosis
    ORDER BY AvgStayDays DESC;;
```

6. **Mortality and recovery rates**
```sql
SELECT 
	  Diagnosis,
	  ROUND(SUM(CASE WHEN TreatmentOutcome = 'Deceased' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS MortalityRate
	FROM Patient_Records
	GROUP BY Diagnosis
	ORDER BY MortalityRate DESC;
```

7. **Gender distribution per diagnosis**
```sql
   SELECT Diagnosis, Gender, COUNT(*) AS Count 
   FROM Patient_Records 
   GROUP BY Diagnosis, Gender ORDER BY Diagnosis;
```

8. **Average age by diagnosis**
```sql
   SELECT Diagnosis, ROUND(AVG(Age),2) AS AvgAge 
	 FROM Patient_Records 
	 GROUP BY Diagnosis 
	 ORDER BY AvgAge DESC;
```
9. **Recovery rate by region**
```sql
    SELECT 
	  Region,
	  ROUND(SUM(CASE WHEN TreatmentOutcome = 'Recovered' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS RecoveryRate
	  FROM Patient_Records
	  GROUP BY Region;
```
10. **Top 5 longest hospital stays**
```sql
  SELECT *
	FROM Patient_Records
	ORDER BY Hospital_Stay_Days DESC
	LIMIT 5;
```

11. **Number of admissions by region**
```sql
     SELECT Region, COUNT(*) AS Count 
	   FROM Patient_Records GROUP BY Region;
```

12. **Treatment Outcome distribution by region**
```sql
   SELECT TreatmentOutcome, COUNT(*) AS Count
   FROM Patient_Records
   GROUP BY TreatmentOutcome;
```

13. **Top 3 most common diagnoses per region**
```sql
SELECT Region, Diagnosis, COUNT(*) AS Count
FROM Patient_Records
GROUP BY Region, Diagnosis
ORDER BY Region, Count DESC;
```

14. **Diagnosis trends by age group**
```sql
SELECT 
  CASE 
    WHEN Age BETWEEN 0 AND 18 THEN '0-18'
    WHEN Age BETWEEN 19 AND 35 THEN '19-35'
    WHEN Age BETWEEN 36 AND 60 THEN '36-60'
    ELSE '60+' 
  END AS AgeGroup,
  Diagnosis,
  COUNT(*) AS Count
FROM Patient_Records
GROUP BY AgeGroup, Diagnosis
ORDER BY AgeGroup;
```

15. **Percentage of each treatment outcome**
```sql
SELECT 
  TreatmentOutcome,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Patient_Records), 2) AS Percentage
FROM Patient_Records
GROUP BY TreatmentOutcome;
```
16. **Average age by region**
```sql
  SELECT Region, ROUND(AVG(Age), 1) AS AvgAge
   FROM Patient_Records
   GROUP BY Region;
```
17. **Most common diagnosis by gender**
```sql
SELECT Gender, Diagnosis, COUNT(*) AS Count
   FROM Patient_Records
   GROUP BY Gender, Diagnosis
   ORDER BY Gender, Count DESC;
```
## 🔍 Insights

Key findings from the analysis:

- **Demographics**: Patients are distributed across all age groups, with a balanced gender ratio.
- **Common Diagnoses**: Conditions like Diabetes and Hypertension are among the most reported.
- **Outcomes**: The majority of patients recovered, but a few diagnoses show higher mortality rates.
- **Hospitalization Trends**: Longer stays are associated with chronic illnesses; admissions vary by month.
- **Regional Differences**: Recovery rates and diagnosis prevalence vary by geographic region.

---

## ✅ Conclusion

This project offers a practical demonstration of using SQL to explore and analyze healthcare datasets. It provides insights that can guide:

- Resource allocation  
- Preventive care strategies  
- Regional healthcare planning  
- Patient risk profiling  

The project serves as a valuable portfolio piece for aspiring data analysts, particularly those interested in public health or biostatistics.

---

## 💾 How to Use

1. Import the dataset (`Patient Record.csv`) into a SQL environment like **SQLite**, **PostgreSQL**, or **MySQL**.
2. Run the SQL queries in `biostatistics_sql_queries.sql`.
3. Review and interpret the results. Optionally, visualize them using Power BI, Tableau, or Excel.

---

## 📂 Project Files

- `Patient Record.csv` — Biostatistics dataset  
- `biostatistics_sql_queries.sql` — 15 SQL queries  
- `README.md` — Documentation

---

## 👨‍💻 Author

*This project is part of my data analytics portfolio, showcasing SQL skills relevant to biostatistics and public health data analysis.*
