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





  