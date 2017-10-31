####
#RNAGE 与 LIST 分区管理——增加新分区
###
#创建分区表 emp_date
DROP TABLE IF EXISTS emp_date;
CREATE TABLE emp_date(
	id INT NOT NULL,
	ename VARCHAR(30),
	hired DATE NOT NULL DEFAULT '1970-01-01',
	separated DATE NOT NULL DEFAULT '9999-12-31',
	job VARCHAR(30) NOT NULL,
	store_id INT NOT NULL
)
PARTITION BY RANGE(YEAR(separated))
(
	PARTITION p0 VALUES LESS THAN (1995),
	PARTITION p1 VALUES LESS THAN (2000),
	PARTITION p2 VALUES LESS THAN (2005),
	PARTITION p3 VALUES LESS THAN (2015)
);

#查询表 emp_date
SELECT * FROM emp_date;

#插入测试数据 emp_date
INSERT INTO emp_date(id,ename,hired,separated,job,store_id)
	VALUES(7499,'ALLEN','1981-02-30','2003-08-03','SALESMAN',30),
		(7511,'WARD','1981-02-22','1993-09-01','SALESMAN',30),
		(7566,'JONES','1981-04-02','2000-08-01','MANAGER',20),
		(7654,'MARTIN','1981-09-28','2012-12-31','SALESMAN',30),
		(7698,'BLAKE','1981-05-01','1998-09-08','MANAGER',30),
		(7782,'CLARK','1981-06-09','2007-08-01','MANAGER',10),
		(7788,'SCOTT','1987-04-19','2012-05-01','ANALYST',20),
		(7839,'KING','1981-11-17','2011-03-09','PRESIDENT',10),
		(7844,'TURNER','1981-09-08','2010-12-31','SALESMAN',30),
		(7876,'ADAMS','1987-05-23','2000-01-01','CLERK',20),
		(7900,'JAMES','1981-12-03','2004-09-02','CLERK',30),
		(7902,'FORD','1981-12-03','2010-12-31','ANALYST',20),
		(7934,'MILLER','1982-01-23','2011-12-31','CLERK',10);


#查询分区数据
SELECT partition_name part,
	partition_expression expr,
	partition_description descr,
	table_rows
	FROM information_schema.partitions
	WHERE TABLE_SCHEMA=SCHEMA() AND TABLE_NAME='emp_date';

#为表 emp_date 新增一个分区
ALTER TABLE emp_date
	ADD PARTITION (PARTITION p4 VALUES LESS THAN (2030));

#查看表 emp_date 的创建定义
#——》增加了分区 p4 的定义
SHOW CREATE TABLE emp_date;


#为表 emp_date 新增一个分区
#——》只能尾部添加新分区，因此无法添加成功
ALTER TABLE emp_date
	ADD PARTITION (PARTITION p5 VALUES LESS THAN (2025));

####
#---------------List分区添加新分区
###
#创建表 expenses
DROP TABLE IF EXISTS expenses;
CREATE TABLE expenses(
	expense_date DATE NOT NULL,
	category INT,
	amount DECIMAL(10,3)
)
PARTITION BY LIST(category)
(
	PARTITION p0 VALUES IN (3,5),
	PARTITION p1 VALUES IN (1,10),
	PARTITION p2 VALUES IN (4,9),
	PARTITION p3 VALUES IN (2),
	PARTITION p4 VALUES IN (6)
);

#查询表 expenses
SELECT * FROM expenses;


#为表 expenses 增加新的 LIST 分区 p5
ALTER TABLE expenses
	ADD PARTITION (PARTITION p5 VALUES IN (7,8));

#不能添加范围重叠的新分区 p6
ALTER TABLE expenses
	ADD PARTITION (PARTITION p6 VALUES IN (6,11));








