####
#存储引擎InnoDB支持自增长字段
###

#创建自增长字段的表 autoincre_demo
CREATE  TABLE autoincre_demo(
	i SMALLINT NOT NULL AUTO_INCREMENT,
	name VARCHAR(10),
	PRIMARY KEY(i)
) ENGINE=InnoDB;

#插入表 autoincre_demo
#自增长字段插入0、null时，实际插入自增值
INSERT INTO autoincre_demo
	VALUES(1,'1'),(0,'2'),(NULL,'3');

#查询 autoincre_demo
SELECT * FROM autoincre_demo;

#插入表 autoincre_demo
INSERT INTO autoincre_demo VALUES(4,'4');

#查询最新的自增值
SELECT LAST_INSERT_ID();

#插入表 autoincre_demo
INSERT INTO autoincre_demo(name)
	VALUES('5'),('6'),('7');


#查询最新的自增值
#单次插入多条记录，查询到的是第一个记录的id
SELECT LAST_INSERT_ID();