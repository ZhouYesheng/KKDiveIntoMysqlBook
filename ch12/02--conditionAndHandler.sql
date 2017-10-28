####
#条件和处理
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

#创建无主键重复错误处理器的过程 actor_insert
DELIMITER $$
CREATE PROCEDURE actor_insert()
BEGIN
	SET @x=1;
		INSERT INTO actor(actor_id,first_name,last_name) VALUES(2,'test','2');
	SET @x=2;
		INSERT INTO actor(actor_id,first_name,last_name) VALUES(1,'test','1');
	SET @x=3;
END $$

DELIMITER ;

#调用过程 actor_insert
CALL actor_insert();

#查询过程变量 @x
SELECT @x;

#创建声明了主键重复错误处理器的过程 actor_insert_handler
DELIMITER $$
CREATE PROCEDURE actor_insert_handler()
BEGIN
	DECLARE CONTINUE HANDLER FOR SQLSTATE '23000' SET @X2=1;
	SET @x=1;
		INSERT INTO actor(actor_id,first_name,last_name) VALUES(2,'test','2');
	SET @x=2;
		INSERT INTO actor(actor_id,first_name,last_name) VALUES(1,'test','1');
	SET @x=3;
END $$

DELIMITER ;

#调用过程 actor_insert_handler
CALL actor_insert_handler();

#查询过程变量 @x,@X2
SELECT @x,@X2;

