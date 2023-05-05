-- Problem 1 & 2
-- 1. Using JOINs in a single query, combine data from all three tables (employees, products, sales) to view all sales with complete employee and product information in one table.
-- SELECT * FROM sales;
-- SELECT * FROM products;
-- SELECT * FROM employees;
SELECT * FROM sales INNER JOIN products ON sales.ProductID = products.ProductID INNER JOIN employees ON sales.SalesPersonID = employees.EmployeeID;
 
-- 2a. Create a View for the query you made in Problem 1 named "all_sales"
-- NOTE: You'll want to remove any duplicate columns to clean up your view!
-- CREATE VIEW all_sales AS SELECT SalesID, CustomerID, Quantity, Name , Price, FirstName,MiddleInitial, LastName FROM sales INNER JOIN products ON sales.ProductID = products.ProductID INNER JOIN employees ON sales.SalesPersonID = employees.EmployeeID;




-- 2b. Test your View by selecting all rows and columns from the View
SELECT * FROM all_sales;

-- Problem 3
-- Find the average sale amount for each sales person
SELECT AVG(Price), Firstname, MiddleInitial, Lastname FROM all_sales GROUP BY Firstname, MiddleInitial, Lastname;

-- Problem 4
-- Find the top three sales persons by total sales
SELECT SUM(Price), Firstname, MiddleInitial, Lastname FROM all_sales GROUP BY Firstname, MiddleInitial, Lastname ORDER BY SUM(Price) DESC LIMIT 3;

-- Problem 5
-- Find the product that has the highest price
SELECT MAX(Price),Name FROM all_sales GROUP BY Name ORDER BY MAX(Price) DESC LIMIT 1;
-- Problem 6
-- Find the product that was sold the most times
SELECT Min(Quantity),Name FROM all_sales GROUP BY Name ORDER BY Min(Quantity) ASC LIMIT 1;
-- Problem 7
-- Using a subquery, find all products that have a price higher than the average price for all products
SELECT Name, Price FROM all_sales WHERE Price > (SELECT AVG(Price) FROM all_sales) ORDER BY Price DESC;
-- Problem 8
-- Find the customer who spent the most money in purchased products
SELECT CustomerID,SUM(Price) FROM all_sales GROUP BY CustomerID ORDER BY SUM(Price)DESC LIMIT 1;
-- Problem 9
-- Find the total number of sales for each sales person
SELECT SUM(Quantity), Firstname, MiddleInitial, Lastname FROM all_sales GROUP BY Firstname, MiddleInitial, Lastname;
-- Problem 10
-- Find the sales person who sold the most to the customer you found in Problem 8
SELECT Firstname, MiddleInitial, Lastname,CustomerID,SUM(Price) FROM all_sales GROUP BY Firstname, MiddleInitial, Lastname,CustomerID ORDER BY SUM(Price)DESC LIMIT 1;