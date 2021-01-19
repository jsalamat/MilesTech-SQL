-- Drop table in correct order especially when the foreign key applied to the table
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customer;

Create table Customer
(
    id int Primary Key identity(1,1),
	FirstName varchar(50),
    LastName varchar(50),
    Age int,
	City varchar(50)
);

insert into Customer 
(FirstName,LastName,[Age], City) 
 values ('Kenny', 'Omega', 32 , 'South Beach');
insert into Customer 
(FirstName,LastName,[Age], City)
 values ('Matt', 'Jackson', 33, 'Venice');
 insert into Customer 
(FirstName,LastName,[Age], City)
 values ('Nick', 'Jackson', 30, 'Venice');
 insert into Customer 
(FirstName,LastName,[Age], City)
 values ('Adam', 'Page', 28 , 'San Antonio');
 insert into Customer 
(FirstName,LastName,[Age], City)
 values ('Marty', 'Schurl', 32, 'London');
  insert into Customer 
(FirstName,LastName,[Age], City) 
 values ('Kenny', 'King', 38 , 'Las Vegas');
insert into Customer 
(FirstName,LastName,[Age], City) 
 values ('Kenny', 'King Jr.', 13, 'Las Vegas');
insert into Customer 
(FirstName,LastName,[Age], City)
 values ('Kenny', 'King III', 70, 'San Francisco');
insert into Customer 
(FirstName,LastName,[Age], City) 
 values ('Kenny', 'Kings', 40, 'New York');
 insert into Customer 
(FirstName,LastName,[Age], City) 
 values ('The Icon', 'Sting', 55, 'Venice');


Create table Products
(
    id int Primary Key identity(1,1),
	ProductName varchar(50)
);

alter table Products
add Price float;

Insert into Products (ProductName, Price) values ('Steel Chair', 5.50);
Insert into Products (ProductName, Price) values ('Wooden Table', 9.99);
Insert into Products (ProductName, Price) values ('Trash Can', 3.85);
Insert into Products (ProductName, Price) values ('Singapore Cane', 20.00);
Insert into Products (ProductName, Price) values ('Ladder', 25.00);
Insert into Products (ProductName, Price) values ('Baseball Bat', 8.25);

--select * from Products;


Create table Orders
(
    OrderId int Primary Key identity(1,1),
	OrderDate Datetime,
	CustomerID int,
	ProductID int
);

Insert into Orders (OrderDate, CustomerID, ProductID) values (GETDATE(), 1, 4);
Insert into Orders (OrderDate, CustomerID, ProductID) values (GETDATE(), 1, 4);
Insert into Orders (OrderDate, CustomerID, ProductID) values (GETDATE(), 2, 2);
Insert into Orders (OrderDate, CustomerID, ProductID) values (GETDATE(), 3, 2);
Insert into Orders (OrderDate, CustomerID, ProductID) values (GETDATE(), 3, 5);
Insert into Orders (OrderDate, CustomerID, ProductID) values (GETDATE(), 1, 1);
Insert into Orders (OrderDate, CustomerID, ProductID) values (GETDATE(), 1, 3);
Insert into Orders (OrderDate, CustomerID, ProductID) values (GETDATE(), 10, 6);
Insert into Orders (OrderDate, CustomerID, ProductID) values (GETDATE(), 10, 6);

--Select * from Orders;
--Select * from Products;
--Select * from Customer;

alter table orders
add foreign key (CustomerId) references Customer(Id);

alter table orders
add foreign key (ProductId) references Products(Id);

/*
Select * from Orders
inner join Products on Orders.ProductId=Products.Id;
*/
--Aliasing
--Select * from Orders as o
--inner join Products as p on o.ProductId=p.Id;

--Aliasing simpler version
--Select * from Orders o
--inner join Products p on o.ProductId=p.Id;

--Aliasing with Columns
/*
Select o.*,p.*,c.*
from Orders as o
inner join Products as p on o.ProductId=p.Id
inner join Customer as c on o.CustomerId=c.Id;
*/

UPDATE Customer 
Set City='Vancouver'
where FirstName='Kenny'
and LastName like'Omega'; 

Select o.OrderDate,p.ProductName,p.Price,c.*
from Orders as o
inner join Products as p on o.ProductId=p.Id
inner join Customer as c on o.CustomerId=c.Id;

--Sum and alias column
Select Sum(p.Price) as Total
from Orders as o
inner join Products as p on o.ProductId=p.Id
inner join Customer as c on o.CustomerId=c.Id;


Select c.FirstName,c.Lastname,Sum(p.Price) as Total
from Orders as o
inner join Products as p on o.ProductId=p.Id
inner join Customer as c on o.CustomerId=c.Id
group by c.FirstName,c.LastName;


Select c.Lastname,p.ProductName,Sum(p.Price) as Total
from Orders as o
inner join Products as p on o.ProductId=p.Id
inner join Customer as c on o.CustomerId=c.Id
group by c.LastName,p.ProductName;

Select c.City,Sum(p.Price), AVG(p.Price) as Total
from Orders as o
inner join Products as p on o.ProductId=p.Id
inner join Customer as c on o.CustomerId=c.Id
group by c.City;