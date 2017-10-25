####
#合成索引
###
#删除表 t
DROP TABLE IF EXISTS t;

#创建表 t
#其具备合成索引字段，以提高查询效率
CREATE TABLE t(
	id VARCHAR(100),
	context BLOB,
	hash_value VARCHAR(40)
);

#向表 t 中插入数据
INSERT INTO t
	VALUES('1',REPEAT('beijing',2),MD5(context)),
		('2',REPEAT('beijing',2),MD5(context)),
		('3',REPEAT('beijing 2008',2),MD5(context));


#查询合成索引字段
SELECT * FROM t WHERE hash_value=MD5(REPEAT('beijing 2008',2));

#创建表 t 前缀索引
#用于模糊匹配
CREATE INDEX idx_blob ON t(context(100));

#查询模糊匹配前缀索引
SELECT * FROM t WHERE context LIKE 'beijing%';