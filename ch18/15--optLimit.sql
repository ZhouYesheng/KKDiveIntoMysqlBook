####
#优化分页
###
#直接表上查询和份分页效率不高
EXPLAIN
	SELECT film_id,description FROM film
		ORDER BY title
		LIMIT 50,5;

#索引上查询分页，然后回表查询其他数据效率更高
EXPLAIN
	SELECT a.film_id,a.description FROM film a
		INNER JOIN
			(SELECT film_id FROM film ORDER BY title LIMIT 50,5) b
		on a.film_id=b.film_id;


#将 LIMIT m,n 转换成 WHERE col >=m LIMIT n;
#只适合于不频繁插入的系统
EXPLAIN
	SELECT * FROM payment
		WHERE rental_id<1540
		ORDER BY rental_id DESC
		LIMIT 10;