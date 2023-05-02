--Discovering date ranges
select max(date_week), min(date_week) from marketingdata m 

--Example Problem 
select sum(total_visitor_transactions), sum(total_visitor_transactions - transactions) as "Incremental Bookings Count" from pageviewdata 

--Q1
select "source", sum("transactions"), sum("totalTransactionRevenue") from marketingdata m group by 1 
order by sum("totalTransactionRevenue") DESC;

--Q2
select "source", medium, referralPath, sum("bounces") from marketingdata m group by 1 
order by sum("BOUNCES") DESC;

select distinct medium, sum("bounces") from marketingdata m group by 1 
order by sum("BOUNCES") DESC;

--Q3
SELECT CAST( ROUND(transactions *1.00 / visits, 2) AS FLOAT) as "Conversion Rate", visits , transactions , isMobile, "source" , medium , referralPath , totalTransactionRevenue 
FROM marketingdata m order by "Conversion Rate" desc

--Q4
SELECT distinct pagePath, count(pagePath) as "Count of Page Path" FROM pageviewdata p 
where transactions != ''
group by 1
order by "Count of Page Path" desc

SELECT count(distinct pagePath)  FROM pageviewdata p 
where transactions != ''

--Q5
SELECT DISTINCT  pagePath, count(pagePath), (total_visitor_transactions - transactions) as "Incremental Bookings" from pageviewdata 
where visitNumber > 1 and total_visitor_transactions > transactions group by 1
order by "Incremental Bookings" desc

SELECT DISTINCT  pagePath, count(pagePath) as "Page Path Count", (total_visitor_transactions - transactions) as "Incremental Bookings" from pageviewdata 
where visitNumber > 1 and total_visitor_transactions > transactions group by 1
order by "Page Path Count" desc

