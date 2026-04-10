SELECT COUNT(*) AS patients_in_group,
FLOOR (weight/10)*10 as weight_group
from patients
group by weight_group
order by weight_group DESC