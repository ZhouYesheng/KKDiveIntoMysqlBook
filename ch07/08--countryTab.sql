####
#国家表  country
###

#删除旧的国家表 country
DROP TABLE IF EXISTS country;

#创建主表 country
CREATE TABLE country(
	country_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	country VARCHAR(50) NOT NULL,
	last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 	PRIMARY KEY(country_id)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

#插入数据到国家表 country
INSERT INTO country(country_id,country)
	VALUES(1,'Afghanistan');


