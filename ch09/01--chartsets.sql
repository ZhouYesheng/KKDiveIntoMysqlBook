####
#字符集
###


#显示支持的字符集
SHOW CHARACTER SET;

#显示gbk的校对规则
SHOW COLLATION LIKE 'gbk%';

#显示服务器级字符集
SHOW VARIABLES LIKE 'character_set_server';

#显示数据库级字符集
SHOW VARIABLES LIKE 'character_set_database';

#创建指定字符集和校对规则的表
CREATE TABLE z1(
	id INT(11) DEFAULT 0
)ENGINE=MyISAM DEFAULT CHARSET=utf-8 COLLATE=utf8_bin;