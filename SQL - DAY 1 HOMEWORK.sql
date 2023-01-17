-- First query, we will select all the records from the actor table
select * from actor 

-- Query for first_name and last_name in the actor table 
select first_name, last_name
from actor;

-- Query for a first_name that equals Nick using the WHERE clause
select first_name, last_name
from actor 
where first_name like 'Nick';

-- Query for all first_name data that starts with a J using LIKE and WHERE clauses and a wildcard
select first_name,actor_id
from actor
where first_name like 'J%';

-- Query for all first_name data that starts with K and has 2 letters after the K again using lik and where clauses and the underscore
select first_name, actor_id
from actor
where first_name like 'K__';

-- Query for all first_name data that starts with a K and ends with th
-- We will use the LIKE and Where clauses using both wildcard and the underscore
select first_name, last_name, actor_id
from actor
where first_name like 'K__%th'

-- Comparing operators
-->, <, >=, <=, <>
--Explore data with select all query so that we can change into a new table
select * from payment 

-- Query for data that shows customers who paid an amount GREATER than $2
select customer_id, amount
from payment  
where amount > 2.00;

-- Query for data that shows customers who paid an amount less that 7.99
select customer_id, amount
from payment
where amount < 7.99

-- Query for less than or equal to 7.99
select customer_id, amount
from payment
where amount <= 7.99

-- Query for data that shows customers who paid an amount not equal to $0.00 ordered in DESCENDING order 
select customer_id, amount
from payment p where amount <> 0.00
order by amount desc;


-- SQL Aggregate Functions! Sum, avg, count, min, max
-- Query to display the sum of amounts paid that are greater than 5.99
select sum(amount)
from payment
where amount > 5.99;

-- Query to display the average of amounts paid greater than 5.99
select avg(amount)
from payment 
where amount > 5.99;

-- Query to display the count of amounts paid greater than 5.99
select count(amount) from payment where amount > 5.99;

-- Query to display the count of DISTINCT amounts paid greater than 5.99
select count(distinct amount)
from payment where amount > 5.99;

-- Query to display the min amount greater than 7.99
select min(amount) as min_num_payments
from payment 
where amount > 7.99;

-- Query to display max amount greater than 7.99
select max(amount) as max_num_payments
from payment 
where amount > 7.99;

-- DEmo of groupby
select amount
from payment
where amount = 7.99;

--Query to display different amounts grouped together
--and count the amounts
select amount, count(amount)
from payment 
group by amount 
order by amount;

-- Query to display customer ids with the summed amounts for each customer id
select customer_id, sum(amount)
from payment
group by customer_id 
order by customer_id desc;

--SQL HOMEWORK

--1. How many actors are there with the last name ‘Wahlberg’? 
select last_name from actor 
where last_name like  'Wahlberg';

--2. How many payments were made between $3.99 and $5.99?

select count(amount) from payment 
where amount > 3.99 and amount < 5.99;

--3. What film does the store have the most of? (search in inventory)

select film_id, count(film_id) from inventory
group by film_id 
order by count(film_id) desc

--4. How many customers have the last name ‘William’?

select last_name from customer
where last_name like 'William';

--5. What store employee (get the id) sold the most rentals?

select staff_id, count(staff_id) from payment
group by staff_id 

--6. How many different district names are there?

select district from address
group by district


--7. What film has the most actors in it? (use film_actor table and get film_id)

select count(actor_id), film_id  from film_actor
group by film_id 
order by count(actor_id) desc

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

select last_name, store_id from customer
where store_id = 1 and last_name like '%es';

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers 
--with ids between 380 and 430? (use group by and having > 250)

SELECT customer_id, payment_id, amount
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY payment_id
HAVING COUNT(amount) > 250


--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?

select rating, count(rating) from film
group by rating
order by count(rating) desc

