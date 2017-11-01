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















