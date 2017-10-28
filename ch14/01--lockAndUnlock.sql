####
#锁定与解锁
###

####
#-------------------会话1
###
#锁定读锁
LOCK TABLE film_text READ;

#读取表 film_text
SELECT * FROM film_text;

#释放锁
UNLOCK TABLES;


####
#---------------------会话2
###
#读取表 film_text
SELECT * FROM film_text;

#更新 film_text
UPDATE film_text SET title='葫芦娃';