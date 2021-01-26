
DROP TABLE IF EXISTS Classes;
DROP TABLE IF EXISTS Status;
DROP TABLE IF EXISTS Guests;

CREATE TABLE Guests
(
    id int identity(1,1),
	Guess_Name varchar(250),
    Birthday date,
    Status_id int,
    Classes_id int,
    level int,
	Guess_Notes varchar(500),
	PRIMARY KEY (id)
);


CREATE TABLE Status
(
    id int identity(1,1),
	Status_Name varchar(250),
	PRIMARY KEY (id)
);

CREATE TABLE Classes
(
    id int identity(1,1),
	Classes_Name varchar(250),
	PRIMARY KEY (id)
);

ALTER TABLE Guests ADD FOREIGN KEY (Status_id) References Status(ID);
ALTER TABLE Guests ADD FOREIGN KEY (Classes_id) References Classes(ID);

Insert Into Status (Status_Name) values ('invincible');  --1
Insert Into Status (Status_Name) values ('paralysis');  --2
Insert Into Status (Status_Name) values ('ko');   --3
Insert Into Status (Status_Name) values ('confused');   --4
Insert Into Status (Status_Name) values ('face');   --5
Insert Into Status (Status_Name) values ('heel');   --6
Insert Into Status (Status_Name) values ('tweener');   --7
Insert Into Status (Status_Name) values ('jobber');   --8
Insert Into Status (Status_Name) values ('injured');   --9
Insert Into Status (Status_Name) values ('dazed');   --10

Insert Into Classes (Classes_Name) values ('mage');  --1
Insert Into Classes (Classes_Name) values ('fighter');  --2
Insert Into Classes (Classes_Name) values ('tank');  --3
Insert Into Classes (Classes_Name) values ('healer');  --4
Insert Into Classes (Classes_Name) values ('hero');  --5
Insert Into Classes (Classes_Name) values ('wrestler');  --6
Insert Into Classes (Classes_Name) values ('lucha libre');  --7
Insert Into Classes (Classes_Name) values ('strongstyle');  --8
Insert Into Classes (Classes_Name) values ('rapper');  --9

Insert Into Guests (Guess_Name, Birthday, Status_id, Classes_id, level, Guess_Notes) values ('One Punchman', 'April 1, 2009', 1, 5 , 9999, 'A hero can defeat any opponent with a single punch'); 
Insert Into Guests (Guess_Name, Birthday, Status_id, Classes_id, level, Guess_Notes) values ('Kenny Omega', 'October 16, 1983', 6, 6 , 99, 'The Bout Machine'); 
Insert Into Guests (Guess_Name, Birthday, Status_id, Classes_id, level, Guess_Notes) values ('Tetsuya Naito', 'June 22, 1982', 7, 7 , 87, 'Tranquilo' ); 
Insert Into Guests (Guess_Name, Birthday, Status_id, Classes_id, level, Guess_Notes) values ('Shinsuke Nakamura', 'February 24, 1980', 5, 8 , 100, 'King of Strong Style'); 
Insert Into Guests (Guess_Name, Birthday, Status_id, Classes_id, level, Guess_Notes) values ('Snoop Dogg', 'October 20, 1971', 10, 9 , 420, 'Whats My Name?'); 

--SELECT * FROM Guests;
--SELECT * FROM Status;
--SELECT * FROM Classes;

Select g.id,g.Guess_Name,g.Birthday, g.level,s.Status_Name,c.Classes_Name,g.Guess_Notes
from Guests as g
inner join Status as s on g.Status_id=s.Id
inner join Classes as c on g.Classes_id=c.Id;

DROP TABLE IF EXISTS Supplies;
Create table Supplies
(
    id int Primary Key identity(1,1),
	Supplies_name varchar(100),
	Supplies_type varchar(100),
    Unit varchar(100),
	Price float,
	out_of_stock bit
);
-- out_of_stock values 0 means false for out of stock and 1  means true and its out of stock
Insert Into Supplies (Supplies_name, Supplies_type, Unit, Price, out_of_stock) values ('19 Crimes Snoop Dogg Cali Red Blend', 'Red Wine', '750ml', 14.99, 0);
Insert Into Supplies (Supplies_name, Supplies_type, Unit, Price, out_of_stock) values ('Far Niente Chardonnay', 'White Wine', '750ml', 65.99 , 0);
Insert Into Supplies (Supplies_name, Supplies_type, Unit, Price, out_of_stock) values ('Corona Extra', 'Lager', '24oz', 2.99, 0);
Insert Into Supplies (Supplies_name, Supplies_type, Unit, Price, out_of_stock) values ('Modelo Especial', 'Imported Beer', '24oz', 2.89, 0);
Insert Into Supplies (Supplies_name, Supplies_type, Unit, Price, out_of_stock) values ('San Miguel', 'Imported Beer', '24oz', 3.49, 0);

SELECT * FROM Supplies;

DROP TABLE IF EXISTS Service;
Create table Service
(
    id int Primary Key identity(1,1),
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
    id int Primary Key identity(1,1),
	Tavern_name varchar(100),
	Active BIT,
    Services_id int,
    Table_amount int,
);

ALTER TABLE Tavern ADD FOREIGN KEY (Services_id) References Service(id);

Insert Into Tavern (Tavern_name, Active, Services_id, Table_amount) values ('Moes Tavern', 1, 1, 8);
Insert Into Tavern (Tavern_name, Active, Services_id, Table_amount) values ('The Cellar', 1, 8, 20);
Insert Into Tavern (Tavern_name, Active, Services_id, Table_amount) values ('Top Of the Box', 1, 7, 15);
Insert Into Tavern (Tavern_name, Active, Services_id, Table_amount) values ('Finnegans', 1, 2, 25);
Insert Into Tavern (Tavern_name, Active, Services_id, Table_amount) values ('UCB', 0, 9, 18);

SELECT * FROM Tavern;

DROP TABLE IF EXISTS Inventory;
Create table Inventory 
(
    id int Primary Key identity(1,1),
	Inventory_Date Datetime,
	Tavern_id int,
	table_number int,
	Guests_id int,
	Supplies_id int
);

ALTER TABLE Inventory ADD FOREIGN KEY (Guests_id) References Guests(id);
ALTER TABLE Inventory ADD FOREIGN KEY (Supplies_id) References Supplies(id);

Insert Into Inventory (Inventory_Date,Tavern_id, table_number, Guests_id, Supplies_id) values (GETDATE(), 1,2,2,5)
Insert Into Inventory (Inventory_Date,Tavern_id, table_number, Guests_id, Supplies_id) values (GETDATE(), 3,1,5,1)
Insert Into Inventory (Inventory_Date,Tavern_id, table_number, Guests_id, Supplies_id) values (GETDATE(), 2,20,1,3)
Insert Into Inventory (Inventory_Date,Tavern_id, table_number, Guests_id, Supplies_id) values (GETDATE(), 2,20,1,4)
Insert Into Inventory (Inventory_Date,Tavern_id, table_number, Guests_id, Supplies_id) values (GETDATE(), 3,2,4,2)
Insert Into Inventory (Inventory_Date,Tavern_id, table_number, Guests_id, Supplies_id) values (GETDATE(), 4,2,3,3)
Insert Into Inventory (Inventory_Date,Tavern_id, table_number, Guests_id, Supplies_id) values (GETDATE(), 4,2,3,5)
SELECT * FROM Inventory;