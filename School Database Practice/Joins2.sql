-- Group by 


-- count number of students in each class
select sc.class_id, count(*) as 'Number of students'
from student_classes sc
group by sc.class_id
order by sc.class_id;

-- Classes with more than 100 students 
select sc.class_id, count(*) as 'Number of students'
from student_classes sc 
group by sc.class_id
having count(*) >100;


-- Parnets with moe than 1 kids in school

select parent_id , count(1) as 'Number of kids'
from student_parent sp
group by parent_id
having count(1) >1;


-- Nested Querries
-- Fetch the details of parents with more than 1 kid in school

select concat(p.first_name," ", p.last_name) as 'Parent name',
concat(s.first_name," " ,s.last_name) as 'Student Name',
s.age as 'Student Age',
s.gender as 'Student Gender'
from parents p
join student_parent sp on p.id = sp.parent_id
join students s on s.id = sp.student_id
where p.id in ( select parent_id
	 from student_parent
	 group by parent_id 
	 having count(1) > 1)
     
     
	
-- Staff details with salary less than 5000

select concat (s.first_name," ", s.last_name) as 'Full name', s.staff_type as 'Staff type', 
s.gender as 'Gender', ss.salary as 'Salary'
from staff s 
join staff_salary ss on s.staff_id = ss.staff_id
where ss.salary <5000;




-- Average salary paid to non tecahing staff

select avg(ss.salary) as 'Average Salary'
from staff_salary ss
join staff s on ss.staff_id = s.staff_id
where s.staff_type = 'Non-Teaching';

-- Sum of all diffrent types of salaries

select sum(ss.salary) as 'Sum', s.staff_type as 'Type'
from staff_salary ss
join staff s on ss.staff_id = s.staff_id
group by s.staff_type;