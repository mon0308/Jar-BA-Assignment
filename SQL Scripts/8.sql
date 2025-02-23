SELECT State, COUNT(Order_ID) AS Order_Count
FROM List_of_Orders
GROUP BY State
ORDER BY Order_Count DESC
LIMIT 5;
