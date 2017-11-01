####
#定位与优化
###
#在表 customer 上建立 email 索引
CREATE INDEX idx_email ON customer(email);

#查看执行计划
EXPLAIN
	SELECT SUM(amount) FROM customer a,payment b
		WHERE 1=1 AND a.customer_id =b.customer_id AND email='JANE.BENNETT@sakilacustomer.org' \G