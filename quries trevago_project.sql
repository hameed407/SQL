# a.	How many females and how many male passengers traveled a minimum distance of 600 KMs?
select gender, count(*) as count 
from passenger where distance>=600 
group by gender;

# b.	Find the minimum ticket price of a Sleeper Bus
select * from price;
select *,min(price) 
from price where bus_type like 'Sleeper';

#c.	Select passenger names whose names start with character 'S' 
select passenger_name from passenger where passenger_name like 's%';

# d.	Calculate price charged for each passenger displaying Passenger name, Boarding City, 
# Destination City, Bus Type, Price in the output
select * from passenger,price;
select passenger_name, boarding_city, destination_city,p.bus_type , price from passenger p
inner join price pr 
on p.bus_type = pr.bus_type;

#e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?  

select * from price;
select p.passenger_name, pr.price, p.distance, pr.bus_type from passenger p
inner join price pr 
on p.bus_type = pr.bus_type 
where p.distance>=1000 and p.bus_type like "sitting";
#using subquery
 select * from passenger where passenger_id in
 (select id from price
 where Distance = 1000 and Bus_type='Sitting');
 select * from price;
 
 
  #f.	What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select bus_type, price from price where id in (select passenger_id from passenger where
passenger_name like "pallavi" and (Boarding_city, Destination_city) = ( "Panaji", "Bengaluru"));

#g.	List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order. 
select distinct distance  from passenger order by distance desc;

#h. Display the passenger name and percentage of distance traveled by that 
 # passenger from the total distance traveled by all passengers without using user variables 
 select * from passenger;
select passenger_name, 100*distance/sum(distance) over() as Percentage_of_Distance_Travelled from passenger;
 
 

