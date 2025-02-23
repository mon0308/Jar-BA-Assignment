SELECT o.*, d.Category, d.Amount, d.Profit
FROM List_of_Orders o
JOIN Order_Details d ON o.Order_ID = d.Order_ID;
