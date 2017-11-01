####
#索引的创建和重命名
###
#创建前缀索引
CREATE INDEX idx_title ON film(title(10));

#修改表 rental 的 索引 rental_date
ALTER TABLE rental DROP INDEX rental_date;
ALTER TABLE rental
	ADD INDEX idx_rental_date
		( rental_date,inventory_id,customer_id);

