####
#MyISAM的自增字段可以是组合索引的n列
###

#创建存储引擎为 MyISAM 的自增长字段表 autoincre_demo
CREATE TABLE autoincre_demo(
	d1 SMALLINT NOT NULL AUTO_INCREMENT,
	d2 SMALLINT NOT NULL,
	name VARCHAR(10),
	INDEX(d2,d1)
) ENGINE=MyISAM;

#插入表 autoincre_demo
INSERT INTO autoincre_demo(d2,name)
	VALUES(2,'2'),(3,'3'),(4,'4'),(2,'2'),(2,'2'),(3,'3'),(4,'4');

#查询全部 autoincre_demo
#自增长队列是组合索引首列d2排序后的值
SELECT * FROM autoincre_demo;
