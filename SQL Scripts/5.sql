-- Get the Underperforming Category
SELECT Category, SUM(Profit) AS Total_Profit
FROM Order_Details
GROUP BY Category
ORDER BY SUM(Profit) ASC
LIMIT 1;
