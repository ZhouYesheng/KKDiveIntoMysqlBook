####
#优化大批量插入
###

####
#-------------------------MyISAM表的批量插入优化
###
#创建存储引擎为 MyISAM 的副表 film_text2
CREATE TABLE film_text2 LIKE film_text;
ALTER TABLE film_text2 ENGINE=MyISAM;
INSERT INTO film_text2
	SELECT * FROM film_text;

#查询副表
SELECT * FROM film_text2;

#导出数据成txt
SELECT * FROM film_text INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/film_text2.txt';

#删除 film_text2 中的所有数据
DELETE FROM film_text2;

#禁用非唯一索引
ALTER TABLE film_text2 DISABLE KEYS;

#导入txt文件中的数据
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/film_text2.txt' INTO TABLE film_text2;

#开启非唯一索引
ALTER TABLE film_text2 ENABLE KEYS;


####
#---------------InnoDB存储引擎批量导入优化--临时关闭唯一性校验和自动提交
###

#导入前，关闭唯一性校验
SET UNIQUE_CHECKS=0;

#导入后，关闭唯一性校验
SET UNIQUE_CHECKS=1;

#导入前，关闭自动提交
SET AUTOCOMMIT=0;

#导入后，打开自动提交
SET AUTOCOMMIT=1;