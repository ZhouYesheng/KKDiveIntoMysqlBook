####
#基于List实现的分区
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