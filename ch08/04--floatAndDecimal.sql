####
#浮点数  VS 定点数
###

#创建浮点数表 t
DROP TABLE IF EXISTS t;
CREATE TABLE t(f FLOAT(8,1));

#插入测试数据
#——> 1.25456会被隐式的四舍五入
INSERT INTO t VALUES(1.23456),(1.25456);

#查询全部
SELECT * FROM t;

####
#浮点数与定点数的精度测试
###
#创建表 test
DROP TABLE IF EXISTS test;
CREATE TABLE test(
	c1 FLOAT(10,2),
	c2 DECIMAL(10,2)
);


#插入测试数据
INSERT INTO test VALUES(131072.32,131072.32);

#查询全部 test
SELECT * FROM test;