####
#城市表 city
###

#删除旧的城市表 city
DROP TABLE IF EXISTS city;


#创建城市表 city
CREATE TABLE city(
	city_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	city VARCHAR(50) NOT NULL,
	country_id SMALLINT UNSIGNED NOT NULL,
	last_update TIMESTAMP NOT NULL
		DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 	PRIMARY KEY(city_id),
 	CONSTRAINT fk_city_country4 FOREIGN KEY (country_id)
 		REFERENCES country(country_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


#插入数据到城市表 city
INSERT INTO city(city_id,city,country_id)
	VALUES(251,'kabu1',1);