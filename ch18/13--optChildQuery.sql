####
#优化嵌套的子查询
###
#子查询的效率较低
EXPLAIN
	SELECT * FROM customer
		WHERE customer_id NOT IN
			(SELECT customer_id FROM payment);

#同样功能的 JOIN 连接查询效率更高
EXPLAIN
	SELECT * FROM customer a
		LEFT JOIN payment B
		ON a.customer_id=b.customer_id
		WHERE b.customer_id IS NULL;

