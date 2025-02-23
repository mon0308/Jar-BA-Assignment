WITH MonthlySales AS (
    SELECT DATE_FORMAT(STR_TO_DATE(CONCAT('01-', Month_of_Order_Date), '%d-%b-%y'), '%Y-%m') AS Month, 
           SUM(Target) AS Total_Sales
    FROM Sales_Target
    WHERE Category = 'Furniture'
    GROUP BY DATE_FORMAT(STR_TO_DATE(CONCAT('01-', Month_of_Order_Date), '%d-%b-%y'), '%Y-%m')
),
MoM_Calculations AS (
    SELECT Month,
           Total_Sales,
           LAG(Total_Sales) OVER (ORDER BY STR_TO_DATE(Month, '%Y-%m')) AS Previous_Month_Sales,
           ((Total_Sales - LAG(Total_Sales) OVER (ORDER BY STR_TO_DATE(Month, '%Y-%m'))) / 
           NULLIF(LAG(Total_Sales) OVER (ORDER BY STR_TO_DATE(Month, '%Y-%m')), 0)) * 100 AS MoM_Change
    FROM MonthlySales
)
SELECT * 
FROM MoM_Calculations
WHERE ABS(MoM_Change) > 20;
