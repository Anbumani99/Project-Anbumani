-- Create the database 

-- Connect to the database
\

-- Create the "sales_sample" table
CREATE TABLE sales_sample (
    Product_Id INTEGER,
    Region VARCHAR(50),
    Date DATE,
    Sales_Amount NUMERIC
);

-- Insert 10 sample records
INSERT INTO sales_sample (Product_Id, Region, Date, Sales_Amount)
VALUES
    (101, 'Tamil Nadu', '2024-04-01', 1500.00),
    (102, 'Karnataka', '2024-04-02', 2000.00),
    (103, 'Andhra Pradesh', '2024-04-03', 1800.00),
    (104, 'Telangana', '2024-04-04', 2200.00),
    (105, 'Kerala', '2024-04-05', 1900.00),
    (106, 'Puducherry', '2024-04-06', 1700.00),
    (107, 'Goa', '2024-04-07', 2100.00),
    (108, 'Lakshadweep', '2024-04-08', 2400.00),
    (109, 'Andaman and Nicobar', '2024-04-09', 2300.00),
    (110, 'Maldives', '2024-04-10', 2500.00);

-- OLAP Queries
-- Drill Down (from region to product level)
SELECT Region, Product_Id, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region, Product_Id
ORDER BY Region, Product_Id;

-- Rollup (from product to region level)
SELECT Region, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region
ORDER BY Region;

-- Cube (analyze sales data from multiple dimensions)
SELECT Region, Product_Id, Date, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY ROLLUP (Region, Product_Id, Date)
ORDER BY Region, Product_Id, Date;

-- Slice (extract data for a particular region or date range)
SELECT Region, Date, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
WHERE Region = 'Tamil Nadu'
GROUP BY Region, Date
ORDER BY Date;

-- Dice (view sales for specific combinations)
SELECT Region, Date, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
WHERE Region = 'Karnataka' AND Date = '2024-04-02'
GROUP BY Region, Date;
