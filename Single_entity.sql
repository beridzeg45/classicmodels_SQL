# Single entity

-- Prepare a list of offices sorted by country, state, city.
select *
from offices
order by country,state,city;

-- How many employees are there in the company?
select count(distinct employeenumber) 
from employees;

-- What is the total of payments received?
select concat("$ ",format(sum(amount),2)) as totalrecieved
from payments;

-- List the product lines that contain 'Cars'.
select *
from products
where productLine like "%cars%";

-- Report total payments for October 28, 2004.
#First way:
select concat("$ ",format(sum(amount),2)) as amount
from payments
where year(paymentdate)=2004 and 
monthname(paymentdate)="october" and 
day(paymentdate)=28;
#Second way:
select concat("$ ",format(sum(amount),2)) as amount
from payments
where paymentDate="2004-10-28";

-- Report those payments greater than $100,000.
select *
from payments
where amount > 100000
order by amount asc;

-- List the products in each product line.
select productline,group_concat(productcode) as products_within_productline
from products
group by productLine;

-- How many products in each product line?
select productLine, count(productcode)
from products
group by productline;

-- What is the minimum payment received?
select min(amount)
from payments;

-- List all payments greater than twice the average payment.
select *
from payments
where amount >
(select avg(amount) from payments)*2
order by 3;

-- What is the average percentage markup of the MSRP on buyPrice?
select concat(round(avg((MSRP-buyPrice)/buyprice)*100,2)," %") as "avg markup"
from products;

-- How many distinct products does ClassicModels sell?
select count(distinct productcode)
from products;

-- Report the name and city of customers who don't have sales representatives?
select customername, city
from customers
where salesRepEmployeeNumber is null;

-- What are the names of executives with VP or Manager in their title? 
-- Use the CONCAT function to combine the employee's first name and last name into a single field for reporting.
select concat(firstname," ",lastname) as fullname, jobtitle
from employees
where jobtitle like "%vp%" or jobTitle like "%manager%";

-- Which orders have a value greater than $5,000?
select *
from orderdetails
where quantityOrdered*priceEach>5000;
