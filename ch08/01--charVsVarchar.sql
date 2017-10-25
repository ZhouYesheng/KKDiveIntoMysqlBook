####
#char与varchar的选择
###

#创建表 vc
CREATE TABLE vc(
	v VARCHAR(4),
	c CHAR(4)
);

#插入测试数据
#包含尾部空格
INSERT INTO vc VALUES('ab  ','ab  ');

#查询 vc
#——> v保留尾部空格，c剔除尾部空格
SELECT CONCAT(v,'+'),CONCAT(c,'+') FROM vc;

