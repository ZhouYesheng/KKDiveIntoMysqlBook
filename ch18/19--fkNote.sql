####
#外键使用注意
###
####
#-------------------MyISAM 的表不支持外键，定义外键报错，但也不起作用
###
CREATE TABLE users(
	id INT,
	name VARCHAR(10),
	PRIMARY KEY(id)
) ENGINE=MyISAM;

#创建表 books
#并外键指向 users 表，实际并不会起作用
CREATE TABLE books(
	id INT,
	bookname VARCHAR(10),
	userid INT,
	PRIMARY KEY(id),
	CONSTRAINT fk_userid_id FOREIGN KEY(userid)
		REFERENCES users(id)
) ENGINE=MyISAM;

#插入表 books ，外键约束不起作用
#可以正常插入
INSERT INTO books VALUES(1,'book1',1);


####
#-------------------InnoDB 的表支持外键，插入时会检查外键约束
###
CREATE TABLE users2(
	id INT,
	name VARCHAR(10),
	PRIMARY KEY(id)
) ENGINE=InnoDB;

#创建表 books2
#并外键指向 users2 表，该外键会约束插入的新记录的有效性
CREATE TABLE books2(
	id INT,
	bookname VARCHAR(10),
	userid INT,
	PRIMARY KEY(id),
	CONSTRAINT fk_userid_id FOREIGN KEY(userid)
		REFERENCES users2(id)
) ENGINE=InnoDB;

#插入表 books2 ，外键约束
#——》无法插入
INSERT INTO books2 VALUES(2,'book2',2);