-- 1. Creating a database named "database_assignment"

CREATE DATABASE  database_assignment

-- 2. create a table named customers:

CREATE TABLE customers
(
First_Name VARCHAR(50),
Last_Name VARCHAR(50),
Date_of_Birth DATE,
Phone VARCHAR(50),
Address VARCHAR(50),
City VARCHAR(50),
State VARCHAR(50),
Points INT
);

-- 3. inserting the following customer data:

INSERT INTO customers (First_Name, Last_Name, Date_of_Birth, Phone, Address, city, State, Points) VALUES
('Babara', 'MacCaffrey', '1986-03-28', '781-932-9754', '0 Sage Terrace', 'Waltham', 'MA', 2273),
('Ines', 'Brushfield', '1986-04-13', '804-427-9456', '14187 Commercial Trail', 'Hampton', 'VA', 947),
('Freddi', 'Boagey', '1985-02-07', '719-724-7869', '251 Springs Junction', 'Colorado Springs', 'CO', 2967),
('Ambur', 'Roseburgh','1974-04-14', '407-231-8017', '30 Arapahoe Terrace', 'Orlando', "FL", 457),
('Clemmie','Betchley', '1973-11-07','', '5 Spohn Circle','Arlington', 'TX',675)
;

SELECT * FROM customers

-- 4.Showing only 2 members whose points are more than 1000

SELECT * FROM customers
WHERE points>1000
LIMIT 2;

-- 5. Finding the customers whose age is in 1980 to 1990 or points less than 1000

SELECT * FROM customers
WHERE Date_of_Birth BETWEEN '1980-01-01' AND '1990-01-01'
OR points <1000;

-- 6. Order the customers by points in ascending order

SELECT * FROM customers ORDER BY points;

-- 7. Find the customer whose name contains 'burgh' using Regular Expression.

SELECT * FROM customers WHERE Last_Name REGEXP 'burgh';

-- 8. Find the customer who does not have phone number.

SELECT * FROM customers WHERE phone='';

-- 9. Change the '`Date_of_Birth` column name into 'dob'.

ALTER TABLE customers CHANGE Date_of_Birth dob DATE;

-- 10. Find the max point holder customer name.

SELECT First_Name AS 'Name' FROM customers WHERE Points=(SELECT MAX(Points) FROM customers);	
SELECT CONCAT(First_Name, ' ',Last_Name) AS 'Name' FROM customers WHERE Points=(SELECT MAX(Points) FROM customers);	

-- 11. Execute a query for the following scenario.
   -- If customers have points less than 1000, they are bronze member.
   -- If customers have points more than 1000 and less than 2000, they are silver member.
   -- If customers have points more than 2000 and less than 3000, they are gold member.
   -- If customers have points more than 3000, they are platinum member.

SELECT CONCAT(First_Name,' ',Last_Name) AS 'Name',points,
CASE
	WHEN Points<1000 THEN 'They are Bronze Member.'
	WHEN Points>=1000 AND Points<2000 THEN 'They are Silver Member.'
	WHEN Points>=2000 AND Points<3000 THEN 'They are Gold Member.'
	ELSE 'They are Platinum Member.'
END AS Membership FROM customers;
