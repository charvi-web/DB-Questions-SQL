-- medium
select distinct year(birth_date) from patients order by year(birth_date);


select first_name from patients group by first_name having count(first_name)=1;


select patient_id,first_name from patients where first_name like 's%____s';


select p.patient_id,p.first_name,p.last_name from patients p join admissions r on p.patient_id=r.patient_id where r.diagnosis='Dementia'; 


select first_name from patients order by length(first_name) ,first_name;


SELECT (SELECT COUNT(*) FROM patients WHERE gender='M') AS male_count , (SELECT COUNT(*) FROM patients WHERE gender='F') AS female_count;



select
  first_name,
  last_name,
  allergies
from patients
WHERE
  allergies IN ('Penicillin','Morphine')
order by
  allergies,
  first_name,
  last_name;



SELECT
  patient_id,
  diagnosis
from admissions
group by patient_id,diagnosis
HAVING COUNT(*) > 1



SELECT city,COUNT(*) AS num_patients FROM patients GROUP BY
city order by num_patients DESC, city ASC




SELECT
  first_name,
  last_name,
  'Patient' AS role
FROM patients
union all
SELECT
  first_name,
  last_name,
  'Doctor' AS role
FROM doctors


SELECT allergies,COUNT(*) AS total_diagnosis FROM patients WHERE
allergies IS NOT NULL 
GROUP BY allergies 
order by total_diagnosis DESC;




SELECT
  first_name,
  last_name,
  birth_date
FROM patients
where YEAR(birth_date) BETWEEN 1970 AND 1979
ORDER BY birth_date




select CONCAT(upper(last_name),',',lower(first_name)) AS new_name_format
FROM patients
order by first_name DESC;



select
  province_id,
  SUM(height) AS sum_height
FROM patients
group by province_id
HAVING sum_height >= 7000



