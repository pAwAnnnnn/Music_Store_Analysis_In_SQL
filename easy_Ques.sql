Q1: Who is the senior most employee on basis of job title?

SELECT * FROM employee
ORDER BY levels desc
limit 1



Q2: Which contry have the most invoices?

SELECT COUNT(*) as X , billing_country
FROM invoice
GROUP BY billing_country
ORDER BY X desc



Q3: What are top 5 values of total invoice?

SELECT total FROM invoice
ORDER BY total desc
limit 5

Q4: Which city has the best customers? We would like to throw
	a promotional Music Festival in the city we made the most money. 
	Write the query that returns one city we made the most money. 
	Write the query that returns one city that has the highest sum of invoice totals. 
	Return both the city name & sum of all invoice totals


SELECT SUM(total) as INVOICE_TABLE , billing_city
FROM invoice
GROUP BY billing_city
ORDER BY INVOICE_TABLE desc


Q5: Who is the best customer? The person who has spent the most money will be declared as best customer.
	Write the query that return the person who has sent the most money.

SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) as TOTAL
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY TOTAL DESC
limit 1