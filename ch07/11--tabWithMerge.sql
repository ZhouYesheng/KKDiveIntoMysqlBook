####
#Merge存储引擎的表
###
#创建基于 MyISAM 存储引擎的表 payment_2006
CREATE TABLE payment_2006(
	country_id SMALLINT,
	payment_date DATETIME,
	amount DECIMAL(15,2)
) ENGINE=MyISAM;

#创建基于 MyISAM 存储引擎的表 payment_2007
CREATE TABLE payment_2007(
	country_id SMALLINT,
	payment_date DATETIME,
	amount DECIMAL(15,2)
) ENGINE=MyISAM;

#创建基于 MERGE 存储引擎的表 payment_all
#合并表 payment_2006,payment_2007
CREATE TABLE payment_all(
	country_id SMALLINT,
	payment_date DATETIME,
	amount DECIMAL(15,2)
) ENGINE=MERGE UNION=(payment_2006,payment_2007)
	INSERT_METHOD=LAST;

#插入测试数据 到表 payment_2006
INSERT INTO payment_2006
	VALUES(1,'2006-05-01',100000),
		(2,'2006-08-15',150000);

#插入测试数据 到表 payment_2007
INSERT INTO payment_2007
	VALUES(1,'2007-02-20',350000),
		(2,'2007-07-15',220000);

#插入测试数据 到表 payment_all
#并底层插入到表 payment_2007
INSERT INTO payment_all
	VALUES(3,'2006-03-31',112200);
















