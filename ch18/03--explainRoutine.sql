####
#查询SQL的执行计划
###

#查看执行计划
EXPLAIN
	SELECT SUM(amount) FROM customer a,payment b
		WHERE 1=1 AND a.customer_id =b.customer_id AND email='JANE.BENNETT@sakilacustomer.org' \G

#全表扫描
EXPLAIN
	SELECT * FROM film WHERE rating >9 \G

#索引全扫描
EXPLAIN
	SELECT title FROM film \G

#索引范围扫描
EXPLAIN
	SELECT * FROM payment
		WHERE customer_id>=300 AND customer_id <=350 \G

#非唯一索引扫描
EXPLAIN
	SELECT * FROM payment
		WHERE customer_id=350 \G

#JOIN 中的非唯一索引扫描
EXPLAIN
	SELECT b.*,a.* FROM payment a,customer b
		WHERE a.customer_id=b.customer_id \G

#唯一索引扫描
EXPLAIN
	SELECT * FROM film a,film_text b
		WHERE a.film_id=b.film_id \G


#去掉表 customer 的邮箱索引
ALTER TABLE customer DROP INDEX idx_email;

#添加表 customer 的唯一索引
ALTER TABLE customer ADD UNIQUE INDEX uk_email(email);

#自定义索引
EXPLAIN
	SELECT * FROM (
		SELECT * FROM customer
			WHERE email='AARON.SELBY@sakilacustomer.org'
	) a  \G

#不查询表或索引
EXPLAIN
	SELECT 1 \G

#扩展版 EXPLAIN
EXPLAIN EXTENDED
	SELECT SUM(amount) FROM customer a,payment b
		WHERE 1=1 AND a.customer_id =b.customer_id AND email='JANE.BENNETT@sakilacustomer.org' \G

#显示警告
SHOW WARNINGS \G

####
#-------------------EXPLAIN PARTITIONS 查询SQL访问的分区
###
#创建 HASH 分区表 customer_part
DROP TABLE IF EXISTS customer_part;
CREATE TABLE customer_part(
	customer_id SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
	store_id TINYINT(3) UNSIGNED NOT NULL,
	first_name VARCHAR(45) NOT NULL,
	last_name VARCHAR(45) NOT NULL,
	email VARCHAR(50) DEFAULT NULL,
	address_id SMALLINT(5) UNSIGNED NOT NULL,
	active TINYINT(1) NOT NULL DEFAULT 1,
	create_date DATETIME NOT NULL,
	last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY(customer_id)
)
PARTITION BY HASH(customer_id) PARTITIONS 8;

#查询 customer_part
SELECT * FROM customer_part;

#复制表 customer 的数据到 customer_part
INSERT INTO customer_part
	SELECT * FROM customer;

#EXPLAIN PARTITIONS 查看SQL访问的分区
EXPLAIN PARTITIONS
	SELECT * FROM customer_part
		WHERE customer_id=130 \G




































