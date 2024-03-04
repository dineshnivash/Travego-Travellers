-- a.How many female and male passengers traveled a minimum distance of 600KMs?
select gender, count(*) as Count_of_Passengers from travego.passenger where Distance>=600 group by gender;

-- b.Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus.
select * from travego.passenger where Distance>500 and bus_type ='Sleeper';

-- c.Select passenger names whose names start with the character'S'.
select Passenger_name from travego.passenger where passenger_name like 'S%';

-- d.Calculate the price charged for each passenger,displaying the Passenger name, BoardingCity, DestinationCity, Bustype,and Price in the output
select p.Passenger_name, p.Boarding_City, p.Destination_City, p.Bus_Type, pr.Price
from passenger p join price pr ON p.Distance = pr.Distance AND p.Bus_Type = pr.Bus_Type;

-- e.What are the passenger name(s) and the ticket price for those who traveled 1000KMs Sitting in a bus?
select passenger_name, price from passenger p join price pr on p.Bus_Type = pr.Bus_type and p.distance=pr.distance
where pr.distance = 1000 and pr.bus_type='Sitting';

-- f.What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select p.passenger_name, p.bus_type, p.boarding_city, p.destination_city, pr.price from passenger p join price pr on p.bus_type=pr.bus_type
where p.passenger_name='pallavi';

-- g.Alter the column category with the value "Non-AC" where the Bus_Type is sleeper
update passenger set category ='Non-AC' where bus_type ='Sleeper';
select * from travego.passenger;

-- h.Delete an entry from the table where the passenger name is Piyush and commit this change in the database.
delete from travego.passenger where passenger_name='Piyush';
commit;
select * from travego.passenger;

-- i.Truncate the table passenger and comment on the number of rows in the table(explain if required).
 truncate table travego.passenger;  #truncate will delete all the rows in a passenger table, it cannot be rollback and the data will deleted permenantly
 select count(*) as rows_count from travego.passenger; #after truncating the passenger table has 0 rows in it.
 
-- j.Delete the table passenger from the database.
drop table travego.passenger;
select * from travego.passenger; #after drop the table passenger doesn't exists
    