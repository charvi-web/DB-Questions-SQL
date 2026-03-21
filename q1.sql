SELECT first_name, last_name,gender FROM patients WHERE gender='M';


SELECT first_name,last_name FROM patients WHERE allergies is null;


SELECT first_name FROM patients WHERE first_name LIKE 'C%';


SELECT first_name,last_name FROM patients WHERE weight between 100 and 120;



UPDATE patients SET allergies = 'NKA' WHERE allergies is  null;



