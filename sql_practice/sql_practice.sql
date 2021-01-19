use JSalamat_2021;
/*
DROP TABLE IF EXISTS Customer;
Create table Customer
(
    FirstName varchar(50),
    LastName varchar(50),
    Age int
)
*/
/*
alter table Customer
add City varchar(50);
*/

DROP TABLE IF EXISTS Customer;
Create table Customer
(
    id int Primary Key identity(1,1),
	FirstName varchar(50),
    LastName varchar(50),
    Age int,
	City varchar(50)
);

/*----------------------------------------------------------*/
/*
SELECT *
from Customer;
*/
/*
Select FirstName,LastName,Age
from Customer;
*/
--Select FirstName,LastName,Age
--from Customer
--where FirstName='Kenny';

--Select FirstName,LastName,Age
--from Customer
--where FirstName='Kenny'
--and LastName='Omega';

--Select FirstName,LastName,Age
--from Customer
--where FirstName='Kenny'
--and LastName like'King';

--Select FirstName,LastName,Age
--from Customer
--where FirstName='Kenny'
--and LastName like'King_';

--Select FirstName,LastName,Age
--from Customer
--where FirstName='Kenny'
--and LastName like'King%';

Select *
from Customer
where FirstName='Kenny';

UPDATE Customer
Set Age=31
where FirstName='Kenny'
and LastName like'Omega';

DELETE Customer
where FirstName='Kenny'
and LastName like'King%';

UPDATE Customer
Set City = 'Florida';
/*----------------------------------------------------------*/

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

DROP TABLE IF EXISTS Products;
Create table Products
(
    id int Primary Key identity(1,1),
	ProductName varchar(50)
);

alter table Products
add Price float;

Insert into Products (ProductName, Price) values ('Steel Chair', 5.00);
Insert into Products (ProductName, Price) values ('Wooden Table', 10.00);
Insert into Products (ProductName, Price) values ('Trash Can', 3.00);
Insert into Products (ProductName, Price) values ('Singapore Cane', 20.00);
Insert into Products (ProductName, Price) values ('Ladder', 25.00);

--select * from Products;

DROP TABLE IF EXISTS Orders;
Create table Orders
(
    OrderId int Primary Key identity(1,1),
	OrderDate Datetime,
	CustomerID int,
	ProductID int
);
Select * from Orders;

Select * from Products;
Select * from Customer;