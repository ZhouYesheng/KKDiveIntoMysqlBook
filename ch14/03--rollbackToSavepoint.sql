####
#回滚到保存点
###

#开启事务
START TRANSACTION;

#插入第一条记录
INSERT INTO actor(actor_id,first_name,last_name)
	VALUES(301,'Simon','Tom');

#查询
SELECT * FROM actor;

#设置保存点
SAVEPOINT test;

#插入第二条记录
INSERT INTO actor(actor_id,first_name,last_name)
	VALUES(302,'Simon','Cof');

#查询
SELECT * FROM actor;

#回滚到保存点
ROLLBACK TO SAVEPOINT test;


#查询
SELECT * FROM actor;

#提交
COMMIT;


#查询
SELECT * FROM actor;