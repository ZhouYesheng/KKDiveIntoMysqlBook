####
#创建视图
###

#创建地址表 address
CREATE TABLE address(
	address_id INT(11) PRIMARY KEY,
	address VARCHAR(100)
);

#创建员工表 staff
CREATE TABLE staff(
	staff_id INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	address_id INT(10),
	CONSTRAINT fk_address FOREIGN KEY(address_id)
		REFERENCES address(address_id)
);


#创建基于员工表 staff 和地址表 address 的视图
CREATE OR REPLACE VIEW staff_list_view	AS
	SELECT s.staff_id,s.first_name,s.last_name,a.address
		FROM staff s,address a
			WHERE s.address_id=a.address_id;