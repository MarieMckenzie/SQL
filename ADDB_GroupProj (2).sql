Create Database ADDB_GroupProj;
Use ADDB_GroupProj;

Create table Customer
(
email_Address varchar(45) primary key
);


Create table customer_Phone
(
email_Address varchar(45) not null,
phone_Number varchar(10) not null,
CONSTRAINT pk_Phone PRIMARY KEY (email_Address, phone_Number),
CONSTRAINT fk_Phone FOREIGN KEY (email_Address) REFERENCES Customer (email_Address)
);

Create table Corporate
(
email_Address varchar(45) not null,
phone_Number varchar(10) not null,
business_Name varchar(40) not null,
contact_Person varchar(40) not null,
CONSTRAINT fk_Corporate FOREIGN KEY (email_Address) REFERENCES Customer (email_Address),
CONSTRAINT fk_Corporate2 FOREIGN KEY (phone_Number) REFERENCES customer_Phone (phone_Number),
CONSTRAINT pk_Corporate PRIMARY KEY (email_Address, phone_Number, business_Name)
);
	
Create Table  Individual
(
TRN int primary key,
fName varchar(25) not null,
lName varchar(25) not null,
email_Address varchar(45) not null,
phone_Number varchar(10) not null,
age int not null,
DOB date not null,
CONSTRAINT fk_Individual FOREIGN KEY (email_Address) REFERENCES Customer (email_Address),
CONSTRAINT fk_Individual FOREIGN KEY (phone_Number) REFERENCES customer_Phone (phone_Number)
);

Create table Product
(
product_Code int primary key,
product_Name varchar(20) not null,
unit_Price float not null,
quantity_in_store int not null
);

Create table Orders
(
order_ID int not null,
email_Address varchar(45) not null,
cost float not null,
GCT float not null,
delivery_Status varchar(10),
order_Date date not null,
product_Code int not null,
CONSTRAINT fk_Order FOREIGN KEY (email_Address) REFERENCES Customer (email_Address),
CONSTRAINT fk_Order2 FOREIGN KEY (product_Code) REFERENCES Product (product_Code),
CONSTRAINT pk_Order PRIMARY KEY (order_ID, email_Address, product_Code)
);

Create table product_Order
(
employee_TRN int not null,
product_Code int not null,
order_ID int not null,
product_quantity int not null
CONSTRAINT fk_product_Order FOREIGN KEY (product_Code) REFERENCES Product (product_Code),
CONSTRAINT fk_product_Order2 FOREIGN KEY (order_ID) REFERENCES Orders (order_ID),
CONSTRAINT fk_Product_Order3 FOREIGN KEY (employee_TRN) REFERENCES Employee (employee_TRN),
CONSTRAINT pk_product_Order PRIMARY KEY (product_Code, order_ID, product_quantity, employee_TRN)
);

Create table Ingredient
(
ingredient_ID int primary key,
ingredient_Name varchar(20) not null,
measurement_Unit int not null,
reorder_level int not null,
quantity_to_make int not null,
);

Create table product_Ingredient
(
product_Code int not null,
ingredient_ID int not null,
receipes varchar(50) not null,
quantity_Used int not null,
CONSTRAINT fk_product_Ingredient FOREIGN KEY (product_Code) REFERENCES Product (product_Code),
CONSTRAINT fk_product_Ingredient2 FOREIGN KEY (ingredient_ID) REFERENCES Ingredient (ingredient_ID),
CONSTRAINT pk_product_Ingredient PRIMARY KEY (product_Code, ingredient_ID, receipes)
);

Create table Employee
(
employee_TRN int primary key,
employee_Name varchar(40) not null,
employee_address varchar(50) not null,
employee_email varchar(45) not null,
phone integer,
supID int,
CONSTRAINT fk_Employee FOREIGN KEY (supID) REFERENCES Employee (employee_TRN)
);


Create table employee_Manages
(
supID int not null,
startDate date not null,
endDate date not null
CONSTRAINT fk_employee_Manages FOREIGN KEY (supID) REFERENCES Employee (employee_TRN) 
);

Insert into Customer (email_Address)
values
('sweetbites@gmail.com'),
('sugarrush101@hotmail.com'),
('sososweet@yahoo.com'),
('pastrylove@gmail.com'),
('ilovesweets@hotmail.com'),
('asiapowers@yahoo.com'),
('alexistruemahn@gmail.com'),
('chrystaljoyner@gmail.com'),
('kadeemwilliams@hotmail.com'),
('richardgraham@yahoo.com')

Insert into customer_Phone(email_Address,phone_Number)
values
('sweetbites@gmail.com', '8769924507'),
('sugarrush101@hotmail.com', '8769899743'),
('sososweet@yahoo.com', '8767897726'),
('pastrylove@gmail.com', '8769098432'),
('ilovesweets@hotmail.com', '8767098321'),
('asiapowers@yahoo.com', '8762235839'),
('alexistruemahn@gmail.com', '8765860712'),
('chrystaljoyner@gmail.com', '8767713293'),
('kadeemwilliams@hotmail.com', '8768024831'),
('richardgraham@yahoo.com', '8763759034')

Insert into Corporate(email_address, phone_Number, business_Name, contact_Person)
values
('sweetbites@gmail.com', '8769924507', 'Sweet Bites', 'Kehlani Irving'),
('sugarrush101@hotmail.com', '8769899743', 'Sugar Rush', 'Jada Brooks'),
('sososweet@yahoo.com', '8767897726', 'SO SO Sweet', 'Stephanie Temple'),
('pastrylove@gmail.com', '8769098432', 'Lovers4Pastry', 'Jamal Bozzer'),
('ilovesweets@hotmail.com', '8767098321', 'I Love Sweets', 'Kimani Harden')

Insert into Individual(TRN, fName, lName, email_Address, phone_Number, age, DOB)
values
(112842774, 'Asia', 'Powers', 'asiapowers@yahoo.com', '8762235839', 25, '02/11/1994'),
(101842521, 'Alexis', 'Truemahn', 'alexistruemahn@gmail.com', '8765860712', 27, '01/19/1992'),
(153885295, 'Chrystal', 'Joyner', 'chrystaljoyner@gmail.com', '8767713293', 30, '04/27/1988'),
(183294628, 'Kadeem', 'Williams', 'kadeemwilliams@hotmail.com', '8768024831', 33, '11/30/1985'),
(100383472, 'Richard', 'Graham', 'richardgraham@yahoo.com', '8763759034', 47, '08/23/1971')

Insert into Product(product_Code, product_Name, unit_Price, quantity_in_store)
values
(1031, 'Spice Bun', 50.75, 100),
(8023, 'Cinnamon Bun', 55.25, 75),
(8071, 'Cheese Bread', 47.50, 120),
(1053, 'Canberry Loaf', 73.80, 30),
(8097, 'Coconut Loaf', 68.35, 50),
(1098, 'Strawberry Cupcake', 25.25, 80)

Insert into Orders(order_ID, email_Address, cost, GCT, delivery_Status, order_Date, product_Code)
values
(107853, 'asiapowers@yahoo.com', 50.75, 16.5, 'Delivered', '03/12/2018', 1031),
(107857, 'pastrylove@gmail.com', 50.75, 16.5, 'Delivered', '12/16/2018', 1053),
(107859, 'sweetbites@gmail.com', 73.80, 16.5, 'Ordered', '01/22/2019', 8023),
(107902, 'ilovesweets@hotmail.com', 55.25, 16.5, 'In Transit', '12/31/2019', 1031),
(107918, 'alexistruemahn@gmail.com', 47.50, 16.5, 'Delivered', '08/20/2018', 1053),
(107944, 'sugarrush101@hotmail.com', 25.25, 16.5, 'Ordered', '01/29/2019', 1053),
(107957, 'kadeemwilliams@hotmail.com', 55.25, 16.5, 'In Transit', '01/11/2019', 8023),
(107981, 'chrystaljoyner@gmail.com', 68.35,  16.5, 'Ordered', '01/25/2019', 8097),
(107990, 'richardgraham@yahoo.com', 25.25, 16.5, 'In Transit', '01/27/2019', 8097),
(107996, 'sososweet@yahoo.com', 50.75, 16.5, 'Delivered', '11/19/2018', 1098)

Insert into product_Order(employee_TRN, product_Code, order_ID, product_quantity)
values
(132147, 1031, 107853, 5),
(113410, 1053, 107857, 2),
(131029, 8023, 107859, 1),
(128765, 1031, 107902, 5),
(121302, 1053, 107918, 3),
(139411, 1053, 107944, 4),
(116633, 8023, 107957, 1),
(132594, 8097, 107990, 5),
(117876, 8097,107981, 2),
(125658, 1098, 107996, 3)


Insert into Ingredient (ingredient_ID, ingredient_Name, measurement_Unit, reorder_level, quantity_to_make)
values
(1033, 'Egg', 12, 5, 3),
(1048, 'Sugar', 9, 2, 1),
(1076, 'Flour', 4, 3, 2),
(1024, 'Yeast', 2, 1, 5),
(1051, 'Oil', 9, 2, 80),
(1055, 'Butter', 7, 2, 1),
(1021, 'Vanilla', 3, 1, 1),
(1253, 'Cheese', 4, 2, 1),
(1101, 'Cinnamon', 6, 2, 20)

Insert into product_Ingredient (product_Code, ingredient_ID, receipes, quantity_Used)
values
(1031,1033, 'Spice Bun',1),
(1031,1048, 'Spice Bun',7),
(1031,1076, 'Spice Bun',2),
(1031,1051, 'Spice Bun',6),
(1031,1055, 'Spice Bun',1),
(8023,1033, 'Cinnamon Bun',2),
(8023,1048, 'Cinnamon Bun',5),
(8023,1076, 'Cinnamon Bun',3),
(8023,1051, 'Cinnamon Bun',4),
(8023,1055, 'Cinnamon Bun',2),
(8023,1101, 'Cinnamon Bun',5)

Insert into Employee (employee_TRN, employee_Name, employee_address, employee_email, phone, supID)
values
(131029,'Phil Brown', '1 Orange Street','pBrown@emaildata.com', 3331111, 131029),
(113410,'Kim Smith', '42 6th Avenue','kSmith@emaildata.com', 3321121, 131029),
(125658,'Joel Andem', '61 Smith Street','jAndem@emaildata.com',3331000, 139411),
(132147,'Joe Brown', '711 Apple Street','jBrown1@emaildata.com', 2390009, 131029),
(117876,'Simone Whyte', '103 Pecan Avenue','sWhyte@emaildata.com', 3255322, 139411),
(128765,'Shantel Witter', '241 University Street','sWitter@emaildata.com', 2342212, 131029),
(132594,'Tom Sanders', '12 Main Street','tSanders@emaildata.com', 2330091, 139411),
(116633,'Baron Black', '31 Ridge Avenue','bBlack@emaildata.com',2131232, 139411),
(121302,'John Quake', '77 Yellow Avenue','jQuake@emaildata.com',2323322, 139411),
(139411,'Carolyn Chin', '93 Blue Street','cChin@emaildata.com',2349099, 139411)

Insert into employee_Manages (supID,startDate, endDate)
values
(131029, '10/12/14', '10/12/20'),
(139411, '10/12/14', '10/12/20')




SELECT * FROM Corporate WHERE email_Address LIKE '%hotmail.com';

SELECT fName, lName, DOB FROM Individual WHERE age <= 30;

SELECT * FROM product_Ingredient WHERE receipes = 'Spice Bun';

SELECT email_Address FROM Orders WHERE delivery_Status = 'Delivered';

SELECT * FROM Ingredient WHERE ingredient_Name LIKE 'C%';

SELECT business_Name, email_Address FROM Corporate WHERE email_Address LIKE 's%';

SELECT product_Code, product_Name, unit_Price FROM Product WHERE unit_Price > 28;

SELECT employee_TRN, employee_Name FROM Employee WHERE employee_email LIKE '%@e%';

SELECT product_Name FROM Product WHERE quantity_in_store > 50;

SELECT * FROM employee_Manages;

-------------------------------------DEMO 2-------------------------------------

------------------------------------STROED PRECEDURES----------------------------


ALTER TABLE Employee ADD Comment varchar(30)

CREATE PROCEDURE dbo.staffChange
(
@ID int
)
AS
BEGIN
	SELECT employee_Name FROM Employee WHERE employee_TRN = @ID
	UPDATE Employee SET Comment = 'Next Manager' WHERE employee_TRN = @ID
	SELECT * FROM Employee WHERE employee_TRN = @ID
END

EXEC dbo.staffChange 128765

--2
CREATE PROCEDURE dbo.contact
(
@dStatus varchar(10)
)
AS
BEGIN
	SELECT o.email_Address
	FROM Orders o 
	WHERE delivery_Status = 'Delivered'
END

EXEC dbo.contact 'Delivered'

--3
CREATE PROCEDURE dbo.delivery_Status
(
@dStatus varchar(10)
)
AS
BEGIN
	SELECT * FROM Orders
	EXEC dbo.contact 'Delivered'
	DELETE FROM Orders WHERE @dStatus = 'Delivered'

END

EXEC dbo.delivery_Status 'Delivered'


ALTER TABLE Employee ADD Department varchar(20)

--4
CREATE PROCEDURE dbo.dept
(
@ID int
)
AS
BEGIN
	SELECT employee_Name, employee_TRN FROM Employee WHERE supID = @ID 
	UPDATE Employee SET Department = 'Production' WHERE supID = @ID
	SELECT employee_Name, employee_TRN, Department FROM Employee WHERE supID = @ID 
END

EXEC dbo.dept 139411

--5
CREATE PROCEDURE dbo.corporate_Orders
(
@business_Name varchar(20)
)
AS
BEGIN
	IF (@business_Name = 'Sweet Bites')
	BEGIN
		SELECT c.contact_Person, c.phone_Number, o.email_Address
		FROM Corporate c
		INNER JOIN Orders o
		ON o.email_Address = c.email_Address
		WHERE @business_Name = c.business_Name
	END
	ELSE
	IF (@business_Name = 'Sugar Rush')
	BEGIN
		SELECT c.contact_Person, c.phone_Number, o.email_Address
		FROM Corporate c
		INNER JOIN Orders o
		ON o.email_Address = c.email_Address
		WHERE @business_Name = c.business_Name
	END
	ELSE 
	IF (@business_Name = 'SO SO Sweet')
	BEGIN
		SELECT c.contact_Person, c.phone_Number, o.email_Address
		FROM Corporate c
		INNER JOIN Orders o
		ON o.email_Address = c.email_Address
		WHERE @business_Name = c.business_Name
	END
	ELSE
	IF (@business_Name = 'Lovers4Pastry')
	BEGIN
		SELECT c.contact_Person, c.phone_Number, o.email_Address
		FROM Corporate c
		INNER JOIN Orders o
		ON o.email_Address = c.email_Address
		WHERE @business_Name = c.business_Name
	END
	ELSE
	IF (@business_Name = 'I Love Sweets')
	BEGIN
		SELECT c.contact_Person, c.phone_Number, o.email_Address
		FROM Corporate c
		INNER JOIN Orders o
		ON o.email_Address = c.email_Address
		WHERE @business_Name = c.business_Name
	END
	ELSE
	BEGIN
		SET @business_Name = 'Business not found'
		PRINT @business_Name
	END
END

EXEC dbo.corporate_Orders 'Lovers4Pastry'


SELECT product_Name,
CASE
	WHEN quantity_in_store < 50
		THEN 'Restock inventory'
	WHEN quantity_in_store < 100
		THEN 'Restock soon'
	WHEN quantity_in_store >=100
		THEN 'Inventory is good'
	ELSE
		'ERROR'
	END AS InventoryNotes
FROM Product

---------------------------FUNCTIONS----------------------------------
--UDF(i)
drop Function Product_valid
Create Function Product_valid(
	@make_d date
)
Returns Varchar(10) 
	As
	Begin
		Declare @output Varchar(10) 
		Declare @years int

		Set @years =  DATEDIFF(YEAR,@make_d, GetDate())
		
		if @years >= 10 
			Begin 
				Set @output = 'Expired'
			End
		Else
			if @years < 10 
			Begin 
				Set @output = 'unexpired'
			End
		return @output
	End
	Select *from product
	SELECT product_name, dbo.Product_valid('01-01-2000') as Creation_date
			FROM product
			where product_name = 'Canberry Loaf'



--ii
Create Function Lifespan(
	@cost float,
	@GCT float
)
RETURNS float
	AS  
	BEGIN  
			DECLARE @amount float
			DECLARE @amt float

			Set @amount = sum(@cost + @GCT)
			RETURN @amount 
	END 

	SELECT email_Address, dbo.Lifespan(cost,gct) as L_Spent
			FROM [Orders]
			where dbo.Lifespan(cost,gct) > 70
			



--iii
CREATE FUNCTION Individual_Sales()
	RETURNS TABLE 
	AS 
	RETURN SELECT email_Address
			FROM Individual
			group by email_Address

	SELECT  Sum(cost+GCT) as Sales 
			from [Orders]  
			INNER JOIN  dbo.Individual_Sales() as Indi
			on 
			Orders.email_Address = Indi.email_Address
			



--iv
Select *From Corporate
Select *From Orders

CREATE FUNCTION Corporate_Sales()
	RETURNS TABLE 
	AS 
	RETURN SELECT email_Address
			FROM Corporate
			group by email_Address

	SELECT  Sum(cost+GCT) as Sales 
			from [Orders]  
			INNER JOIN  dbo.Corporate_Sales() as Ind
			on 
			Orders.email_Address = Ind.email_Address
			


-----------------------------TRANSACTIONS-----------------------------
-- 1 Switch manager Add new manager, Update employees under old manager to new manager, delete old manager.
CREATE PROCEDURE dbo.replace_manager -- & Switch manager
@Id       INT,
@newId	  INT
AS
BEGIN TRY
    BEGIN TRANSACTION
	DECLARE @s_date as DATE;
	DECLARE @e_date as DATE;
		SET @s_date = CONVERT(DATE,GETDATE()) 
		SET @e_date = DATEADD(YEAR, +3, CONVERT(DATE,GETDATE()))
		INSERT INTO employee_Manages (supID, startDate, endDate) values (@newId,@s_date,@e_date)
		UPDATE employee SET supID = @newId WHERE supID=@Id  -- What do we do with employees who were managed by this manager? Switch them over to another?
        DELETE FROM employee_Manages WHERE supID=@Id

        COMMIT
END TRY
BEGIN CATCH
    ROLLBACK
END CATCH
 
EXEC dbo.replace_manager 139411, 121302


 -- 2 Remove Product + Ingredients
CREATE PROCEDURE dbo.remove_product -- Remove product & product ingredients
@o_Id       INT
AS
BEGIN TRY
    BEGIN TRANSACTION
		DELETE FROM product_Ingredient WHERE product_Code = @o_Id 
		DELETE FROM Product WHERE product_Code = @o_Id 
        COMMIT
END TRY
BEGIN CATCH
    ROLLBACK
END CATCH

EXEC dbo.remove_product 1031

CREATE TRIGGER beforeDelete
 ON Orders INSTEAD OF DELETE
  AS 
  Select * from Deleted
 --View delivered products instead of deleting

 
 CREATE TRIGGER beforeInsert
 ON  Product INSTEAD OF INSERT 
 AS 
 Select * from Inserted 
 --Return result of record trying to be entered

 Triggers

drop table Audit_log
Create table Audit_log(

	Number int identity (1,1) primary key,
	Unique_Identifier NVarchar(30),
	Identifier_Type Varchar(17),
	Audit_Action NVarchar(40),
	Action_For Varchar(10),
	Audit_Date date
);

drop Trigger deletedProduct
Create Trigger deletedProduct
ON product
After Delete
As
Begin

	Declare @code Varchar(30);
	Select @code = product_Code from deleted


	Insert Into Audit_log 
	values(@code,'Product Code', 'Deleted', 'Product', GETDATE())
End

insert into product values (1199, 'Rum Cake', 70.9, 20);
delete from product where product_Code = 1199

Select *from Audit_log
Select *from product




 

drop TRIGGER updatedEmployee 
CREATE TRIGGER updatedEmployee 
ON Employee 
AFTER Update 
AS 
Begin
	
	Declare @trn int;
	Select @trn = employee_TRN from deleted

	Declare @identifier Varchar(25);
	Declare @O Varchar(50);
	Declare @N Varchar(50);

	If  UPDATE(employee_name) 
		BEGIN 
			Set @identifier = 'employee name'
			Select @O = employee_Name from deleted
			Select @N = employee_Name from inserted
		End

	If UPDATE(employee_address) 
	   BEGIN 
			Set @identifier = 'employee address' 
			Select @O = employee_address from deleted
			Select @N = employee_address from inserted
		End

	If UPDATE(employee_email) 
		BEGIN 
			Set @identifier = 'employee email'
			Select @O = employee_email from deleted
			Select @N = employee_email from inserted
		End

	If UPDATE(phone) 
		BEGIN 
			Set @identifier = 'phone'
			Select @O = phone from deleted
			Select @N = phone from inserted
		End
			
	If UPDATE(supID) 
		BEGIN 
			Set @identifier = 'supID'
			Select @O = supID from deleted
			Select @N = supID from inserted
		End
					
	If UPDATE(Comment) 
		BEGIN 
			Set @identifier = 'Comment'
			Select @O = Comment from deleted
			Select @N = Comment from inserted
		End
	
	If UPDATE(Department) 
		BEGIN 
			Set @identifier = 'Department'
			Select @O = Department from deleted
			Select @N = Department from inserted
		End

	Insert Into Audit_log 
	values(@trn, 'Trn', @identifier+' updated from: ' +@O+ ' to: ' +@N+'', 'Employee', GETDATE())
End

Select *from Audit_log
Select *from Employee


update Employee
Set Department = 'abc'
where employee_TRN = 131029

 
UPDATE Employee 
SET Department = null
WHERE employee_TRN = 131029










drop Trigger updatedProduct
Create Trigger updatedProduct
ON product
After Update
As
Begin
	Select *from deleted
	Select *from inserted
End

insert into product values (1199, 'Rum Cake', 70.9, 20);
 
UPDATE product 
SET product_Name = 'Sweet Cake'
WHERE product_Code = 1199



Alter table Orders
Add Urgency Varchar(20);





Create trigger OrderUrgency
On Orders
After Insert
As
Begin 
	
	Declare @cost float;
	Declare @Order_ID int;
	Declare @Urgency Varchar(19);

	Select @cost = cost from inserted
	Select @Order_ID = order_ID from inserted

	if (@cost > 70)
		Begin
			Set @Urgency = 'Urgent/Big Order';
			Update Orders
			Set Urgency = @Urgency
			where Order_ID = @Order_ID
		End
	Else
		Begin
			Update Orders
			Set Urgency = 'Regular Order'
			where Order_ID = @Order_ID
		End
End
Select *from Orders
Select *from Audit_log
Select *from product
 



CREATE TRIGGER beforeDelete
 ON Orders INSTEAD OF DELETE
  AS 
  Select * from Deleted





 Select *from Audit_log