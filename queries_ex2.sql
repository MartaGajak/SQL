--  databse from https://dev.mysql.com/doc/index-other.html

USE sakila;

-- 1.	Ile mamy kategorii filmów?
select count(*) from category;

-- 1a. Jakie mamy kategorie filmów?
select distinct name from category order by name;

-- 2.	Ilu mamy klientów?
select count(*) from customer;

-- 3.	Ilu mamy aktywnych klientów?
select count(*) from customer where active = 1;

-- 4.	Jakie są najpopularniejsze imiona wśród naszych klientów?
select first_name, count(*) as first_name_ilosc from customer group by first_name order by first_name_ilosc desc;

-- 5.	Ile mamy filmów?
select count(*) from film;

-- 6.	Jakie są klasyfikacje (rating) filmów?
select distinct rating from film;

-- 7.	Ile jest klasyfikacji filmów?
select rating, count(*) rating from film group by rating order by rating;

-- 8.	Jaki jest najdłuższy film?
select title, length from film order by length desc;

-- 9.	Jaki jest najkrótszy film?
select title, length from film order by length asc;

-- 10.	Jaka jest średnia długość filmu?
select avg(length) from film;

-- 11.	Ile jest filmów, które mają w opisie słowo 'Boy'
select count(*) from film where description like '%boy%';

-- 12.	Ile jest filmów, które mają w opisie słowo 'Girl'
select count(*) from film where description like '%girl%';

-- 13.	Ile jest filmów, które mają w opisie słowa 'Boy' i 'Girl'
select count(*) from film where description like '%boy%' and description like '%girl%';

-- 14.	Kto wystąpił w największej ilości filmów?
select * from actor where actor_id = 
(select actor_id from film_actor group by actor_id order by count(*) desc limit 1);

-- 15.	* W jakim mieście znajduje się sklep który ma najwięcej klientów?
