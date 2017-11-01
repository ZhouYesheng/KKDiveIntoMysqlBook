####
#SHOW STATUS 查看服务器状态参数
###
#查看各语句的执行次数
SHOW STATUS LIKE 'Com_%';

#查询存储引擎 InnoDB 的统计参数
SHOW STATUS LIKE 'Innodb_rows%';

#查询服务器的连接次数
SHOW STATUS LIKE 'Connections%';

#查询服务器的工作时间
SHOW STATUS LIKE 'Uptime%';

#查询慢查询次数
SHOW STATUS LIKE 'Slow_queries%';