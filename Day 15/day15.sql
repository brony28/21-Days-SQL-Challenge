/*### Daily Challenge:

**Question:** Create a comprehensive service analysis report for week 20 showing: 
service name, total patients admitted that week, total patients refused, average patient satisfaction, 
count of staff assigned to service, and count of staff present that week. Order by patients admitted descending.
*/

SELECT
    sw.week,
	sw.service,
    sw.patients_admitted,
    sw.patients_refused,
    sw.patient_satisfaction,
    COUNT(DISTINCT s.staff_id) AS StaffAssigned,
    COUNT(DISTINCT CASE WHEN ss.present = 1 THEN ss.staff_id END) AS StaffPresent

FROM services_weekly sw
LEFT JOIN staff s
    ON sw.service = s.service
LEFT JOIN staff_schedule ss
    ON s.staff_id = ss.staff_id
   	AND ss.week = 20 

WHERE sw.week = 20

GROUP BY sw.week,sw.service,sw.patients_admitted,sw.patients_refused,sw.patient_satisfaction
ORDER BY sw.patients_admitted DESC;


### Practice Questions:

1. Join patients, staff, and staff_schedule to show patient service and staff availability.
SELECT p.patient_id,p.name,p.service,s.staff_id,s.staff_name,s.role,ss.week,ss.present FROM patients p INNER JOIN staff s 
ON p.service = s.service
LEFT JOIN staff_schedule ss
ON s.staff_id = ss.staff_id
ORDER BY p.name, ss.week

2. Combine services_weekly with staff and staff_schedule for comprehensive service analysis.
SELECT
    sw.week,
    sw.month,
    sw.service,
    sw.available_beds,
    sw.patients_request,
    sw.patients_admitted,
    sw.patients_refused,
    sw.patient_satisfaction,
    sw.staff_morale,
    sw.event,
    s.staff_id,
    s.staff_name,
    s.role,
    ss.present

FROM services_weekly sw INNER JOIN staff s
ON sw.service = s.service
INNER JOIN staff_schedule ss
ON s.staff_id = ss.staff_id AND sw.week = ss.week 
ORDER BY sw.service, sw.week, s.staff_id;


3. Create a multi-table report showing patient admissions with staff information.

SELECT p.*,s.staff_id,s.staff_name,s.role,ss.week,ss.present FROM patients p INNER JOIN staff s
ON p.service = s.service
INNER JOIN staff_schedule ss
ON s.staff_id = ss.staff_id
ORDER BY p.patient_id, ss.week, s.role;
