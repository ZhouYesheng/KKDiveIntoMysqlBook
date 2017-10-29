####
#传统模式：mode0错误
###
#查询默认的SQL模式
SELECT @@sql_mode;

#查询表 t
SELECT * FROM t;

#创建表 t
DROP TABLE IF EXISTS t;
CREATE TABLE t(
	i INT
);

#设置模式为 ANSI
SET SESSION sql_mode='ANSI';

#插入非法模值
#——》可以插入，但插入的是NULL
INSERT INTO t VALUES(9%0);

#设置模式为 TRADITIONAL
SET SESSION sql_mode='TRADITIONAL';


#插入非法模值
#——》不可以插入，收到除零错误
INSERT INTO t VALUES(9%0);