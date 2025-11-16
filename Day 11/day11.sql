/*Question: Find all unique combinations of service and event type from the services_weekly table where events are not null or none, 
along with the count of occurrences for each combination. Order by count descending.
*/
--SELECT * FROM services_weekly LIMIT 5


SELECT DISTINCT service, event, COUNT(*) AS service_event_occurances FROM services_weekly 
WHERE event IS NOT NULL 
GROUP BY service, event
ORDER BY service_event_occurances DESC

--### Practice Questions:

--1. List all unique services in the patients table.
--SELECT DISTINCT service FROM patients


--2. Find all unique staff roles in the hospital.
--SELECT DISTINCT role FROM staff

--3. Get distinct months from the services_weekly table.
--SELECT DISTINCT month FROM services_weekly
--ORDER BY month
