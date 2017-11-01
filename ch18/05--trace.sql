####
#SQL追溯分析
###
#打开 TRACE
SET OPTIMIZER_TRACE='enabled=on',END_MARKERS_IN_JSON=on;
SET OPTIMIZER_TRACE_MAX_MEM_SIZE=1000000;

#查询
SELECT rental_id FROM rental
	WHERE 1=1 AND rental_date>='2005-05-25 04:00:00'
		AND rental_date <= '2005-05-25 05:00:00'
		AND inventory_id=4466;

