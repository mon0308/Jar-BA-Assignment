SELECT Category, SUM(Amount) AS Total_Sales
FROM Order_Details
GROUP BY Category;
