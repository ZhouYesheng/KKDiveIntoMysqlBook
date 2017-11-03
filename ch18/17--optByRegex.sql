####
#使用正则优化
###
#添加用于正则的测试数据
INSERT INTO customer(store_id,first_name,last_name,address_id,email)
	VALUES(1,'188mail','beijing',605,'beijing@188.com'),
		(1,'126mail','beijing',605,'beijing@126.com'),
		(1,'163mail','beijing',605,'beijing@163.com');

#使用正则匹配
SELECT first_name,email FROM customer
	WHERE email REGEXP '@163[,.]com';