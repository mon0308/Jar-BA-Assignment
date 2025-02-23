SELECT Category, 
       SUM(Profit) AS Total_Profit,
       AVG(Profit) AS Avg_Profit_Per_Order,
       (SUM(Profit) / SUM(Amount)) * 100 AS Profit_Margin
FROM Order_Details
GROUP BY Category;
