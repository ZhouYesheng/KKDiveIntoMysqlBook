####
#SHOW PROFILE 查询SQL的执行概要
###
#查看是否支持 profile
SELECT @@have_profiling;

#查看 profiling 是否开启
SELECT @@profiling;

#会话级开启 profiling
SET profiling=1;


####
#----------------比较 MyISAM 和 InnoDB 的count(*) 执行效率和过程
###

#查询 InnoDB 存储引擎的表 payment 的记录数
SELECT COUNT(*) FROM payment;

#查看执行过程
SHOW PROFILES;

#查询指定查询线程的状态和消耗
SHOW PROFILE FOR QUERY 2;


#倒序查询一个查询线程的状态和消耗
SET @query_id:=2;
SELECT state,
		SUM(duration) AS total_r,
		ROUND
		(
			100*SUM(duration)/
				(
					SELECT SUM(duration) FROM information_schema.profiling
						WHERE query_id =@query_id
				)
		,2) AS pct_r,
		COUNT(*) AS calls,
		SUM(duration)/COUNT(*) AS 'R/Call'
			FROM information_schema.profiling
			WHERE query_id=@query_id
			GROUP BY state ORDER BY total_r DESC;

#查看指定查询的 cpu 使用情况
SHOW PROFILE CPU FOR QUERY 2;

#创建存储引擎为 MyISAM 的副表 payment_myisam
CREATE TABLE payment_myisam LIKE payment;
ALTER TABLE payment_myisam ENGINE=MyISAM;
INSERT INTO payment_myisam
	SELECT * FROM payment;

#查询副表 payment_myisam 的记录数
SELECT COUNT(*) FROM payment_myisam;

