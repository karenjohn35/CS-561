with q1 AS 
( SELECT cust, min(quant) min_q, max(quant) max_q, avg(quant) avg_q
 	FROM sales
 	GROUP BY cust
),
 
q2 AS 
(
SELECT q1.cust, q1.min_q, s.prod min_prod, s.date min_dt, s.state min_st, q1.max_q, q1.avg_q 
 	FROM q1, sales s
	WHERE q1.cust= s.cust 
	AND q1.min_q =s.quant
),
 
q3 AS 
(
 SELECT q2.cust, q2.min_q, q2.min_prod, q2.min_dt, q2.min_st, q2.max_q, s.prod max_prod, s.date max_dt, s.state max_state, q2.avg_q
	 FROM q2, sales s
	 WHERE q2.cust= s.cust
	 AND q2.max_q= s.quant
 )
 
 SELECT * FROM q3
	