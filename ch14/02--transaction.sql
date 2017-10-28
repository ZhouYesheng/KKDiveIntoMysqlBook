####
#事务
###
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

#开启事务
START TRANSACTION;

#插入数据
INSERT INTO actor(actor_id,first_name,last_name)
	VALUES(201,'Lisa','Tom');

#提交
COMMIT;

#提交并开启一个新的事务
COMMIT AND CHAIN;