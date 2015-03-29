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


