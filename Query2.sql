-- 1) List the customer name and the corresponding order numbers, of the customers from New York
Select distinct Cust_Name
From Customers, Orders
Where Customers.Customer_ID = Orders.Customer_ID and Customers.City="New York";
-- 2) List the ids of the customer who are managed by the salesman “Paul Adam”
Select distinct Customer_ID
From Customers, Salesmen
Where Customers.Salesman_ID = Salesmen.Salesman_ID and Salesmen.SName = "Paul Adam";
-- 3) List the ids of the customers who are in Paris and managed by a salesman in Paris
Select Customers.Customer_ID
From Customers, Salesmen
Where Customers.Salesman_ID = Salesmen. Salesman_ID and Customers.City = "Paris" and Salesmen.City = "Paris";
-- 4) List the ids of the customers who are managed by a salesman from the same city
Select Customers.Customer_ID
From Customers, Salesmen
Where Customers.Salesman_ID = Salesmen. Salesman_ID and Customers.City = Salesmen.City;
-- 5) List the order number and the product ids of the products in the order
Select Order_No, Prod_ID
From orderdetails;
-- 6) List the order number and date along with the product ids and price, of the products in the order where the quantity is 2.
Select orders.Order_No, Order_Date, orderdetails.prod_id, products.prod_price, quantity
From Orders, orderdetails, products
WHERE orders.order_no = orderdetails.order_no and orderdetails.prod_id = products.prod_id and quantity=2; 
-- other way
Select orders.Order_No, Order_Date, orderdetails.prod_id, products.prod_price, quantity
From (Orders natural Join OrderDetails) natural Join products
WHERE quantity=2;
-- 7) List the numbers of the orders that include the item monitor
Select Orderdetails.Order_No
From Orderdetails, Products
Where Orderdetails.Prod_Id = Products.Prod_ID and Prod_Name = "Monitor";
-- 8) List the name of the salesman that manages customers who ordered the item monitor
Select Slaesmen.Name
From Salesmen, Orders, Orderdetails, Products
Where Salesmen.Salesman_Id = Orders.Salesman_ID and Orders.Ord_No = Orderdetails.Order_No and Orderdetails.Prod_ID = products.Prod_ID and products.Prod_Name = “Monitor”
-- 9) List the name of the customer from London who ordered a mouse
Select Customers.Cust_Name
From Customers, Orders, Orderdetails, Products
Where Customers.Customer_ID  = Orders.Customer_ID and Orders.Ord_No = Orderdetails.Order_No and Orderdetails.Prod_ID = Products.Prod_ID and Products.Prod_Name = “mouse” and customers.city = “London”
-- 10) Repeat problem 6 using nested queries
Select Order_No, Order_Date
From Orders 
where Order_no IN
		Select (Order_no 
From Orderdetails
Where Quantity =2);
-- 11) Repeat problem 7 using nested queries
Select Ord_no 
From Orderdetails
Where Prod_id IN
(Select Prod_Id
From Products
Where Prod_Name = “Monitor”);
-- 12) Repeat problem 8 using nested queries
Select Salesman.Name
From Salesmen 
Where salesman_id IN 
		(Select salesman_id 
		From Orders
		Where Order_No IN
				(Select Order_No
				From Orderdetails
				Where Prod_Id IN
					(Select Prod_Id 
					From Products
					Where Prod_Name = “Monitor”)));
-- 13) Repeat problem 9 using nested queries
Select Cust_Name, City
From Customer 
Where city =”London” and Customer_id IN 
		(Select Customer_Id
		From Orders
		Where Ord_No IN
				(Select Ord_No
				From Orderdetails
				Where Prod_Id IN
					(Select Prod_Id 
					From Products
					Where Prod_Name = “Mouse”)));
