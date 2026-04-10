SELECT COUNT(*) AS patients_in_group,
FLOOR (weight/10)*10 as weight_group
from patients
group by weight_group
order by weight_group DESC


select
  patient_id,
  weight,
  height,
  CASE
    WHEN weight / POWER((height/100.0), 2) >= 30 THEN 1
    ELSE 0
  END AS isObese
FROM patients





select
  P.patient_id,
  P.first_name,
  P.last_name,
  D.specialty
FROM admissions A
  JOIN patients P ON P.patient_id = A.patient_id
  JOIN doctors D ON A.attending_doctor_id = D.doctor_id
where
  A.diagnosis = 'Epilepsy'
  AND D.first_name = 'Lisa'







  select
  P.patient_id,
  CONCAT(P.patient_id, LEN(P.last_name), year(P.birth_date)) AS temp_password
FROM admissions A
  JOIN patients P ON P.patient_id = A.patient_id
  group by P.patient_id







  select
  CASE
    WHEN patient_id % 2 = 0 THEN 'Yes'
    ELSE 'No'
  END AS has_insurance,
  CASE
    WHEN patient_id % 2 = 0 THEN COUNT(*) * 10
    ELSE COUNT(*) * 50
  END AS cost_after_insurance
FROM admissions
GROUP BY
  CASE
    WHEN patient_id % 2 = 0 THEN 'Yes'
    ELSE 'No'
  END








  SELECT N.province_name
FROM province_names N
  JOIN patients P ON P.province_id = N.PROVINCE_ID
group by
  N.province_name HAVING COUNT(
    CASE
      WHEN P.gender = 'M' THEN 1
    END
  ) > COUNT(
    CASE
      WHEN P.gender = 'F' THEN 1
    END
  )








  SELECT *
FROM patients
WHERE
  first_name LIKE '__r%'
  AND gender = 'F'
  AND month(birth_date) IN (2, 5, 12)
  AND weight between 60 and 80
  AND patient_id % 2 = 1
  AND city = 'Kingston';









  select
  CONCAT(ROUND(
    count(
      case
        when gender = 'M' THEN 1
      END
    ) * 100.0 / count(*),
    2
  ),'%') AS percent_of_male_patients
FROM patients







SELECT
  admission_date,
  COUNT(admission_date) AS admission_day,
  COUNT(admission_date) - LAG(count(admission_date)) over (
    order by
      admission_date
  ) AS admission_count_change
FROM admissions
group by admission_date







-- NOS ARE KEPT ABOVE WORDS IN ENGLISH
select province_name
FROM province_names
order by
  CASE
    WHEN province_name = 'Ontario' THEN 1
    ELSE province_name
  END;



SELECT
  D.doctor_id,
  CONCAT(D.first_name, ' ', D.last_name) AS doctor_name,
  D.specialty,
  YEAR(admission_date) AS selected_year,
  COUNT(*) AS total_admissions
FROM doctors D
  JOIN admissions A ON D.doctor_id = A.attending_doctor_id
group by
  D.doctor_id,
  YEAR(A.admission_date)

