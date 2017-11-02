####
#分析和检查表
###
#分析表
ANALYZE TABLE payment;

#检查表
CHECK TABLE payment_myisam;

#创建视图
CREATE VIEW v_payment_myisam AS
	SELECT * FROM payment_myisam;

#检查视图
CHECK TABLE v_payment_myisam;

#删除视图引用的表
DROP TABLE payment_myisam;

#再次检查视图
CHECK TABLE v_payment_myisam;

#优化表
OPTIMIZE TABLE payment;

#修改表的存储引擎
ALTER TABLE payment