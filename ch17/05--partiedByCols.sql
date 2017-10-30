####
#多列分区 COLUMNS
###
#创建表 rc3
#支持多列分区的 COLUMNS 分区
DROP TABLE IF EXISTS rc3;
CREATE TABLE rc3(
	a INT,
	b INT
)
PARTITION BY RANGE COLUMNS(a,b)
(
	PARTITION p01 VALUES LESS THAN (0,10),
	PARTITION p02 VALUES LESS THAN (10,10),
	PARTITION p03 VALUES LESS THAN (10,20),
	PARTITION p04 VALUES LESS THAN (10,35),
	PARTITION p05 VALUES LESS THAN (10,MAXVALUE),
	PARTITION p06 VALUES LESS THAN (MAXVALUE,MAXVALUE)
);

#查询表 rc3
SELECT * FROM rc3;

#插入测试数据 rc3
INSERT INTO rc3(a,b) VALUES(1,10);

#查询分区数据
SELECT partition_name part,
		partition_expression expr,
		partition_description descr,
		table_rows
		FROM information_schema.partitions
		WHERE TABLE_SCHEMA=schema() AND TABLE_NAME='rc3';