####
#传统模式：验证日期合法性
###

#查询默认的SQL模式
SELECT @@sql_mode;

#创建表 t
DROP TABLE IF EXISTS t;
CREATE TABLE t(
	d DATETIME
);

#查询表 t
SELECT * FROM t;

#设置模式为 ANSI
SET SESSION sql_mode='ANSI';

#插入无效日期
#——》可以插入，但插入的是零值
INSERT INTO t VALUES('2007-04-31');

#设置模式为 TRADITIONAL
SET SESSION sql_mode='TRADITIONAL';


#插入无效日期
#——》不可以插入，收到日期错误
INSERT INTO t VALUES('2007-04-31');