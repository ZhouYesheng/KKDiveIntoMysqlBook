####
#优化分组
###
#GROUP BY 默认对所有分组字段排序
EXPLAIN
	SELECT payment_date,SUM(amount) FROM payment
		GROUP BY payment_date;

#使用 ORDER BY NULL 可以避免不必要的排序
EXPLAIN
	SELECT payment_date,SUM(amount) FROM payment
		GROUP BY payment_date
		ORDER BY NULL;

