####
#未使用到索引的场景
###
#%开头的模糊索引
EXPLAIN
	SELECT * FROM actor
		WHERE last_name LIKE '%NI%';

#先扫描索引表获取主键id
#再从数据表查询指定记录
EXPLAIN
	SELECT * FROM
		(SELECT actor_id FROM actor WHERE last_name LIKE '%NI%') a,
		actor b
	WHERE a.actor_id=b.actor_id;

#隐式类型转换，有索引页不使用
EXPLAIN
	SELECT * FROM actor WHERE last_name=1;

#数值型字符串一定要添加引号，确保无隐式转换
EXPLAIN
	SELECT * FROM actor WHERE last_name='1';

#复合索引不符合最左原则
EXPLAIN
	SELECT * FROM payment
		WHERE amount=3.98 AND last_update='2006-02-15 22:12:32';

#拼接标题
UPDATE film_text SET title=CONCAT('S',title);

#查询比率很高时也会直接查询表
EXPLAIN
	SELECT * FROM film_text
		WHERE title LIKE 'S%';

#or 前有索引，or 后无索引
#——》干脆都不用索引
EXPLAIN
	SELECT * FROM payment
		WHERE customer_id=203 or amount=3.96;

#查看索引使用情况
SHOW STATUS LIKE 'Handler_read%';






