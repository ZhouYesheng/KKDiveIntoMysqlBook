####
#PIPES_AS_CONCAT 模式
###

#设置模式为 ANSI
#ANSI 模式包含 PIPES_AS_CONCAT
SET SESSION sql_mode='ANSI';

#查询字符串
SELECT 'beijing' || '欢迎你';