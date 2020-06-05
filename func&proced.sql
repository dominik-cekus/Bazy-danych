
 --1----------------------------------
BEGIN
SELECT AVG(pay.Rate) AS placa FROM [AdventureWorks2017].[HumanResources].[EmployeePayHistory] pay
SELECT * FROM [AdventureWorks2017].[HumanResources].[Employee] employee JOIN [AdventureWorks2017].[HumanResources].[EmployeePayHistory] pay
ON pay.BusinessEntityID = employee.BusinessEntityID WHERE pay.Rate < (SELECT AVG(pay.Rate) FROM [AdventureWorks2017].[HumanResources].[EmployeePayHistory] pay)
END

--2-----------------------------------

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'SalesOrderHeader'

CREATE FUNCTION Order_date (@order_number NVARCHAR(25))
RETURNS TABLE AS
RETURN
(SELECT sales_order.ShipDate FROM [AdventureWorks2017].[Sales].[SalesOrderHeader] sales_order
WHERE sales_order.SalesOrderNumber = @order_number)

SELECT * FROM Order_date('SO43669')
--3---------------------------------

CREATE PROCEDURE Product_details (@product_name nvarchar(50))
AS
SELECT product.ProductID,product.name,product.MakeFlag FROM [AdventureWorks2017].[Production].[Product] product 
WHERE product.Name = @product_name

EXEC Product_details 'Bearing Ball'

--4---------------------------------

CREATE FUNCTION Card_number (@order_number NVARCHAR(25))
RETURNS TABLE AS
RETURN
(SELECT credit_card.CardNumber FROM [AdventureWorks2017].[Sales].[SalesOrderHeader] sales_order JOIN [AdventureWorks2017].[Sales].[CreditCard] credit_card
ON sales_order.CreditCardID = credit_card.CreditCardID WHERE sales_order.SalesOrderNumber = @order_number)

SELECT * FROM card_number('SO43669')

--5----------------------

CREATE PROCEDURE Dividing (@num1 FLOAT,@num2 FLOAT)
AS
IF @num1>@num2
BEGIN
	SELECT @num1/@num2
END
ELSE
BEGIN
	RAISERROR('Niew³aœciwie zdefiniowa³eœ dane wejœciowe',16,1)
END

EXEC Dividing 3,4