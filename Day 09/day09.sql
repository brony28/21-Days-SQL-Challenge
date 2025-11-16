/*### Daily Challenge:

**Question:** Calculate the average length of stay (in days) for each service, 
showing only services where the average stay is more than 7 days. 
Also show the count of patients and order by average stay descending.
*/

SELECT service, ROUND(AVG(departure_date - arrival_date),2) AS AverageStay,
COUNT(patient_id) AS CountOfPatients
FROM patients
GROUP BY service
HAVING AVG(departure_date - arrival_date) > 7
ORDER BY AverageStay DESC

--SELECT * FROM patients LIMIT 5


--### Practice Questions:

--1. Extract the year from all patient arrival dates.
--SELECT patient_id, EXTRACT(year from arrival_date) FROM patients


--2. Calculate the length of stay for each patient (departure_date - arrival_date).
--SELECT patient_id, arrival_date, departure_date, (departure_date - arrival_date) AS StayPeriod 
--FROM patients


--3. Find all patients who arrived in a specific month.
--SELECT * FROM patients 
--WHERE EXTRACT(MONTH from arrival_date) = 5 --May

