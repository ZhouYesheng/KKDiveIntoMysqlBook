####
#SQL Mode SQL模式
###

#查询默认的SQL模式
SELECT @@sql_mode;

#创建表 t
DROP TABLE IF EXISTS t;
CREATE TABLE t(
	name VARCHAR(20),
	email VARCHAR(40)
);

#查询表 t
SELECT * FROM t;

#插入超长值
#——》可以插入，但收到截断警告
INSERT INTO t VALUES('123400000000000000000099999','beijing@126.com');

#设置严格模式
SET SESSION sql_mode='STRICT_TRANS_TABLES';

#插入超长值
#——》不可以插入，收到错误
INSERT INTO t VALUES('123400000000000000000099999','beijing@126.com');