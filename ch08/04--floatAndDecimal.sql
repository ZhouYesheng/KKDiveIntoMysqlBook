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