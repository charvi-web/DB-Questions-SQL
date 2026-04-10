select
  category_name,
  description
from categories
order by category_name



select
  contact_name,
  address,
  city
from customers
where
  country NOT IN ('Germany', 'Mexico', 'Spain')




select
  order_date,
  shipped_date,
  customer_id,
  freight
FROM orders
WHERE order_date = '2018-02-26'








select
  employee_id,
  order_id,
  customer_id,
  required_date,
  shipped_date
FROM orders
WHERE shipped_date > required_date




select order_id
FROM orders
WHERE order_id % 2 = 0




select
  city,
  company_name,
  contact_name
FROM customers
WHERE city LIKE '%l%'
order by contact_name






select
  company_name,
  contact_name,
  fax
FROM customers
WHERE fax IS NOT NULL








select
  first_name,
  last_name,
  hire_date
FROM employees
order by hire_date DESC
LIMIT 1







select
  ROUND(avg(unit_price), 2) AS average_price,
  SUM(units_in_stock) AS total_stock,
  SUM(discontinued) AS total_discontinued
FROM products





-- MEDIUM


