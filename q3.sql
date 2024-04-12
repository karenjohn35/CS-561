with q1 as 
( select year, month, day, sum(quant) total
 from sales
 group by year, month, day

),

q2 as 
( select year, month, max(total) busiest_q
 	from q1
 	group by year, month

),

q3 as 
(
	select q1.year, q1.month, q1.day busiest_day, q2.busiest_q
	from q1,q2
	where q2.busiest_q= q1.total
	and q1.year= q2.year
	and q1.month= q2.month
	
),

q4 as
(
	select year, month, min(total) slowest_q
 	from q1
 	group by year, month

),

q5 as 
(
	select q1.year, q1.month, q1.day slowest_day, q4.slowest_q
	from q1,q4
	where q4.slowest_q= q1.total
	and q1.year= q4.year
	and q1.month= q4.month

)



SELECT * FROM (q3 natural join q5)



	