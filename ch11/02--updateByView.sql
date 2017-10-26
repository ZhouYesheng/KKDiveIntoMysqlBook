####
#通过视图更新表
###

#创建表 payment
DROP TABLE IF EXISTS payment;
CREATE TABLE payment(
	payment_id SMALLINT,
	payment_date DATETIME,
	amount DECIMAL(15,2)
);

INSERT INTO payment
	VALUES(1,'2006-05-01',4),
		(2,'2006-08-15',5),
		(3,'2007-02-20',6),
		(4,'2007-07-15',7),
		(5,'2006-03-31',12);

#创建1层视图
CREATE OR REPLACE VIEW payment_view AS
	SELECT payment_id,amount FROM payment
		WHERE amount < 10 WITH CHECK OPTION;

#创建2层视图
#本地检查选项
CREATE OR REPLACE VIEW payment_view1 AS
	SELECT payment_id,amount FROM payment_view
		WHERE amount>5 WITH LOCAL CHECK OPTION;

#创建2层视图2
#级联检查选项
CREATE OR REPLACE VIEW payment_view2 AS
	SELECT payment_id,amount FROM payment_view
		WHERE amount>5 WITH CASCADED CHECK OPTION;

#从视图 payment_view1 中查询
SELECT * FROM payment_view1;

#通过视图 payment_view1 更新
#——>允许更新
UPDATE payment_view1 SET amount=10;

#通过视图 payment_view2 更新
#——> 不允许更新
UPDATE payment_view2 SET amount=11;