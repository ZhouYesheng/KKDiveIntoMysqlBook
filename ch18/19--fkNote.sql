####
#外键使用注意
###
####
#-------------------MyISAM 的表不支持外界，定义外键报错，但也不起作用
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