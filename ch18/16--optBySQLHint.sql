####
#使用 SQL Hint 优化
###

#建议使用某个索引
EXPLAIN
	SELECT COUNT(*) FROM rental
		USE INDEX (idx_rental_date);

#强制忽略某个结果集
EXPLAIN
	SELECT * FROM rental
		IGNORE INDEX (idx_rental_date);

#查询比率较高时，直接忽略索引扫描全表
EXPLAIN
	SELECT * FROM rental
		WHERE inventory_id >1;

#USE INDEX 只是推荐使用指定索引
#但MySQL会根据优化器选择更合适的方式
EXPLAIN
	SELECT * FROM rental
		USE INDEX(idx_fk_inventory_id)
		WHERE inventory_id >1;

#FORCE INDEX 强制 MySQL 使用指定索引
EXPLAIN
	SELECT * FROM rental
		FORCE INDEX(idx_fk_inventory_id)
		WHERE inventory_id >1;






