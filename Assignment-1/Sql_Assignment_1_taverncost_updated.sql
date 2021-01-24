DROP TABLE IF EXISTS Supplies;
Create table Supplies
(
    Supplies_id int Primary Key identity(1,1),
	Supplies_name varchar(100),
	Supplies_type varchar(100),
    Unit varchar(100),
	Price float,
	out_of_stock bit
);

Insert Into Supplies (Supplies_name, Supplies_type, Unit, Price, out_of_stock) values ('19 Crimes Snoop Dogg Cali Red Blend', 'Red Wine', '750ml', 14.99, 0);
Insert Into Supplies (Supplies_name, Supplies_type, Unit, Price, out_of_stock) values ('Far Niente Chardonnay', 'White Wine', '750ml', 65.99 , 0);
Insert Into Supplies (Supplies_name, Supplies_type, Unit, Price, out_of_stock) values ('Corona Extra', 'Lager', '24oz', 2.99, 0);
Insert Into Supplies (Supplies_name, Supplies_type, Unit, Price, out_of_stock) values ('Modelo Especial', 'Imported Beer', '24oz', 2.89, 0);
Insert Into Supplies (Supplies_name, Supplies_type, Unit, Price, out_of_stock) values ('San Miguel', 'Imported Beer', '24oz', 3.49, 0);

SELECT * FROM Supplies;

DROP TABLE IF EXISTS Service;
Create table Service
(
    Service_id int Primary Key identity(1,1),
	Service_name varchar(100),
	Service_price Float
);

Insert Into Service (Service_name, Service_price) values ('Pool', 10); --1
Insert Into Service (Service_name, Service_price) values ('Night Club', 20); --2
Insert Into Service (Service_name, Service_price) values ('Kareoke', 7.50); --3
Insert Into Service (Service_name, Service_price) values ('Bowling', 12.75); --4
Insert Into Service (Service_name, Service_price) values ('Dart', 4.25); --5
Insert Into Service (Service_name, Service_price) values ('Arcade', 2.50); --6
Insert Into Service (Service_name, Service_price) values ('Music', 11); --7
Insert Into Service (Service_name, Service_price) values ('Stand Up', 15); --8
Insert Into Service (Service_name, Service_price) values ('Stage', 10); --9
Insert Into Service (Service_name, Service_price) values ('None', 0); --10
SELECT * FROM Service;

DROP TABLE IF EXISTS Tavern;
Create table Tavern
(
    Tavern_id int Primary Key identity(1,1),
	Tavern_name varchar(100),
	Active BIT,
    Services_id int,
    Table_amount int,
);
Insert Into Tavern (Tavern_name, Active, Services_id, Table_amount) values ('Moes Tavern', 1, 1, 8);
Insert Into Tavern (Tavern_name, Active, Services_id, Table_amount) values ('The Cellar', 1, 8, 20);
Insert Into Tavern (Tavern_name, Active, Services_id, Table_amount) values ('Top Of the Box', 1, 7, 15);
Insert Into Tavern (Tavern_name, Active, Services_id, Table_amount) values ('Finnegans', 1, 2, 25);
Insert Into Tavern (Tavern_name, Active, Services_id, Table_amount) values ('UCB', 0, 9, 18);

SELECT * FROM Tavern;

DROP TABLE IF EXISTS Inventory;
Create table Inventory 
(
    Inventory_Id int Primary Key identity(1,1),
	Inventory_Date Datetime,
	Tavern_id int,
	table_number int,
	Guests_id int,
	Supplies_id int
);

SELECT * FROM Inventory;