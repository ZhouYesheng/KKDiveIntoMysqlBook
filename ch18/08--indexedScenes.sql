####
#使用索引的场景
###
#匹配全值——对全部索引列都使用具体值等值匹配
EXPLAIN
	SELECT * FROM rental
		WHERE rental_date='2005-05-25 17:22:10'
			AND inventory_id=373
			AND customer_id=343 \G;

#索引列的返回查询
EXPLAIN
	SELECT * FROM rental
		WHERE customer_id>=373 AND customer_id<400 \G

#为表 payment 创建复合索引
ALTER TABLE payment
	ADD INDEX idx_payment_date(payment_date,amount,last_update);

#最左索引
EXPLAIN
	SELECT * FROM payment
		WHERE payment_date='2006-02-14 15:16:03'
			AND last_update='2006-02-15 22:12:32' \G

#无复合索引的最左索引，不使用任何索引
EXPLAIN
	SELECT * FROM payment
		WHERE amount=3.98 AND last_update='2006-02-15 22:12:32';

#查询列即是索引列
EXPLAIN
	SELECT last_update	FROM payment
		WHERE payment_date='2006-02-14 15:16:03' AND amount=3.98;

#创建前缀索引
CREATE INDEX idx_title_desc_part ON film_text(title(10),description(20));

#使用前缀索引
EXPLAIN
	SELECT title FROM film_text
		WHERE title LIKE 'AFRICAN%';

#部分索引静配，部分索引范围
EXPLAIN
	SELECT inventory_id FROM rental
		WHERE rental_date='2006-02-14 15:16:03'
			AND customer_id>=300 AND customer_id<=400;

#列明即是索引， IS NULL 会使用索引
EXPLAIN
	SELECT * FROM payment
		WHERE rental_id IS NULL;

#查看服务器版本
SELECT VERSION();

#ICP 索引条件下放
EXPLAIN
	SELECT * FROM rental
		WHERE rental_date='2006-02-14 15:16:03'
			AND customer_id>=300 AND customer_id<=400;















