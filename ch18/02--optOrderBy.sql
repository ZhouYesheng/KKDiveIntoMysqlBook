####
#优化排序查询
###
#查看一个表上索引
SHOW INDEX FROM customer;

#有序索引直接排序
EXPLAIN
	SELECT customer_id FROM customer
		ORDER BY store_id;

#对查询结果排序
EXPLAIN
	SELECT * FROM customer
		ORDER BY store_id;

#对查询结果排序2
#即便是索引全覆盖，但仍对结果排序
ALTER TABLE customer ADD INDEX idx_storeid_email (store_id,email);
EXPLAIN
	SELECT store_id,email,customer_id FROM customer
		ORDER BY email;

#WHERE 和 ORDER 中使用同样索引
#——》直接使用索引排序
EXPLAIN
	SELECT store_id,email,customer_id FROM customer
		WHERE store_id=1
		ORDER BY email DESC;

#范围查询时，先查询，后排序
EXPLAIN
	SELECT store_id,email,customer_id FROM customer
		WHERE store_id<=3
		ORDER BY email DESC;

