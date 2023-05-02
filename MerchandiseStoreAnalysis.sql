--Discovering date ranges
select max(date_week), min(date_week) from marketingdata m 

--Example Problem 
select sum(total_visitor_transactions), sum(total_visitor_transactions - transactions) as "Incremental Bookings Count" from pageviewdata 

--Q1 Which marketing source delivers the most bookings?
select "source", sum("transactions"), sum("totalTransactionRevenue") from marketingdata m group by 1 
order by sum("totalTransactionRevenue") DESC;

--Q2 How does bounce rate vary by marketing channel (source & medium)? Are the differences significant?
select "source", medium, referralPath, sum("bounces") from marketingdata m group by 1 
order by sum("BOUNCES") DESC;

select distinct medium, sum("bounces") from marketingdata m group by 1 
order by sum("BOUNCES") DESC;

--Q3 Which factors most strongly influence conversion rate (transactions / visit) ?
SELECT CAST( ROUND(transactions *1.00 / visits, 2) AS FLOAT) as "Conversion Rate", visits , transactions , isMobile, "source" , medium , referralPath , totalTransactionRevenue 
FROM marketingdata m order by "Conversion Rate" desc

--Q4 How complex are the paths a user takes to make a booking?
SELECT distinct pagePath, count(pagePath) as "Count of Page Path" FROM pageviewdata p 
where transactions != ''
group by 1
order by "Count of Page Path" desc

SELECT count(distinct pagePath)  FROM pageviewdata p 
where transactions != ''

--Q5 What appears to be the biggest opportunity to drive incremental bookings?
SELECT DISTINCT  pagePath, count(pagePath), (total_visitor_transactions - transactions) as "Incremental Bookings" from pageviewdata 
where visitNumber > 1 and total_visitor_transactions > transactions group by 1
order by "Incremental Bookings" desc

SELECT DISTINCT  pagePath, count(pagePath) as "Page Path Count", (total_visitor_transactions - transactions) as "Incremental Bookings" from pageviewdata 
where visitNumber > 1 and total_visitor_transactions > transactions group by 1
order by "Page Path Count" desc

