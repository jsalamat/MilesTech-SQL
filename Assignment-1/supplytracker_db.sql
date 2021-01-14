create database Supplytracker_db;

use Supplytracker_db;

create table Supplies
(
    id int identity(1,1),
	Supplies_name varchar(100),
	Unit_id int,
    Name_id int,
	PRIMARY KEY (id)
)

create table Supply_name
(
    id int identity(1,1),
	Supply_name varchar(100),
	Ounce int,
    Strong_ale boolean DEFAULT false,
	PRIMARY KEY (id)
)

create table Inventory
(
    id int identity(1,1),
	Inventory_id int,
    Supply_id int,
    Tavern_id int,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
)

create table Tavern
(
    id int identity(1,1),
	Tavern_name  varchar(200),
    Supply_id int,
    Services_id int,
    Table_id int,
    Amount money,
    Paid boolean DEFAULT false,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
)

create table Services
(
    id int identity(1,1),
	Service_name varchar(100),
	PRIMARY KEY (id)
)

create table Venues
(
    id int identity(1,1),
	Venues_name varchar(100),
    Actice boolean DEFAULT true,
	PRIMARY KEY (id)
)

create table Discontinue
(
    id int identity(1,1),
    Supply_id int,
	PRIMARY KEY (id)
)

create table Out_of_stock
(
    id int identity(1,1),
    Supply_id int,
	PRIMARY KEY (id)
)

create table Tables
(
    id int identity(1,1),
    guest_id int,
    Amount money,
    Paid boolean DEFAULT false,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
)

create table Guest
(
    id int identity(1,1),
    guest_name varchar(100),
    Amount money,
    Paid boolean DEFAULT false,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
)