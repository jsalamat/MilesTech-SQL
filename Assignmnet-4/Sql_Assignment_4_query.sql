--1. Write a query to return users who have admin roles
Select u.id,u.Users_name,r.Roles_name
from Users as u
inner join User_Roles as ur on u.id=ur.User_id
inner join Roles as r on r.id=ur.Role_id
where Roles_name ='Admin';

--2.Write a query to return users who have admin(owner) roles and information about their taverns
Select t.id,t.Tavern_name,u.Users_name, l.Locations_name
from Tavern as t
inner join Users as u on u.id=t.Owner_id
inner join Locations as l on l.id=t.Location_id
inner join Service as s on s.id=t.Services_id;

-- 3. Write a query that returns all guests ordered by name (ascending) and their classes and corresponding levels
Select Guests.Guess_Name, Classes.Classes_Name, Guests.level
from Guests
inner join Status on Guests.Status_id=Status.Id
inner join Classes on Guests.Classes_id=Classes.Id
Order by Guests.Guess_Name ASC; 

--4. Write a query that returns the top 10 sales in terms of sales price and what the services were
SELECT TOP 10 * 
FROM Supplies
Order by Price DESC;

SELECT * 
FROM Service
Order by Service_price DESC;

-- 5. Write a query that returns guests with 2 or more classes
-- Need to update table having issue with retraint on levels

-- 6. Write a query that returns guests with 2 or more classes with levels higher than 5
Select g.id,g.Guess_Name, g.level, c.Classes_Name
from Guests as g
inner join Status as s on g.Status_id=s.Id
inner join Classes as c on g.Classes_id=c.Id
WHERE g.level  > 5;

-- 7. Write a query that returns guests with ONLY their highest level class
Select g.id,g.Guess_Name, g.level, c.Classes_Name
from Guests as g
inner join Status as s on g.Status_id=s.Id
inner join Classes as c on g.Classes_id=c.Id
Order by g.level  DESC;

-- 8. Write a query that returns guests that stay within a date range. Please remember that guests can stay for more than one night AND not all of the dates they stay have to be in that range (just some of them)
-- Need to update table having issue [Could not create constraint or index. See previous errors.]
-- 9. Using the additional queries provided, take the lab’s SELECT ‘CREATE query’ and add any IDENTITY and PRIMARY KEY constraints to it.
-- Need to update table having issue [Could not create constraint or index. See previous errors.] -Broke my data