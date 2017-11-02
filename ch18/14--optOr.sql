####
#优化 OR 或查询
###
#查看表的索引
SHOW INDEX FROM actor;

#OR 连接单独的索引列
#——》分别索引查询后 UNION 联合
EXPLAIN
	SELECT * FROM sales2
		WHERE id=2 OR YEAR=1998;

#OR 未连接全索引
#——》不使用索引
EXPLAIN
	SELECT * FROM sales2
		WHERE customer_id=3 OR moneys=100;