####
#事件
###

#创建事件 myevent
CREATE EVENT myevent
	ON SCHEDULE AT CURRENT_TIMESTAMP+INTERVAL 1 HOUR
	DO
	   UPDATE payment SET amount=amount+1;

#创建测试表 test
DROP TABLE IF EXISTS test;
CREATE TABLE test(
	id VARCHAR(10),
	create_time DATETIME
);

#查询表 test
SELECT * FROM test;

#创建事件调度器 test_event_1
#每5秒向表 test 中插入一条记录
CREATE EVENT test_event_1
	ON SCHEDULE EVERY 5 SECOND
	DO
		INSERT INTO test VALUES('test',NOW());

#查询事件调度器
SHOW EVENTS;

#打开事件调度器
SET GLOBAL event_scheduler=1;

#删除事件调度器
DROP EVENT test_event_1;
DROP EVENT myevent;