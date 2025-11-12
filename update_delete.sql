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
