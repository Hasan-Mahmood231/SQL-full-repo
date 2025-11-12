use bsse
create table stud(
reg VARCHAR(23) primary key,
namee VARCHAR(34),
)
ALTER TABLE stud ADD marks INT;

--INSERTION INTO STUDENT 
INSERT INTO stud(reg,namee,marks)
VALUES
('se12923234','kalleem',234),
('se3423','khan',22)

SELECT *
FROM stud

--update the student in data base 
UPDATE stud 
SET MARKS = 99
WHERE reg = 'se3423'


SELECT *
FROM stud

--now again insert the data of some students
INSERT INTO stud(reg,namee,marks)
VALUES
('SE323232','hasseb',9909)

SELECT *
FROM stud