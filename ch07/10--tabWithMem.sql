####
#内存存储引擎的表
###

#创建基于内存存储引擎 MEMORY 的表 tab_memory
CREATE TABLE tab_memory ENGINE=MEMORY
	SELECT city_id,city,country_id FROM city;

#指定内存表 tab_memory 使用 hash 索引
CREATE INDEX mem_hash
	USING HASH ON tab_memory(city_id);

#查看内存表 tab_memory 的索引
SHOW INDEX FROM tab_memory;