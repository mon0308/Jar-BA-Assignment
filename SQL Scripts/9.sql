WITH TopStates AS (
    SELECT COALESCE(NULLIF(State, ''), 'Unknown') AS State
    FROM List_of_Orders
    GROUP BY State
    ORDER BY COUNT(Order_ID) DESC
    LIMIT 5
)
SELECT COALESCE(NULLIF(o.State, ''), 'Unknown') AS State, 
       SUM(d.Amount) AS Total_Sales, 
       AVG(d.Profit) AS Avg_Profit
FROM List_of_Orders o
JOIN Order_Details d ON o.Order_ID = d.Order_ID
WHERE COALESCE(NULLIF(o.State, ''), 'Unknown') IN (SELECT State FROM TopStates)
GROUP BY State
ORDER BY Total_Sales DESC;
