####
#InnoDB支持的外键FK约束
###


#尝试删除有外键关联的父表记录
#——>不允许删除
DELETE FROM country WHERE country_id=1;

#尝试更新有外键关联的父表记录
#——> 关联的子表记录也被更新
UPDATE country SET country_id=10000 WHERE country_id=1;

#打开外键约束检查
SET FOREIGN_KEY_CHECKS=1;

#关闭外键约束检查
SET FOREIGN_KEY_CHECKS=0;