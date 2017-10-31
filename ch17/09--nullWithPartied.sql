####
#分区中的NULL值处理
###
#创建表 tb_range
#RANGE 分区中的 NULL 值会被当作最小值
DROP TABLE IF EXISTS tb_range;
CREATE TABLE tb_range(
	id INT,
	name VARCHAR(5)
)
PARTITION BY RANGE(id)
(
	PARTITION p0 VALUES LESS THAN (-6),
	PARTITION p1 VALUES LESS THAN (0),
	PARTITION p2 VALUES LESS THAN (1),
	PARTITION p3 VALUES LESS THAN MAXVALUE
);

#查询表 tb_range
SELECT * FROM tb_range;

#插入 NULL 值
INSERT INTO tb_range VALUES(NULL,'NULL');

#创建表 tb_list
#LIST 分区定义不包含 NULL 值时，插入 NULL 值会报错
DROP TABLE IF EXISTS tb_list;
CREATE TABLE tb_list(
	id INT,
	name VARCHAR(5)
)
PARTITION BY LIST(id)
(
	PARTITION p1 VALUES IN (0),
	PARTITION p2 VALUES IN (1)
);

#查询表 tb_list
SELECT * FROM tb_list;

#插入 NULL 值会报错
INSERT INTO tb_list VALUES(NULL,'NULL');


#创建表 tb_list
#LIST 分区定义包含 NULL 值时，插入 NULL 值是可以的
DROP TABLE IF EXISTS tb_list;
CREATE TABLE tb_list(
	id INT,
	name VARCHAR(5)
)
PARTITION BY LIST(id)
(
	PARTITION p1 VALUES IN (0,NULL),
	PARTITION p2 VALUES IN (1)
);

#查询表 tb_list
SELECT * FROM tb_list;

#插入 NULL 值会报错
INSERT INTO tb_list VALUES(NULL,'NULL');

#创建表 tb_hash
#HASH 分区的 NULL 值会被当做零值
DROP TABLE IF EXISTS tb_hash;
CREATE TABLE tb_hash(
	id INT,
	name VARCHAR(5)
)
PARTITION BY HASH(id)
PARTITIONS 2;

#查询表 tb_hash
SELECT * FROM tb_hash;

#插入 NULL 值会报错
INSERT INTO tb_hash VALUES(NULL,'NULL');
