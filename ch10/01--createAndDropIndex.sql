####
#创建和删除索引
###

#为表 city 创建前缀索引
CREATE INDEX idx_cityname ON city(city(10));

#删除表 city 的前缀索引
DROP INDEX idx_cityname ON city;