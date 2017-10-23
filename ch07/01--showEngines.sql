####
#查看存储引擎
###

#查看默认存储引擎
SHOW VARIABLES LIKE 'table_type';

#查看支持的存储引擎
SHOW ENGINES \G;

#查看支持的存储引擎——方式2
SHOW VARIABLES LIKE 'have%';

