/*
DROP TABLE IF EXISTS Supplies;
Create table Supplies
(
    Supplies_id int Primary Key identity(1,1),
	Supplies_name varchar(100),
    Unit_id int,
	Price float
);

SELECT *
FROM Supplies;

DROP TABLE IF EXISTS Tavern;
Create table Tavern
(
    Tavern_id int Primary Key identity(1,1),
	Tavern_name varchar(100),
    Supply_id int,
    Services_id int,
    Table_id int,
	Price float
);

SELECT *
FROM Tavern;
*/
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