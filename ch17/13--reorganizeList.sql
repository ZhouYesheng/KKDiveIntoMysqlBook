####
#List 分区管理——重新组织分区
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
	PARTITION p4 VALUES IN (6),
	PARTITION p5 VALUES IN (7,8)
);

#查询表 expenses
SELECT * FROM expenses;


#查询分区数据
SELECT partition_name part,
	partition_expression expr,
	partition_description descr,
	table_rows
	FROM information_schema.partitions
	WHERE TABLE_SCHEMA=SCHEMA() AND TABLE_NAME='expenses';

#增加新分区 p6
ALTER TABLE expenses
	ADD PARTITION (PARTITION p6 VALUES IN (11));

#将分区 p4,p5,p6 重新组织成 p4,p6
ALTER TABLE expenses
	REORGANIZE PARTITION p4,p5,p6 INTO(
		PARTITION p4 VALUES IN (6,11),
		PARTITION p5 VALUES IN (7,8)
	);