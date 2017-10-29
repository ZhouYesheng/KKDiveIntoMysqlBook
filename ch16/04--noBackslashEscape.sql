####
#反斜杠不转义模式
###

#查询默认的SQL模式
SELECT @@sql_mode;

#查询表 t
SELECT * FROM t;


#创建表 t
DROP TABLE IF EXISTS t;
CREATE TABLE t(
	context VARCHAR(20)
);

#设置模式为 ANSI
SET SESSION sql_mode='ANSI';

#插入数据
#——》可以插入，但反斜杠被转义
INSERT INTO t VALUES('\beijing'),('\\beijing');

#设置模式为 NO_BACKSLASH_ESCAPES
SET SESSION sql_mode='REAL_AS_FLOAT,PIPES_AS_CONCAT,ANSI_QUOTES,IGNORE_SPACE,NO_BACKSLASH_ESCAPES';

#插入数据
#——》可以插入，反斜杠不会转义
INSERT INTO t VALUES('\beijing'),('\\beijing');