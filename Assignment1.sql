#1. select dest, distance from flights where distance = (select Max(distance) from flights) group by dest;

#2. select engines, MAX(seats) from planes group by engines

#3. select count(*) from flights

#4. select carrier, count(carrier) from flights group by carrier

#5. select carrier, count(carrier) from flights group by carrier order by count(carrier) DESC

#6. select carrier, count(carrier) from flights group by carrier order by count(carrier) DESC limit 5

#7. select carrier, count(carrier) from flights where distance>1000 group by carrier order by count(carrier) DESC limit 5

#8. What is the average arrival delay by destination airport, in descending order?
select dest, AVG(arr_delay) from flights group by dest order by avg(arr_delay) DESC
