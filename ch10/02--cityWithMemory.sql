####
#基于MEMORY存储引擎的城市表
###


#基于MEMORY存储引擎的城市表 city_memory
CREATE TABLE city_memory(
	city_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	city VARCHAR(50) NOT NULL,
	country_id SMALLINT UNSIGNED NOT NULL,
	last_update TIMESTAMP NOT NULL
		DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 	PRIMARY KEY(city_id),
 	KEY idx_fk_country_id(country_id)
) ENGINE=MEMORY DEFAULT CHARSET=gbk;

#插入表 city 的所有数据到表 city_memory
INSERT INTO city_memory
	SELECT * FROM city;

#解释城市表的索引
EXPLAIN SELECT * FROM city WHERE country_id >1 AND country_id <10;

#解释表 city_memory 的索引
EXPLAIN SELECT * FROM city_memory WHERE country_id >1 AND country_id <10;