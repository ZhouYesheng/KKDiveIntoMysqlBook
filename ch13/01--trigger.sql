####
#触发器
###
#创建表 film
DROP TABLE IF EXISTS film;
CREATE TABLE film(
	film_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	price INT,
	forSalDate DATETIME,
	description TEXT
);

#查询表 film
SELECT * FROM film;

#创建表 film_text
DROP TABLE IF EXISTS film_text;
CREATE TABLE film_text(
	film_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	description TEXT
);

#查询表 film_text
SELECT * FROM film_text;

#创建插入后触发器 trigger_ins_film
DELIMITER $$
CREATE TRIGGER trigger_ins_film
	AFTER INSERT ON film FOR EACH ROW
	BEGIN
		INSERT INTO film_text(film_id,title,description)
			VALUES(new.film_id,new.title,new.description);
	END$$
DELIMITER ;

#插入记录到表 film
INSERT INTO film VALUES('0001','变形金刚',100,NOW(),'变形金刚最后的舞曲');