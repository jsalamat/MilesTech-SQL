--CREATE DATABASE SQL_JSTraining;

--use SQL_JSTraining;
/* This is without Roomstays and related tables */

/*
DROP TABLE SuppliesSales;
DROP TABLE ServicesSales;

DROP TABLE GuestClass;
DROP TABLE Guests;
DROP TABLE Class;
DROP TABLE GuestStatus;

DROP TABLE Receiving;
DROP TABLE Inventory;

DROP TABLE BasementRats;

DROP TABLE Taverns;
DROP TABLE Users;

DROP TABLE Services;
DROP TABLE Status;

DROP TABLE Supplies;
DROP TABLE Roles;
DROP TABLE Locations;
*/

CREATE TABLE Locations (
	ID int Identity PRIMARY KEY,
	Name varchar(100) NOT NULL,
);

INSERT INTO Locations 
	(Name) 
VALUES
	('West Side'),
	('Red Light District'),
	('Wonderland'),
	('Camelot'),
	('Sector 9'),
	('R''yleah');



CREATE TABLE Roles (
	ID int Identity PRIMARY KEY,
	Name varchar(50) NOT NULL UNIQUE,
	Description varchar(100) NOT NULL,
);

INSERT INTO Roles 
	(Name, Description) 
VALUES
	('Owner', 'Ye owns the lot of em'),
	('Wench', 'Serve dem drinks'),
	('Barkeep', ' Make dem drinks'),
	('Bard', 'Sing dem songs'),
	('Guard', 'Bash Dem skulls'),
	('Stable Boy', 'Shovel dem turds');


CREATE TABLE Supplies (
	ID int Identity PRIMARY KEY,
	Name varchar(50) NOT NULL UNIQUE,
	Unit varchar(20) NOT NULL,
);

INSERT INTO Supplies 
	(Name, Unit) 
VALUES
	('Mead', 'ounces'),
	('Ale', 'ounces'),
	('Rum', 'jugs'),
	('Cheetos', 'bags'),
	('Caltrops', 'sacks'),
	('Gunpowder', 'pounds'),
	('Maple Syrup', 'gallons'),
	('Poison', 'liters'),
	('Darts', 'cases'),
	('Soap?', 'bars'),
	('Rope!', 'feet');


CREATE TABLE Status (
	ID int Identity PRIMARY KEY,
	Status varchar(20) NOT NULL UNIQUE,
	);

INSERT INTO Status 
	(Status) 
VALUES
	('Valid'),
	('Invalid'),
	('Dead'),
	('Cursed'),
	('Restricted');


CREATE TABLE Services (
	ID int Identity PRIMARY KEY,
	Name varchar(50) NOT NULL UNIQUE,
	StatusID int NOT NULL,CONSTRAINT FK_Status FOREIGN KEY (StatusID)
	REFERENCES Status(ID)
	ON DELETE CASCADE
);

INSERT INTO Services 
	(Name, StatusID) 
VALUES
	('Rent a Room', 1),
	('Spin a Tale', 1),
	('Dunk the Drunk', 2),
	('Drown the Clown', 5),
	('Assasination', 3),
	('Weapon Sharpening', 3),
	('Identify', 4);


CREATE TABLE Users (
	ID int Identity PRIMARY KEY,
	Name varchar(50) NOT NULL,
	RoleId int NOT NULL,CONSTRAINT FK_Role FOREIGN KEY (RoleID)
	REFERENCES Roles(ID)
	ON DELETE CASCADE
);

INSERT INTO Users 
	(Name, RoleId) 
VALUES
	('Buck Rogers', 1),
	('Moe', 1),
	('Swarthy Daniels', 1),
	('Bjorn Bjorgenson', 5),
	('Daisy Duke', 2),
	('Cthulhu', 3),
	('Deckard Cain', 1),
	('Bob Ross', 4),
	('Shawn Dougherty', 6);


CREATE TABLE Taverns (
	ID int Identity PRIMARY KEY,
	Name varchar(100) NOT NULL,
	Floors int NOT NULL,
	LocationID int NOT NULL,CONSTRAINT FK_Loc FOREIGN KEY (LocationID)
	REFERENCES Locations(ID)
	ON DELETE CASCADE,
	OwnerID int NOT NULL,CONSTRAINT FK_Own FOREIGN KEY (OwnerID)
	REFERENCES Users(ID)
	ON DELETE CASCADE	
);

INSERT INTO Taverns 
	(Name, LocationID, Floors, OwnerId) 
VALUES
	('Buck Roger''s', 1, 2, 1),
	('Moe''s', 3, 1, 2),
	('Pain Train', 4, 6, 3),
	('Lover''s Quarrel', 2, 4, 3),
	('Stay Awhile', 5, 4, 7),
	('The Dive', 2, 3, 3),
	('The Deep', 6, 5, 3);


CREATE TABLE BasementRats (
	ID int Identity PRIMARY KEY,
	Name varchar(100) NOT NULL,
	TavernID int NOT NULL,CONSTRAINT FK_TavernRats FOREIGN KEY (TavernID)
	REFERENCES Taverns(ID)
	ON DELETE CASCADE	
);

INSERT INTO BasementRats 
	(Name, TavernID) 
VALUES
	('Doc', 1),
	('Grumpy', 2),
	('Happy', 3),
	('Sleepy', 4),
	('Dopey', 5),
	('Bashful', 5),
	('Sneezy', 7);


CREATE TABLE Inventory (
	Count int NOT NULL,
	Date datetime NOT NULL,
	TavernID int,CONSTRAINT FK_TavernInv FOREIGN KEY (TavernID)
	REFERENCES Taverns(ID)
	ON DELETE CASCADE,
	SupplyID int,CONSTRAINT FK_SupplyInv FOREIGN KEY (SupplyID)
	REFERENCES Supplies(ID)
	ON DELETE CASCADE,
	PRIMARY KEY (TavernID, SupplyID)	
);

INSERT INTO Inventory 
	(TavernID, SupplyID, Count, Date) 
VALUES
	(1, 1, 23, GETDATE()),
	(1, 5, 69, GETDATE()),
	(1, 4, 17, GETDATE()),
	(2, 2, 13, GETDATE()),
	(2, 7, 5, GETDATE()),
	(3, 11, 123, GETDATE()),
	(3, 9, 236, GETDATE()),
	(3, 5, 6, GETDATE()),
	(4, 7, 31, GETDATE()),
	(5, 3, 44, GETDATE()),
	(6, 8, 67, GETDATE()),
	(7, 2, 88, GETDATE()),
	(7, 9, 92, GETDATE()),
	(7, 10, 2, GETDATE());


CREATE TABLE Receiving (
	ID int Identity PRIMARY KEY,
	Quantity int NOT NULL,
	Cost smallmoney NOT NULL,
	TavernID int NOT NULL, CONSTRAINT FK_TavernRec FOREIGN KEY (TavernID)
	REFERENCES Taverns(ID)
	ON DELETE CASCADE,
	SupplyID int NOT NULL,CONSTRAINT FK_SupplyRec FOREIGN KEY (SupplyID)
	REFERENCES Supplies(ID)
	ON DELETE CASCADE	
);

INSERT INTO Receiving 
	(TavernID, SupplyID, Quantity, Cost) 
VALUES
	(1, 4, 14, $4.38),
	(2, 2, 3, $41.13),
	(3, 7, 75, $6.28),
	(4, 8, 43, $0.18),
	(5, 11, 2, $214.56),
	(6, 5, 77, $4.70),
	(7, 8, 92, $1.38),
	(4, 8, 62, $231.98),
	(2, 2, 4, $6.99),
	(6, 10, 12, $16.08),
	(1, 9, 6453, $21.33),
	(7, 4, 2, $12.76),
	(1, 7, 204, $22.17),
	(2, 3, 12, $33.43);


CREATE TABLE GuestStatus (
	ID int Identity PRIMARY KEY,
	Name varchar(50) NOT NULL UNIQUE
);

INSERT INTO GuestStatus 
	(Name)
VALUES
	('Hangry'),
	('Enraged'),
	('Drunk'),
	('Enchanted'),
	('Sleepy');

CREATE TABLE Class (
	ID int Identity PRIMARY KEY,
	Name varchar(50) NOT NULL UNIQUE
);


INSERT INTO Class 
	(Name)
VALUES
	('Barberbidon'),
	('Sorcherawr'),
	('Drunk'),
	('Pyromancer'),
	('Renger'),
	('Bout Machine'),
	('Strong Style'),
	('Luchador'),
	('Pure Heel'),
	('Main Eventer');


CREATE TABLE Guests (
	ID int Identity PRIMARY KEY,
	Name varchar(50) NOT NULL UNIQUE,
	Birthday date DEFAULT(GETDATE()) NOT NULL,
	Cakeday date DEFAULT(GETDATE()) NOT NULL,
	StatusID int NOT NULL, CONSTRAINT FK_Guests_Status FOREIGN KEY (StatusID)
	REFERENCES GuestStatus(ID)
	ON DELETE CASCADE,
	
);

INSERT INTO Guests 
	(Name,StatusID) 
VALUES
	('Minsc', 1),
	('Boo', 1),
	('Steve Harvey',3),
	('Judas Priest',2),
	('Bane',1),
	('Radigast',5),
	('Count Dookie',2),
	('Kenny Omega', 1),
	('Tetsuya Naito', 2),
	('Prince Devitt',3),
	('Matt Jackson',4),
	('Nick Jackson',5),
	('Adam Hangman Page',4),
	('Jay White',3),
	('Shinsuke Nakamura',3);


CREATE TABLE GuestClass (
	ClassID int, CONSTRAINT FK_GuestClass_Class FOREIGN KEY (ClassID)
	REFERENCES Class(ID)
	ON DELETE CASCADE,
	GuestID int, CONSTRAINT FK_Guests_Guests FOREIGN KEY (GuestID)
	REFERENCES Guests(ID)
	ON DELETE CASCADE,
	Level int NOT NULL,
	PRIMARY KEY (ClassId, GuestId)
);

INSERT INTO GuestClass
	(ClassID, GuestID, Level) 
VALUES
(5,1,5),
(2,2,52),
(1,3,29),
(5,4,35),
(4,5,43),
(3,6,7),
(1,7,25),
(6,8,90),
(8,9,85),
(10,10,11),
(9,11,75),
(10,12,67),
(3,13,55),
(2,14,15),
(7,15,12);

CREATE TABLE ServicesSales (
	ID int Identity PRIMARY KEY,
	Price smallmoney NOT NULL,
	DatePurchased date NOT NULL,
	QuantityPurchased int NOT NULL,
	TavernID int NOT NULL,CONSTRAINT FK_Tavern_Sales FOREIGN KEY (TavernID)
	REFERENCES Taverns(ID)
	ON DELETE CASCADE,
	ServiceID int NOT NULL,CONSTRAINT FK_Services_Sales FOREIGN KEY (ServiceID)
	REFERENCES Services(ID)
	ON DELETE CASCADE,
	GuestId int NOT NULL,CONSTRAINT FK_ServSales_Guest FOREIGN KEY (GuestId)
	REFERENCES Guests(Id)
	ON DELETE CASCADE
);

INSERT INTO ServicesSales 
	(TavernID, ServiceID, GuestId, Price, QuantityPurchased, DatePurchased) 
VALUES
	(1, 7, 3, $2.34, 2, GETDATE()),
	(7, 7, 2, $1564, 1, GETDATE()),
	(4, 4, 2, $45.98, 4, GETDATE()),
	(5, 2, 1, $2.12, 3, GETDATE()),
	(2, 1, 5, $432.76, 14, GETDATE()),
	(2, 5, 3, $0.01, 114, GETDATE()),
	(2, 6, 2, $64.64, 5, GETDATE()),
	(6, 6, 5, $16, 1, GETDATE()),
	(4, 2, 1, $1.38, 1307, GETDATE()),
	(3, 1, 2, $3.50, 1987, GETDATE()),
	(1, 7, 4, $3.50, 2018, GETDATE());


CREATE TABLE SuppliesSales (
	ID int Identity PRIMARY KEY,
	Price smallmoney NOT NULL,
	DatePurchased date NOT NULL,
	QuantityPurchased int NOT NULL,
	TavernID int NOT NULL,CONSTRAINT FK_SupSales_Tavern FOREIGN KEY (TavernID)
	REFERENCES Taverns(ID)
	ON DELETE CASCADE,
	SupplyID int NOT NULL,CONSTRAINT FK_SupSales_Supplies FOREIGN KEY (SupplyID)
	REFERENCES Supplies(ID)
	ON DELETE CASCADE,
	GuestId int NOT NULL,CONSTRAINT FK_SupSales_Guest FOREIGN KEY (GuestId)
	REFERENCES Guests(Id)
	ON DELETE CASCADE,
);


INSERT INTO SuppliesSales 
	(TavernID, SupplyID, GuestId, Price, QuantityPurchased, DatePurchased) 
VALUES
	(1, 7, 3, $2.34, 2, GETDATE()),
	(7, 7, 2, $1564, 1, GETDATE()),
	(4, 4, 2, $45.98, 4, GETDATE()),
	(5, 2, 1, $2.12, 3, GETDATE()),
	(2, 1, 5, $432.76, 14, GETDATE()),
	(2, 5, 3, $0.01, 114, GETDATE()),
	(2, 6, 2, $64.64, 5, GETDATE()),
	(6, 6, 5, $16, 1, GETDATE()),
	(4, 2, 1, $1.38, 1307, GETDATE()),
	(3, 1, 2, $3.50, 1987, GETDATE()),
	(1, 7, 4, $3.50, 2018, GETDATE());

--1. Write a query to return a “report” of all users and their roles
--SELECT * FROM Users;
--SELECT * FROM Roles;
Select U.Name, U.RoleId,U.Name, R.Name
FROM Users U
JOIN Roles R
ON U.RoleId = R.ID;

--2. Write a query to return all classes and the count of guests that hold those classes
--SELECT * FROM Class order by id;
--SELECT * FROM Guests order by id;
--SELECT * FROM GuestStatus order by id;
--SELECT * FROM GuestClass;

SELECT Name,count(GuestID) as Total_Classes_By_Guest 
FROM Class 
JOIN GuestClass
ON  Class.ID = GuestClass.ClassID
group by Name;

--3. Write a query that returns all guests ordered by name (ascending) and their classes and corresponding levels. 
--Add a column that labels them beginner (lvl 1-5), intermediate (5-10) and expert (10+) for their classes (Don’t alter the table for this)
--SELECT * FROM Class order by id;
--SELECT * FROM GuestClass;
--SELECT * FROM Guests order by id;

SELECT g.Name, c.Name, gc.Level, 
CASE
	WHEN 
		gc.Level Between 1 and 30 THEN 'Beginner'
	WHEN
		gc.Level Between 30 and 70 THEN 'Intermediate'
	WHEN
		gc.Level Between 70 and 100 THEN 'Expert'
ELSE
	NULL
END AS guestGroupLevel
FROM Class c
JOIN GuestClass gc ON  c.ID = gc.ClassID
JOIN Guests g on g.ID = gc.GuestID
ORDER BY g.Name ASC;

-- 4. Write a function that takes a level and returns a “grouping” from question 3 (e.g. 1-5, 5-10, 10+, etc)
/*
CREATE FUNCTION [dbo].[Groupinglevel](@Level INT)
RETURNS VARCHAR(100)
AS
	BEGIN
		RETURN
			CASE
				WHEN 
					@Level Between 1 and 30 THEN 'Beginner'
				WHEN
					@Level Between 30 and 70 THEN 'Intermediate'
				WHEN
					@Level Between 70 and 100 THEN 'Expert'
				ELSE
					NULL
	END
END

SELECT [dbo].[Groupinglevel](100) as Groupinglevel
GO
*/