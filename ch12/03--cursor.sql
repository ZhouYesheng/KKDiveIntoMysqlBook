####
#游标
###
#创建存储过程 proc_payment_stat
DELIMITER $$
CREATE PROCEDURE proc_payment_stat()
BEGIN
	DECLARE payment_id 	INT;
	DECLARE amount DECIMAL(5,2);
	#创建游标
	DECLARE cur_payments CURSOR FOR
		SELECT payment_id,amount FROM payment;
	#声明未发现错误处理器——》关闭游标并退出
	DECLARE EXIT HANDLER FOR NOT FOUND
		CLOSE cur_payments;
	#打开游标
	OPEN cur_payments;
	SET @i=0;
	#遍历游标
	REPEAT
		#取出游标当前指向的结果
		FETCH cur_payments INTO payment_id,amount;
			SET @i=@i+1;
	UNTIL 0 END REPEAT;
	CLOSE cur_payments;
END $$
DELIMITER ;

#调用过程 proc_payment_stat
CALL proc_payment_stat();

#查询累加器
SELECT @i;