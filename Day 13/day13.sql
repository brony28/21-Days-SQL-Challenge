/*### Daily Challenge:

**Question:** Create a comprehensive report showing patient_id, patient name, age, service, 
and the total number of staff members available in their service. 
Only include patients from services that have more than 5 staff members. Order by number of staff descending, then by patient name.
*/

SELECT p.patient_id, p.name, p.age, p.service,s.TotalStaff 
FROM patients p 
INNER JOIN 
	( SELECT service, COUNT(staff_id) as TotalStaff
	FROM staff
	GROUP BY service
	HAVING COUNT(staff_id) > 5 ) s
ON p.service = s.service

ORDER BY s.TotalStaff DESC, p.name


-- ### Practice Questions:

-- 1. Join patients and staff based on their common service field (show patient and staff who work in same service).
--SELECT * FROM patients LIMIT 5


-- SELECT name, staff_name, p.service FROM patients p INNER JOIN staff s
-- ON p.service = s.service

-- 2. Join services_weekly with staff to show weekly service data with staff information.
-- SELECT sw.*,s.staff_name, s.staff_id,s.role FROM services_weekly sw INNER JOIN staff s
-- ON sw.service = s.service

-- 3. Create a report showing patient information along with staff assigned to their service.
-- SELECT * FROM staff_schedule LIMIT 5

-- SELECT p.*,s.staff_name FROM patients p INNER JOIN staff s
-- ON p.service = s.service












