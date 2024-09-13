use walmart;
SELECT * FROM WALMARTData;

SELECT * FROM WalmartData
WHERE Branch = 'A';

SELECT Product_Line, SUM(Total) AS Total_Sales
FROM WalmartData
GROUP BY Product_Line;

SELECT * FROM WalmartData
WHERE Payment = 'Cash';

SELECT City, SUM(gross_income) AS Total_Gross_Income
FROM WalmartData
Group By City;

SELECT Branch, AVG(Rating) AS Average_Rating
FROM WalmartData
GROUP BY Branch;

SELECT Product_Line, SUM(Quantity) AS Total_Quantity
FROM WalmartData
Group By Product_Line;

SELECT Product_Line, SUM(Unit_Price) AS Total_Unit_Price
FROM WalmartData
GROUP BY Product_Line
ORDER BY Total_Unit_Price DESC
LIMIT 5;

SELECT * FROM WalmartData
WHERE (Gross_income > 30);

SELECT * FROM WalmartData
WHERE DAYOFWEEK(STR_TO_DATE(Date, '%d-%m-%y')) IN (1, 7);

SELECT 
MONTH(STR_TO_DATE(Date, '%d-%m-%y')) AS Sale_Month,
SUM(Total) AS Total_Sales, 
SUM(Gross_income) AS Total_Gross_Income
FROM WalmartData
Group By Sale_Month;

SELECT COUNT(*) AS Transactions_After_6PM
FROM WalmartData
WHERE TIME(time) > '18:00:00';

SELECT *
FROM WalmartData
WHERE Total > (SELECT AVG(Total) FROM WalmartData);

SELECT Branch, Date, Gross_Income,
SUM(Gross_Income) OVER (PARTITION BY Branch ORDER BY Date) AS Cumulative_Gross_Income
FROM WalmartData
ORDER BY Branch, Date;

SELECT Customer_type, SUM(cogs) AS COGS
FROM WalmartData
GROUP BY Customer_type;