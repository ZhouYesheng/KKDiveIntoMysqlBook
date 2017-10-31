####
#HASH 分区管理——合并分区和增加分区
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


#查询分区数据
SELECT partition_name part,
	partition_expression expr,
	partition_description descr,
	table_rows
	FROM information_schema.partitions
	WHERE TABLE_SCHEMA=SCHEMA() AND TABLE_NAME='emp';


#合并 HASH 分区，从4个合并成2个
ALTER TABLE emp
	COALESCE PARTITION 2;

#COALESCE 不能用来增加 HASH 分区，会报错
ALTER TABLE emp
	COALESCE PARTITION 8;

#增加 HASH 分区新增数量
ALTER TABLE emp
	ADD PARTITION PARTITIONS 8;