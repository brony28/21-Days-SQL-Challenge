/*### Daily Challenge:

**Question:** Calculate the total number of patients admitted, total patients refused, 
and the average patient satisfaction across all services and weeks. Round the average satisfaction to 2 decimal places.
*/

SELECT SUM(patients_admitted) AS "total patients admitted", 
SUM(patients_refused) AS "total patients refused", 
ROUND(AVG(patient_satisfaction), 2) AS "average patient satisfaction" 
FROM services_weekly

--### Practice Questions:
/*
--1. Count the total number of patients in the hospital.
SELECT COUNT(patient_id) FROM patients 

--2. Calculate the average satisfaction score of all patients.
SELECT AVG(satisfaction) FROM patients 

--3. Find the minimum and maximum age of patients.
SELECT MIN(age) as "Minimum Age", 
MAX(age) as "Maximum Age"
FROM patients
*/
