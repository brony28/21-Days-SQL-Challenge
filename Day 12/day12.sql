/*## Daily Challenge:

**Question:** Analyze the event impact by comparing weeks with events vs weeks without events. 
Show: event status ('With Event' or 'No Event'), count of weeks, average patient satisfaction, and average staff morale. 
Order by average patient satisfaction descending.
*/

SELECT
    event_status,
    COUNT(*) AS week_count,
    ROUND(AVG(AvgPatientSatisfaction),2) AS AvgPatientSatisfaction,
    ROUND(AVG(AvgStaffMorale),2) AS AvgStaffMorale
FROM (
    SELECT
        week,
        CASE 
            WHEN SUM(CASE WHEN event <> '' OR event IS NOT NULL THEN 1 ELSE 0 END) > 0 
                THEN 'With Event'
            ELSE 'No Event'
        END AS event_status,
        AVG(patient_satisfaction) AS AvgPatientSatisfaction,
        AVG(staff_morale) AS AvgStaffMorale
	FROM services_weekly
    GROUP BY week
) AS week_summary
GROUP BY event_status
ORDER BY AvgPatientSatisfaction DESC;


--## Practice Questions:

--1. Find all weeks in services_weekly where no special event occurred.
--SELECT week FROM services_weekly
--WHERE event IS NULL OR event = ''

--2. Count how many records have null or empty event values.
--SELECT COUNT(*) "Null/Empty Records" FROM services_weekly
--WHERE event IS NULL OR event = ''

--3. List all services that had at least one week with a special event.
--SELECT DISTINCT service FROM services_weekly
--WHERE event IS NOT NULL OR event <> ''


/* Ponder on this - 
Hi, I have a doubt about the “weeks with events vs weeks without events” SQL question.
Our data has multiple rows per week, and some weeks have both real events (like 'flu') and 'none'. Depending on how I write the query, I get different results:

Row-wise classification using COUNT(*) gives With Event: 44, No Event: 164 (counts rows, not weeks)
Distinct week-wise using COUNT(DISTINCT week) gives With Event: 31, No Event: 52 (weeks overlap between groups)
True week-level logic using subquery/CTE gives With Event: 31, No Event: 21 (each week counted only once, total weeks 52)

This means:
You must classify at the week level, not row level.
Row-wise counts or COUNT(DISTINCT week) per event value will not satisfy the requirement.

So the only correct approach is:
✔️ Identify each week once
✔️ Mark it “With Event” if any non-none event occurs
✔️ Otherwise “No Event”
✔️ Then aggregate those week-level rows 

*/




