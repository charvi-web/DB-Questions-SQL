SELECT first_name, last_name,gender FROM patients WHERE gender='M';


SELECT first_name,last_name FROM patients WHERE allergies is null;


SELECT first_name FROM patients WHERE first_name LIKE 'C%';


SELECT first_name,last_name FROM patients WHERE weight between 100 and 120;



UPDATE patients SET allergies = 'NKA' WHERE allergies is  null;



select concat(first_name,' ',last_name) as full_name from patients;


select p.first_name,p.last_name,r.province_name from patients p join province_names r on p.province_id=r.province_id;


select count(patient_id) from patients where year(birth_date) = 2010;



select first_name,last_name,max(height) from patients;




select * from patients where patient_id in (1,45,534,879,1000)




select count(patient_id) from admissions;



select * from admissions where admission_date=discharge_date;




select patient_id , count(patient_id) from admissions where patient_id=579;



select distinct city from patients where province_id='NS';



select first_name,last_name,birth_date from patients where height>160 and weight>70;



select first_name,last_name,allergies from patients where allergies is not null and city='Hamilton';


-- medium



select distinct year(birth_date) from patients order by year(birth_date);


select first_name from patients group by first_name having count(first_name)=1;