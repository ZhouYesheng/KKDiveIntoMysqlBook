####
#存储过程与函数
###
#创建存储过程 film_in_stock
DELIMITER $$
CREATE PROCEDURE film_in_stock(IN p_film_id INT
	,IN p_store_id INT,OUT p_film_count INT)
	READS SQL DATA
BEGIN
	SELECT invenory_id FROM inventory
		WHERE film_id=p_film_id	AND store_id=p_store_id
			AND inventory_in_stock(invenory_id);

	SELECT FOUND_ROW() INTO p_film_count;
END$$
DELIMITER ;