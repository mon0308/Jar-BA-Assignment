SELECT o.City, o.State, 
                  SUM(d.Amount) AS Total_Sales, 
                  SUM(d.Profit) AS Total_Profit,
                  (SUM(d.Profit) / SUM(d.Amount)) * 100 AS Profit_Margin
       FROM List_of_Orders o
       JOIN Order_Details d ON o.Order_ID = d.Order_ID
       GROUP BY o.City, o.State
       ORDER BY Total_Profit ASC
       LIMIT 10;
