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
select
  P.product_name AS product_name,
  S.company_name AS company_name,
  C.category_name AS category_name
FROM products P
  JOIN categories C ON P.category_id = C.category_id
  JOIN suppliers S ON P.supplier_id = S.supplier_id





  select
  C.category_name,
  ROUND(avg(P.unit_price),2) AS average_unit_price
FROM categories C
  JOIN products P ON C.category_id = P.category_id
group by C.category_name



select
  city,
  company_name,
  contact_name,
  'customers' AS relationship 
FROM customers 

union
select
  city,
  company_name,
  contact_name,
  'suppliers' AS relationship 
FROM suppliers







select
  year(order_date) AS order_year,
  month(order_date) AS order_month,
  COUNT(order_id) AS no_of_orders
FROM orders
group by
  year(order_date),
  month(order_date)










  -- HARD
  select
  E.first_name,
  E.last_name,
  count(O.order_id) AS num_orders,
  (
    CASE
      WHEN O.shipped_date <= O.required_date THEN "On Time"
      WHEN O.shipped_date > O.required_date THEN "Late"
      WHEN O.shipped_date IS NULL THEN "Not Shipped"
    END
  ) AS shipped
FROM employees E
  JOIN orders O ON E.employee_id = O.employee_id
group by
  E.first_name,
  E.last_name, shipped
order by
  E.last_name,
  E.first_name,
  num_orders DESC








  select
  YEAR(O.order_date) AS order_year,
  ROUND(
    SUM(P.unit_price * OD.quantity * OD.discount),
    2
  ) AS discount_amount
FROM orders O
  JOIN order_details OD ON O.order_id = OD.order_id
  JOIN products P ON P.product_id = OD.product_id
group by YEAR(O.order_date)
order by YEAR(O.order_date) DESC