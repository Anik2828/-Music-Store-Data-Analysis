Q1.Who is the senior most employee based on job title?

SELECT * FROM employee
ORDER BY levels DESC
LIMIT 1

Q2.WHich country have the most invoices?

SELECT COUNT(*) ,billing_country
FROM invoice
GROUP BY billing_country
ORDER BY count DESC

Q3.What are top 3 values of total invoices?

SELECT total FROM invoice
ORDER BY total DESC
LIMIT 3

Q4.Return the one city that has high sum invoie total ?

SELECT SUM(total) AS s ,billing_city 
FROM invoice
GROUP BY billing_city
ORDER BY s DESC
LIMIT 1

Q5.Who is the best customer?The customer who spend the most money has diclared as a best customer.

SELECT c.customer_id,c.first_name,c.last_name,SUM(i.total) AS total 
FROM customer AS c
INNER JOIN invoice AS i
ON c.customer_id=i.customer_id 
GROUP BY c.customer_id
ORDER BY total DESC
LIMIT 1





