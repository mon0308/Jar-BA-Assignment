SELECT State, SUM(Profit) AS Total_Profit
FROM List_of_Orders o
JOIN Order_Details d ON o.Order_ID = d.Order_ID
GROUP BY State
ORDER BY Total_Profit ASC
LIMIT 5;
