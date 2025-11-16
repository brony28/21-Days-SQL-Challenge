/*### Daily Challenge:

**Question:** Create a service performance report showing service name, total patients admitted, 
and a performance category based on the following: 'Excellent' if avg satisfaction >= 85, 'Good' if >= 75, 'Fair' if >= 65, 
otherwise 'Needs Improvement'. Order by average satisfaction descending.
*/
--SELECT * FROM services_weekly LIMIT 5

SELECT service, SUM(patients_admitted),
ROUND(AVG(patient_satisfaction),2) AS AverageSatisfactionScore,
CASE
	WHEN AVG(patient_satisfaction) >= 85 THEN 'Excellent'
	WHEN AVG(patient_satisfaction) >=75 THEN 'Good'
	WHEN AVG(patient_satisfaction) >=65 THEN 'Fair'
	ELSE 'Needs Improvement'
END AS PerformanceReview
FROM services_weekly
GROUP BY service
ORDER BY AverageSatisfactionScore DESC

--### Practice Questions:

--1. Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.

/*SELECT patient_id, name, 
CASE 
	WHEN satisfaction > 80 THEN 'High' 
	WHEN satisfaction > 60 THEN 'Medium'
	ELSE 'Low'
END AS "Satisfaction lvl"
FROM patients 
*/

--2. Label staff roles as 'Medical' or 'Support' based on role type.
--SELECT * FROM staff LIMIT 5
--SELECT DISTINCT role FROM staff LIMIT 5

/*SELECT staff_id,staff_name, 
CASE 
	WHEN role IN ('doctor','nurse') THEN 'Medical'
	ELSE 'Support'
END AS AssignedRole
FROM staff
*/

--3. Create age groups for patients (0-18, 19-40, 41-65, 65+).
--SELECT * FROM patients LIMIT 5

/*SELECT patient_id, name, age, 
CASE
	WHEN age BETWEEN 0 AND 18 THEN 'Child/Teen'
	WHEN age BETWEEN 19 AND 40 THEN 'Young Adult'
	WHEN age BETWEEN 41 AND 65 THEN 'Adult'
	ELSE 'Senior'
END AS "Age Group"

FROM patients
*/



