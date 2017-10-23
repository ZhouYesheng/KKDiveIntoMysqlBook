####
#存储引擎 MyISAM 默认的静态表
###


#创建 MyISAM 存储引擎静态表
CREATE TABLE MyISAM_char(
	name CHAR(10)
) ENGINE=MyISAM;

#插入记录，尾部含的空格会被剔除
INSERT INTO MyISAM_char
	VALUES('abcde'),('abcde '),('  abcde'),('   abcde   ');

#查询表 MyISAM_char
SELECT name,LENGTH(name) FROM MyISAM_char;