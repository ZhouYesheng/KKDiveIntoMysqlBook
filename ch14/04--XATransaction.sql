####
#分布式事务
###

#创建数据库 db1
CREATE DATABASE db1;

#创建数据库 db2
CREATE DATABASE db2;

#创建演员表 actor
DROP TABLE IF EXISTS actor;
CREATE TABLE actor(
	actor_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

#插入测试数据
INSERT INTO actor VALUES(1,'xiaoming','wangbadan');

#查询演员表 actor
SELECT * FROM actor;


####
#------------------------会话1
###
#创建分支事务 test.db1
XA START 'test','db1';

#插入数据
INSERT INTO actor(actor_id,first_name,last_name)
	VALUES(301,'Simon','Tom');

#使分支事务 test.db1 进入预备状态
XA END 'test','db1';
XA PREPARE 'test','db1';

#查看当前分支事务状态
XA RECOVER;

#提交分支事务 test.db1
XA COMMIT 'test','db1';

####
#------------------------会话2
###
#创建分支事务 test.db2
XA START 'test','db2';

#更新数据
UPDATE actor SET last_name='MM';

#使分支事务 test.db2 进入预备状态
XA END 'test','db2';
XA PREPARE 'test','db2';

#查看当前分支事务状态
XA RECOVER;

#提交分支事务 test.db2
XA COMMIT 'test','db2';












