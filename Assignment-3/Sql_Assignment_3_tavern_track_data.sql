DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Supplies;

DROP TABLE IF EXISTS Tavern;
DROP TABLE IF EXISTS Locations;

DROP TABLE IF EXISTS User_Roles;
DROP TABLE IF EXISTS Roles;
DROP TABLE IF EXISTS Users;

DROP TABLE IF EXISTS Guests;
DROP TABLE IF EXISTS Classes;
DROP TABLE IF EXISTS Status;
DROP TABLE IF EXISTS Service;

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

--2 Write a query that returns guests with a birthday before 2000
Select g.id,g.Guess_Name,g.Birthday, g.level,s.Status_Name,c.Classes_Name,g.Guess_Notes
from Guests as g
inner join Status as s on g.Status_id=s.Id
inner join Classes as c on g.Classes_id=c.Id
WHERE g.Birthday <= 'January 01, 2000'; 

--8. Write a query that returns Guest Classes with Levels and Generate a new column with a label for their level grouping (lvl 1-99)
Select g.id,g.Guess_Name,g.Birthday, g.level,s.Status_Name,c.Classes_Name,g.Guess_Notes
from Guests as g
inner join Status as s on g.Status_id=s.Id
inner join Classes as c on g.Classes_id=c.Id
WHERE g.level  Between 1 and 99;


--4 Write a query that returns UNIQUE guest names.
select distinct Guess_Name from Guests;

--5 Write a query that returns all guests ordered by name (ascending) Use ASC or DESC after your ORDER BY [col]
select *
from Guests
Order by Guess_Name ASC;

Create table Roles
(
    id int Primary Key identity(1,1),
	Roles_name varchar(100),
);

Insert Into Roles(Roles_name) values ('Owner'); --1
Insert Into Roles(Roles_name) values ('Manager'); --2
Insert Into Roles(Roles_name) values ('Chef'); --3
Insert Into Roles(Roles_name) values ('Waiter'); --4
Insert Into Roles(Roles_name) values ('Security'); --5
Insert Into Roles(Roles_name) values ('Janitor'); --6
Insert Into Roles(Roles_name) values ('Receptionist'); --7
--SELECT * FROM Roles;


Create table Users
(
    id int Primary Key identity(1,1),
	Users_name varchar(100),
    Birthday date,
);

Insert Into Users(Users_name, Birthday ) values 
 ('Christopher Wallace', 'May 21, 1972'),
 ('Lesane Parish Crooks', 'June 16, 1971'),
 ('Shawn Corey Carter', 'December 4, 1969'),
 ('Daniel Dumile', 'July 13, 1971'),
 ('Nasir Jones', 'September 14, 1973'),
 ('Moe Szyslak', 'September 24, 1989'),
 ('Bruce Wayne', 'September 24, 1990'),
 ('Diana Prince', 'June 24, 2001'),
 ('Clark Kent', 'July 24, 1989'),
 ('Harley Quinn', 'July 24, 2008'),
 ('Pamela Lillian', 'February 14, 1994');
--SELECT * FROM Users;

Create table User_Roles
(
    User_id int,
    Role_id int,
);

ALTER TABLE User_Roles ADD FOREIGN KEY (User_id) References Users(id);
ALTER TABLE User_Roles ADD FOREIGN KEY (Role_id) References Roles(id);

Insert Into User_Roles(User_id, Role_id) values 
 (1, 1),
 (2, 2),
 (3, 5),
 (4, 7),
 (5, 1),
 (6, 1),
 (7, 4),
 (8, 3),
 (9, 5),
 (10, 1),
 (11, 1);
--SELECT * FROM User_Roles;

/*
Select u.id,u.Users_name,u.Birthday,r.Roles_name
from Users as u
inner join User_Roles as ur on u.id=ur.User_id
inner join Roles as r on r.id=ur.Role_id;
*/

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
Insert Into Supplies (Supplies_name, Supplies_type, Unit, Price, out_of_stock) values ('Soto Super Premium Junmai Daiginjo Sake', 'Sake', '720ml', 39.99, 0);
Insert Into Supplies (Supplies_name, Supplies_type, Unit, Price, out_of_stock) values ('1800 Anejo Tequila', 'Tequila', '750ml', 42.99, 0);
Insert Into Supplies (Supplies_name, Supplies_type, Unit, Price, out_of_stock) values ('Don Julio 1942 Tequila', 'Tequila', '750ml', 139.99, 0);
Insert Into Supplies (Supplies_name, Supplies_type, Unit, Price, out_of_stock) values ('Tequila Sunrise', 'Tequila', '750ml', 159.99, 0);
Insert Into Supplies (Supplies_name, Supplies_type, Unit, Price, out_of_stock) values ('Yuengling Lager', 'Lager', '24oz', 3.99, 0);
Insert Into Supplies (Supplies_name, Supplies_type, Unit, Price, out_of_stock) values ('Opus One 2016 Napa Valley Red Blend', 'Red Wine', '750ml', 390.99, 0);
Insert Into Supplies (Supplies_name, Supplies_type, Unit, Price, out_of_stock) values ('Emmolo Merlot Napa Valley', 'Merlot', '750ml', 76.99, 0);
Insert Into Supplies (Supplies_name, Supplies_type, Unit, Price, out_of_stock) values ('Red Horse', 'Imported Beer', '24oz', 3.49, 0);
--SELECT * FROM Supplies;

-- 6  Write a query that returns the top 10 highest price sales
SELECT TOP 10 * 
FROM Supplies
Order by Price DESC;

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
--SELECT * FROM Service;

Create table Locations
(
    id int Primary Key identity(1,1),
	Locations_name varchar(100),
);

Insert Into Locations (Locations_name) values 
('New Yor City'), --1
('Springfield'), --2
('San Francisco'), --3
('Las Vegas'), --4
('Ronponggi'), --5
('Philidephia'), --6
('Trenton'), --7
('Brooklyn'), --8
('Manila'), --9
('Vancouver'); --10
--SELECT * FROM Locations;


Create table Tavern
(
    id int Primary Key identity(1,1),
	Tavern_name varchar(100),
    FloorsCount int,
    Owner_id int,
    Location_id int,
	Active BIT,
    Services_id int,
    Table_amount int,
);

ALTER TABLE Tavern ADD FOREIGN KEY (Owner_id) References Users(id);
ALTER TABLE Tavern ADD FOREIGN KEY (Location_id) References Locations(id);
ALTER TABLE Tavern ADD FOREIGN KEY (Services_id) References Service(id);

Insert Into Tavern (Tavern_name, FloorsCount, Owner_id, Location_id, Active, Services_id, Table_amount) values ('Moes Tavern', 1, 6, 2, 1, 1, 8);
Insert Into Tavern (Tavern_name, FloorsCount, Owner_id, Location_id, Active, Services_id, Table_amount) values ('The Cellar', 2, 5, 1, 1, 8, 20);
Insert Into Tavern (Tavern_name, FloorsCount, Owner_id, Location_id, Active, Services_id, Table_amount) values ('Top Of the Box', 4, 1, 1, 1, 7, 15);
Insert Into Tavern (Tavern_name, FloorsCount, Owner_id, Location_id, Active, Services_id, Table_amount) values ('Finnegans', 2, 10, 7, 1, 2, 25);
Insert Into Tavern (Tavern_name, FloorsCount, Owner_id, Location_id, Active, Services_id, Table_amount) values ('UCB', 1, 11, 4, 0, 9, 18);
--SELECT * FROM Tavern;

Select t.id,t.Tavern_name,t.FloorsCount,u.Users_name, l.Locations_name, s.Service_name, t.Table_amount, t.Active
from Tavern as t
inner join Users as u on u.id=t.Owner_id
inner join Locations as l on l.id=t.Location_id
inner join Service as s on s.id=t.Services_id;

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

-- 9. Write a series of INSERT commands that will insert the statuses of one table into another of your choosing using SELECT statements (See our lab in class - The INSERT commands should be generated).
Insert Into Inventory (Inventory_Date,Tavern_id, table_number, Guests_id, Supplies_id) values (GETDATE(), 1,2,2,5)
Insert Into Inventory (Inventory_Date,Tavern_id, table_number, Guests_id, Supplies_id) values (GETDATE(), 3,1,5,1)
Insert Into Inventory (Inventory_Date,Tavern_id, table_number, Guests_id, Supplies_id) values (GETDATE(), 2,20,1,3)
Insert Into Inventory (Inventory_Date,Tavern_id, table_number, Guests_id, Supplies_id) values (GETDATE(), 2,20,1,4)
Insert Into Inventory (Inventory_Date,Tavern_id, table_number, Guests_id, Supplies_id) values (GETDATE(), 3,2,4,2)
Insert Into Inventory (Inventory_Date,Tavern_id, table_number, Guests_id, Supplies_id) values (GETDATE(), 4,2,3,3)
Insert Into Inventory (Inventory_Date,Tavern_id, table_number, Guests_id, Supplies_id) values (GETDATE(), 4,2,3,5)

--7. Write a query to return all the values stored in all Lookup Tables - Lookup tables are the tables we reference typically with just an ID and a name. This should be a dynamic combining of all of the tables
SELECT * FROM Inventory;
