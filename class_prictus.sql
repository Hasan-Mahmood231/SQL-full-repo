
CREATE DATABASE T1	--create Database.
CREATE TABLE T1(
Reg VARCHAR(30) PRIMARY KEY NOT NULL,
name VARCHAR(100) NOT NULL,
adress VARCHAR(150) DEFAULT 'NOT GIVEN'
);

INSERT INTO t1 values 
( '23', 'ali' , 'xyz');

--CHECK THE VALUES HERE.
SELECT *
FROM T1

INSERT INTO T1(Reg) values('322')	--not inserted null bcz its NOTNULL.
INSERT INTO T1(Reg, name) 
values 
	('45','aaa'),
	('90','bb');

UPDATE T1 set name = 'hh' WHERE Reg = '45';
DELETE FROM T1 WHERE Reg = '45'



INSERT INTO T1 
VALUES 
	('1','ABC','KOHAT'),
	('2','BCD','PESHAWER')


--now make another table and insert the values from t1 to t2 new table.
SELECT adress 
INTO T2
FROM T1

SELECT *
FROM T2