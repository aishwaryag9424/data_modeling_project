--- SQL 1 to analyse carbon content from one process to the next
SELECT 
	a.a_id,
	p.id AS process_id,
	CONVERT_FROM(DECODE(ENCODE(a.results, 'base64'), 'base64'), 'UTF8')::NUMERIC as carbon_content,
	CONVERT_FROM(DECODE(ENCODE(a.results, 'base64'), 'base64'), 'UTF8')::NUMERIC - 
LAG(CONVERT_FROM(DECODE(ENCODE(a.results, 'base64'), 'base64'), 'UTF8')::NUMERIC) OVER () AS carbon_change
FROM 
	company.ANALYSIS a
JOIN 
	company.SAMPLE s ON s.a_id = a.a_id
JOIN 
	company.PROCESS p ON p.id = s.process_id


---- SQL 2 to check if data from the combustion analyzer be trusted?

SELECT 
    i_id,
    last_cal_date,
    frequency,
    last_cal_date + (frequency || ' days')::interval AS next_calibration_due,
    CASE 
        WHEN CURRENT_DATE <= last_cal_date + (frequency || ' days')::interval THEN 'Safe to Use'
        ELSE 'Not Safe to Use'
    END AS status
FROM 
    company.INSTRUMENT;
