 ---- Create Database
 CREATE DATABASE Patient_records_p2

 -- Create Tables
  CREATE Table Patient_Records (
       PatientID INT PRIMARY KEY,	
	   Age	INT,
	   Gender VARCHAR(10),
	   Diagnosis VARCHAR(40),	
	   Admission_Date DATE,
	   Discharge_Date DATE,	
	   TreatmentOutcome	 VARCHAR(40),
	   Hospital_Stay_Days INT,	
	   Region VARCHAR(40)
  );

  ---Data Cleaning and Exploration

  SELECT*
   FROM Patient_Records
   WHERE patientid IS NULL
      OR
   age IS NULL
   OR
   gender IS NULL
   OR
   diagnosis IS NULL
   OR
   admission_date IS NULL
   OR
   discharge_date IS NULL
   OR
   treatmentoutcome IS NULL
   OR
   hospital_stay_days IS NULL
   OR
   region IS NULL
  
 --- Number of patients
  SELECT COUNT(* )
  FROM Patient_Records

  ---Write query to retrieve total number of patients
  
  SELECT COUNT(*) AS TotalPatients 
  FROM Patient_Records;

  --- Write a query to retrieve number of patients by gender.

  SELECT Gender, COUNT(*) AS PatientCount
  FROM Patient_Records
  GROUP BY Gender;

--- Write a query to retrieve age distribution of patients.
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

--- Write a query to retrieve number of patients by diagnosis.
    SELECT Diagnosis, COUNT(*) AS DiagnosisCount
    FROM Patient_Records
    GROUP BY Diagnosis
    ORDER BY DiagnosisCount DESC;

--- Write a query to retrieve average hospital stay by diagnosis.	
	SELECT Diagnosis, ROUND(AVG(Hospital_Stay_Days),2) AS AvgStayDays
    FROM Patient_Records
    GROUP BY Diagnosis
    ORDER BY AvgStayDays DESC;

----Mortality rate by diagnosis
	SELECT 
	  Diagnosis,
	  ROUND(SUM(CASE WHEN TreatmentOutcome = 'Deceased' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS MortalityRate
	FROM Patient_Records
	GROUP BY Diagnosis
	ORDER BY MortalityRate DESC;

---Recorvery rate by region
	  SELECT 
	  Region,
	  ROUND(SUM(CASE WHEN TreatmentOutcome = 'Recovered' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS RecoveryRate
	  FROM Patient_Records
	  GROUP BY Region;

----Top 5 oldest patient admitted	  
	  SELECT *
	  FROM Patient_Records
      ORDER BY Age DESC
      LIMIT 5;

--- Write query to retrieve top 5 records of patient who stay long in the hospital
	SELECT *
	FROM Patient_Records
	ORDER BY Hospital_Stay_Days DESC
	LIMIT 5;

---Treatment outcome breakdown
   SELECT TreatmentOutcome, COUNT(*) AS Count
   FROM Patient_Records
   GROUP BY TreatmentOutcome;


----Gender distribution by diagnosis

	SELECT Diagnosis, Gender, COUNT(*) AS Count
	FROM Patient_Records
	GROUP BY Diagnosis, Gender
	ORDER BY Diagnosis, Count DESC;

---Average age by region
   SELECT Region, ROUND(AVG(Age), 1) AS AvgAge
   FROM Patient_Records
   GROUP BY Region;

---Most common diagnosis by gender
   SELECT Gender, Diagnosis, COUNT(*) AS Count
   FROM Patient_Records
   GROUP BY Gender, Diagnosis
   ORDER BY Gender, Count DESC;

	
---End od project.

