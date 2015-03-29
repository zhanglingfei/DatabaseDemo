SELECT * FROM user;

DELETE FROM user;

DROP TABLE user;

-- A

-- admin table
CREATE TABLE admin (
  id  int PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(20),
  password VARCHAR(20)
);

-- activity
CREATE TABLE activity (
  id  INT PRIMARY KEY AUTO_INCREMENT,
  name  VARCHAR(50)
);

-- apply
CREATE TABLE apply (
  id  INT PRIMARY KEY AUTO_INCREMENT,
  name  VARCHAR(20),
  sno VARCHAR(10),
  activityid int,
  CONSTRAINT FOREIGN KEY (activityid) REFERENCES activity(id)
);

DROP TABLE apply;

-- data
INSERT INTO admin VALUES (NULL , 'zhangsan', '123');

-- CRUD
-- 管理员登录
SELECT * FROM admin WHERE username = 'zhangsan' AND password = '123';

-- 管理员初始化活动项目
INSERT INTO activity VALUES (NULL , '北海公园划船');
INSERT INTO activity VALUES (NULL , '国家大剧院参观');
INSERT INTO activity VALUES (NULL , '登香山');

DELETE FROM activity WHERE id = '';

-- 学生报名
SELECT * FROM activity;

INSERT INTO apply VALUES (NULL , '王华', '200929001', 1);
INSERT INTO apply VALUES (NULL , '李立', '200929002', 3);

-- 管理员查询报名情况
SELECT * FROM activity;

SELECT apply.name, apply.sno, activity.name
FROM apply, activity
WHERE apply.activityid = activity.id
;

SELECT apply.name, apply.sno, activity.name
FROM apply, activity
WHERE apply.activityid = activity.id AND activity.id = 1
;

-- b 简易招聘网站

CREATE DATABASE b;
USE b;

-- admin table
CREATE TABLE admin (
  id  int PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(20),
  password VARCHAR(20)
);

-- 岗位信息
CREATE TABLE gangweixinxi (
  id  INT PRIMARY KEY AUTO_INCREMENT,
  bianhao VARCHAR(20),
  mingchen VARCHAR(20),
  zhize VARCHAR(20),
  yaoqiu VARCHAR(20)
);

-- 应聘
CREATE TABLE yingpin (
  id  INT PRIMARY KEY  AUTO_INCREMENT,
  xingming  VARCHAR(20),
  xingbie  VARCHAR(20),
  xueli  VARCHAR(20),
  zhuanye  VARCHAR(20),
  jineng  VARCHAR(20),
  gangweiid INT
);

ALTER TABLE yingpin
ADD FOREIGN KEY (gangweiid)
  REFERENCES gangweixinxi(id)
;

# Ctrl + / or Ctrl + Shift + /
# 管理员维护岗位信息
# （新加）

SELECT * FROM gangweixinxi;

INSERT INTO gangweixinxi VALUES (NULL , '001', 'Java程序员', 'coding...', '初级'); /*Ctrl + P(arameters)*/

UPDATE gangweixinxi
SET zhize = '开发'
WHERE id = 1;

DELETE FROM gangweixinxi
WHERE id = 1
;

# 用户填写个人信息

INSERT INTO yingpin VALUES (NULL , 'zhangsan', 'male', 'gaozhong', NULL , 'java', 1);

# 管理员查看某岗位的应聘情况
SELECT xingming, xingbie, xueli, zhuanye, jineng
FROM yingpin, gangweixinxi
WHERE yingpin.gangweiid = gangweixinxi.id AND gangweixinxi.id = 1
;

-- 电子词典

CREATE DATABASE c;
USE c;

-- words
CREATE TABLE words (
  id  INT PRIMARY KEY AUTO_INCREMENT,
  chinese VARCHAR(200),
  english VARCHAR(200),
  properties VARCHAR(20),
  clause VARCHAR(200)
);

-- 管理员维护词条
# add
INSERT INTO words VALUES (NULL , '春天', 'spring', '名词', 'In the spring , the days are warmer');
INSERT INTO words VALUES (NULL , '美丽的', 'beautiful', '形容词', 'The Beautiful Horse');
# update
UPDATE words set chinese = '', english='', properties = '', clause = '' WHERE id = 1;
# delete
DELETE FROM words WHERE id = 1;
# select
SELECT * FROM words;

-- 用户查单词
SELECT *
FROM words
WHERE chinese = '春天'
;
SELECT *
FROM words
WHERE english = 'beautiful'
;


SELECT *
FROM words
WHERE chinese = 'spring' OR english = 'spring'
;