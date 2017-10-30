####
#哈希值分区 HASH
###
#创建分区表 emp
#——》哈希分区
DROP TABLE IF EXISTS emp;
CREATE TABLE emp(
	id INT NOT NULL,
	ename VARCHAR(30),
	hired DATE NOT NULL DEFAULT '1970-01-01',
	separated DATE NOT NULL DEFAULT '9999-12-31',
	job VARCHAR(30) NOT NULL,
	store_id INT NOT NULL
)
PARTITION BY HASH(store_id) PARTITIONS 4;

#查看表 emp
SELECT * FROM emp;

#插入测试数据 emp
INSERT INTO emp VALUES(1,'Tom','2010-10-10','9999-12-31','CLERK',234);