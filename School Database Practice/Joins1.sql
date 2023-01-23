-- Joins 1
use schooldemo;
select * from school;

select * from staff_salary;


-- case statement
select STAFF_ID, SALARY,
CASE WHEN SALARY >= 10000 THEN 'High pay'
	WHEN SALARY between 5000 and 10000 THEN 'Medium Pay'
	WHEN SALARY <= 5000 THEN 'Low Pay'
END AS 'Salary range'
from staff_salary
order by staff_id desc;



-- Fetch class name where music is taught as a subject.

SELECT * from subjects


select CLASS_NAME
from subjects Sub
join classes Cls on Sub.subject_id = Cls.subject_id
where subject_name = 'Music';


-- Fetch full name of all teachers of mathematics

select distinct concat (first_name," ",last_name) as Fullname , cls.class_name
from subjects sub
join classes cls on cls.subject_id = sub.subject_id
join staff stf on cls.teacher_id = stf.staff_id
where sub.subject_name = 'Mathematics';



-- Fetch all non teaching staff

select concat (first_name," ", last_name) as Fullname, Age, Staff_type,
case when gender = 'M' then 'Male'
	when gender = 'F' then 'Female'
    end AS 'Gender', join_date
from staff
where staff_type = 'Non-Teaching'