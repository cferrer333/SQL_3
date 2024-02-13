
-- Question 1
select first_name, last_name, district
from customer
inner join address
on customer.address_id = address.address_id
where district like 'Texas'

-- Question 2
select first_name, last_name, amount
from customer
inner join payment
on customer.customer_id = payment.customer_id 
where amount > 6.99

-- Question 3 
select first_name, last_name, amount
from customer
inner join payment
on customer.customer_id = payment.customer_id 
where amount in ( 
	select amount
	from payment
	where amount > 175
);

-- Question 4
select first_name, last_name, country
from customer
inner join address
on customer.address_id = address.address_id 
inner join city
on address.city_id = city.city_id 
inner join country
on city.country_id = country.country_id
where country = 'Nepal'

-- Question 5
select first_name, last_name, num_transactions from
	(select first_name, last_name, count(payment.staff_id) as num_transactions 
	from staff
	inner join payment
	on staff.staff_id = payment.staff_id
	group by 1,2) sub
group by 1,2,3

-- Question 6
select rating, num_rating from
	(select rating, count(rating) as num_rating
	from film
	group by 1) sub
group by 1, 2

-- Question 7
select first_name,last_name from
	(select first_name, last_name, amount
	from customer
	inner join payment
	on customer.customer_id = payment.customer_id
	where amount > 6.99
	group by 1,2,3) sub
group by 1,2

-- Question 8
select count(payment_id) as free_rentals_count
from payment
where amount in (
	select amount
	from payment
	where amount < 0.01)
