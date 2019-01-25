

CREATE TABLE Customer (
    CustomerId int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    CustomerName varchar(50) NOT NULL,
    Email varchar(50) NOT NULL
);

Create table Employee
(
	EmployeeId int NOT NULL identity(1,1) primary key,
	EmployeeName varchar(70) NOT NULL,
	Email varchar(50) NOT NULL
);

Create table Category
(
	CategoryId int NOT NULL identity(1,1) primary key,
	CategoryName varchar(70) NOT NULL,
	EmployeeId int NOT NULL,

	constraint fk_Category_Employee foreign key (EmployeeId) references Employee (EmployeeId)
);



Create table Product
(
	ProductId int NOT NULL identity(1,1) primary key,
	ProductName varchar(70) NOT NULL,
	CategoryId int not null,
	Description varchar(100) NOT NULL,
	Price int,

	constraint fk_Product_Category foreign key (CategoryId) references Category (CategoryId),
);

Create table Orders
(
	OrderId int not null identity(1,1) primary key,
	Numar int,
	Data DateTime,
	CustomerId int,
	Status varchar(200),
	TotalPrice int,
	CONSTRAINT CK_Status CHECK (Status IN ('registered','approved','received','delivered','cancelled')),

	Constraint fk_Order_Customer foreign key (CustomerId) references Customer (CustomerId)
);

Create table OrderProduct
(
	OrderId int not null,
	ProductId int not null,
	NumberOfProducts int not null
	constraint PK_OrdersProduct primary key (OrderId, ProductId)

	constraint fk_OrderProduct_Product foreign key (ProductId) references Product (ProductId),

	constraint fk_OrderProduct_Order foreign key (OrderId) references Orders (OrderId)
);

-----------------------populare---------------------
--Customer--
insert into Customer (CustomerName, Email) values ('Andrei', 'andrei@wantsome.com');
insert into Customer (CustomerName,Email) values ('Alin', 'alin@wantsome.com');
insert into Customer (CustomerName, Email) values ('George', 'george@wantsome.com');
insert into Customer (CustomerName, Email) values ('Ovidiu', 'ovd@wantsome.com');
insert into Customer (CustomerName, Email) values ('Mihai', 'mihai@wantsome.com');
insert into Customer (CustomerName, Email) values ('Ion', 'ion@gmail.com');
insert into Customer (CustomerName, Email) values ('Silviu', 'silviu@yahoo.com');
insert into Customer (CustomerName, Email) values ('Mirela', 'mirela@wantsome.com');
insert into Customer (CustomerName, Email) values ('Oana', 'oana@gmail.com');

--employee--
insert into Employee (EmployeeName, Email) values ('scc', 'scc@wantsome.com');
insert into Employee (EmployeeName, Email) values ('scc2', 'scc2@wantsome.com');
insert into Employee (EmployeeName, Email) values ('scc3', 'scc3@wantsome.com');
insert into Employee (EmployeeName, Email) values ('scc4', 'scc4@wantsome.com');
insert into Employee (EmployeeName, Email) values ('scc5', 'scc5@wantsome.com');

---CATEGORY--

INSERT INTO Category(CategoryName,EmployeeID) VALUES ('Carti',1);
INSERT INTO Category(CategoryName,EmployeeID) VALUES ('parfumuri',4);
INSERT INTO Category(CategoryName,EmployeeID) VALUES ('electrocasnice',2);
INSERT INTO Category(CategoryName,EmployeeID) VALUES ('electronice',2);
INSERT INTO Category(CategoryName,EmployeeID) VALUES ('imbracaminte',3);
---PRODUCT--
insert into Product (ProductName, CategoryId, Description, Price) VALUES ('PRODUS1',1,'DESCRIERE1',19.99);
insert into Product (ProductName, CategoryId, Description, Price) VALUES ('PRODUS2',4,'DESCRIERE1',29.99);
insert into Product (ProductName, CategoryId, Description, Price) VALUES ('PRODUS3',4,'DESCRIERE1',19.99);
insert into Product (ProductName, CategoryId, Description, Price) VALUES ('PRODUS4',2,'DESCRIERE1',59.99);
insert into Product (ProductName, CategoryId, Description, Price) VALUES ('PRODUS5',2,'DESCRIERE1',39.99);
insert into Product (ProductName, CategoryId, Description, Price) VALUES ('PRODUS6',1,'DESCRIERE1',49.99);
insert into Product (ProductName, CategoryId, Description, Price) VALUES ('PRODUS7',3,'DESCRIERE1',59.99);
insert into Product (ProductName, CategoryId, Description, Price) VALUES ('PRODUS8',3,'DESCRIERE1',19.99);
insert into Product (ProductName, CategoryId, Description, Price) VALUES ('PRODUS1',1,'DESCRIERE1',19.99);

--ORDERS-
Insert into Orders (Numar, Data,CustomerId,Status,TotalPrice ) VALUES (1,GETDATE(),1,'approved',0)
Insert into Orders (Numar, Data,CustomerId,Status,TotalPrice ) VALUES (2,GETDATE(),1,'approved',0)
Insert into Orders (Numar, Data,CustomerId,Status,TotalPrice ) VALUES (3,GETDATE(),1,'approved',0)
Insert into Orders (Numar, Data,CustomerId,Status,TotalPrice ) VALUES (4,GETDATE(),1,'approved',0)
Insert into Orders (Numar, Data,CustomerId,Status,TotalPrice ) VALUES (5,GETDATE(),1,'approved',0)
Insert into Orders (Numar, Data,CustomerId,Status,TotalPrice ) VALUES (6,GETDATE(),1,'approved',0)
Insert into Orders (Numar, Data,CustomerId,Status,TotalPrice ) VALUES (7,GETDATE(),1,'approved',0)
--ORDERPRODUCT--
INSERT INTO OrderProduct(OrderID,ProductID,NumberOfProducts) VALUES (1,1,2);
INSERT INTO OrderProduct(OrderID,ProductID,NumberOfProducts) VALUES (2,4,2);
INSERT INTO OrderProduct(OrderID,ProductID,NumberOfProducts) VALUES (3,2,2);
INSERT INTO OrderProduct(OrderID,ProductID,NumberOfProducts) VALUES (4,3,2);
INSERT INTO OrderProduct(OrderID,ProductID,NumberOfProducts) VALUES (5,1,2);
INSERT INTO OrderProduct(OrderID,ProductID,NumberOfProducts) VALUES (6,1,2);

---4.Afisati toate produsele.

select * from Product;

--5.Afisati toti clientii care au in continutul email-ului @wantsome.com.--

select * from Customer where Email like '%wantsome.com%';

--6.Afisati suma preturilor pentru fiecare categorie in parte.--

select p.CategoryId,c.CategoryName as CategoryName, SUM(Price) as SumaPreturi from Product p JOIN Category c on
(p.CategoryId=c.CategoryId)
group by p.CategoryId, c.CategoryName;

--7.Afisati clientii care au mai mult de 10 comenzi.--

Select c.CustomerName from Customer c JOIN Orders o On
(c.CustomerId =o.CustomerId) 
group by o.CustomerId,c.CustomerName
having COUNT (o.CustomerId)>10;

--8.Creati un view care va afisa toti clientii si produsele comandate de acestia.--

go
CREATE VIEW VCUSTOMERANDPRODUCT AS
Select c.CustomerName as Customer, products.ProductName, o.Data, products.CategoryId  from Customer c 
join Orders o on c.CustomerId=o.CustomerId
join OrderProduct orderProducts on o.OrderId=orderProducts.OrderId
join Product products on products.ProductId=orderProducts.ProductId
GO

Select* from VCUSTOMERANDPRODUCT;

----9.Folositi view-ul de la punctul precedent pentru a afisa:--
--Clientii care au comandat produse in primele trei luni ale anului.--

select *from VCUSTOMERANDPRODUCT c WHERE c.Data <'2019-04-31';

--Clientii care au comandat produse dintr-o anumita categorie.--
select *from VCUSTOMERANDPRODUCT c WHERE c.CategoryId= 1;

--10.Creati o procedura care va modifica statusul unui Order. Aceasta procedura va updata si LastModifiedDate---


IF OBJECT_ID (N'updatestatus', N'P') IS NOT NULL  
    DROP PROCEDURE updatestatus;  
GO  

Create Procedure updatestatus @Status varchar (50), @OrderId int
AS
UPDATE Orders 
SET Status = @Status,Data = GETDATE()
Where OrderId = @OrderId

EXEC updatestatus @Status = 'approved', @OrderId = 1;

Select* from Orders;

--11.Creati un raport (select cu group by) pentru a afisa vanzarile pentru fiecare produs in parte.--

SELECT ProductName, SUM(Price) AS vanzari
	FROM Product p INNER JOIN OrderProduct op ON p.ProductID=op.ProductID
	GROUP BY ProductName;


--12.Creati o functie care va calcula pretul total pentru o anumita comanda--
GO
create function OrderTotalPrice (@OrderId int)
returns decimal
as
begin
	declare @totalpret decimal;
	select @totalpret = sum(op.NumberOfProducts * p.Price)
	  from OrderProduct op
	  join Orders o on op.OrderId = o.OrderId
	  join Product p on op.ProductId = p.ProductId
	 where op.OrderId = @OrderId;

 return @totalpret;
end
Go

Select dbo.OrderTotalPrice(1);

--13.Order Audit Table - OrderId, CustomerId, DateTime. - insert trigger--

CREATE TABLE OrderAudit
(
	OrderId int,
	CustomerId int,
	AddedAt DateTime,
	UpdatedAt DateTime
)
GO
Create trigger InsertTrigger
ON Orders
After Insert
AS
BEGIN
INSERT INTO OrderAudit(OrderId,CustomerId,AddedAt)
SELECT i.OrderId,i.CustomerId,GETDATE() from inserted i
END
GO


select * from OrderAudit;
go

--14.Order Audit - Cand order-ul are status approved = update pe coloana approvedat in audit table. update trigger--

GO
Create trigger UpdateAuditTrigger
ON Orders
AFTER UPDATE
AS
BEGIN
UPDATE OrderAUDIT
SET UpdatedAt = GETDATE()
FROM OrderAUDIT
JOIN inserted I ON OrderAUDIT.OrderId = I.OrderId
WHERE Status = 'Aproved'
END

