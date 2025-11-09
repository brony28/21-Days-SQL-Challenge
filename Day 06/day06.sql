/*
### Daily Challenge:

**Question:** For each hospital service, calculate the total number of patients admitted, total patients refused, 
and the admission rate (percentage of requests that were admitted). Order by admission rate descending.
*/

SELECT service,SUM(patients_admitted), SUM(patients_refused), 
ROUND( (SUM(patients_admitted) / SUM(patients_request)::float * 100)::numeric, 2)
AS "admission_rate"
FROM services_weekly 
GROUP BY service
ORDER BY admission_rate DESC

/*
--### Practice Questions:

--1. Count the number of patients by each service.
SELECT service, COUNT(*) FROM patients
GROUP BY service

--2. Calculate the average age of patients grouped by service.
SELECT service, ROUND(AVG(age),0) FROM patients
GROUP BY service

--3. Find the total number of staff members per role.
SELECT COUNT(staff_id) FROM staff
GROUP BY role
*/
