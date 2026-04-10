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
  