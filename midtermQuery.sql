-- 중간대비 수업자료의 쿼리문을 모두 작성 해 봤습니다.
-- References
-- 집합연산자 - https://preamtree.tistory.com/45

-- Selection Operation 
-- p.2.12 
-- select those tuples of the instructor  
-- relation where the instructor is in the “Physics” department.

Select *
from instructor
where dept_name ='Physics';

-- p.2.13 
-- Find the instructors in Physics with a salary greater $90,000
Select *
from instructor
where Salary >'90000' and dept_name = 'Physics'; 

-- find all departments whose name is the same as their building name (없음 ㅋ)

SELECT *
FROM department
WHERE dept_name = building;

-- p.2.15
-- eliminate the dept_name attribute of instructor

Select id, name, salary from instructor;

--Union operation
--to find all courses taught in the Fall 2017 semester, or in the Spring 2018 semester, or in both
-- 09,10으로 처리
SELECT * 
FROM Section
WHERE Semester = 'Fall' and year = '2009'
UNION
SELECT * 
FROM Section
WHERE Semester = 'Spring' and year = '2010';

-- Set-Intersection
-- p.2.24
-- Find the set of all courses taught in both the Fall 2017 and the Spring 2018 semesters.
-- 09,10으로 처리

SELECT course_id 
FROM Section
WHERE Semester = 'Fall' and year = '2009'
INTERSECT
SELECT course_id 
FROM Section
WHERE Semester = 'Spring' and year = '2010';

-- Set Difference
-- p.2.25
-- to find all courses taught in the Fall 2017 semester, but not in the Spring 2018 semester

SELECT course_id 
FROM Section
WHERE Semester = 'Fall' and year = '2009'
MINUS
SELECT course_id 
FROM Section
WHERE Semester = 'Spring' and year = '2010';

-- Select Clause
-- p.3.14
-- Find the department names of all instructors, and remove duplicates
-- The keyword all specifies that duplicates should not be removed
SELECT distinct dept_name
FROM instructor;
SELECT all dept_name
FROM instructor;

-- Select Clause #연산 #수학연산 #expression
-- p.3.16 월급출력

SELECT id, name, salary/ 12 as monthly_salary
FROM instructor;

-- p.3.17
-- To find all instructors in Comp. Sci. dept

SELECT  name, dept_name 
FROM instructor
where dept_name = 'Comp. Sci.';

-- To find all instructors in Comp. Sci. dept with salary > 70000

SELECT  name, dept_name, salary 
FROM instructor
where dept_name = 'Comp. Sci.' and salary > 70000;

-- p.3.19
-- Find the names of all instructors who have taught some course and the course_id

SELECT I.NAME, T.course_id
FROM instructor I, teaches T
WHERE I.id = T.id;

-- p.3.21
-- Self Join Example

CREATE TABLE emp_super(
	person varchar(20),
    supervisor varchar(20),
    primary key (person)
);

/*
INSERT INTO emp_super
VALUES ('Bob', 'Alice');
INSERT INTO emp_super
VALUES ('Mary', 'Susan');
INSERT INTO emp_super
VALUES ('Alice', 'David');
INSERT INTO emp_super
VALUES ('David', 'Mary');*/

-- Find the supervisor of “Bob”
SELECT supervisor
FROM emp_super
where person = 'Bob';

-- Find the supervisor of the supervisor of “Bob”
SELECT B.supervisor
FROM emp_super A, emp_super B
WHERE A.supervisor = B.person
and A.person = 'Bob';

-- p.3.22
-- Find the names of all instructors whose name includes the substring “dar”.
-- "st"로 바꿨음

SELECT name 
FROM instructor
WHERE name like '%st%';
-- #ESCAPE #예약어 #\   =>   "100%" 는 '100 \%' 으로

-- Ordering the Display of Tuples
--p.3.24
-- List in alphabetic order the names of all instructors 

SELECT distinct name
FROM instructor
order by name ASC;

-- Where Clause Predicates
-- p.3.25 
-- Find the names of all instructors with salary between $90,000 and $100,000
--  (that is, >= $90,000 and <= $100,000)

SELECT NAME
FROM instructor
WHERE salary BETWEEN 90000 and 100000;

/* 이거 실행 안됨 ㅗㅗㅗ
select I.name, T.course_idUN
from instructor I, teaches T
where (I.ID, dept_name) = (T.ID, 'Biology');
*/

-- p.3.26
-- Find courses that ran in Fall 2017 but not in Spring 2018

SELECT COURSE_ID
FROM section
WHERE SEMESTER = 'Fall' and year = '2009'
MINUS
SELECT COURSE_ID
FROM section
WHERE SEMESTER = 'SPRING' and year = '2018';

-- Aggregate Functions #집합 #여러개에 적용되는
/*
avg: average value	
min:  minimum value	
max:  maximum value	
sum:  sum of values	
count:  number of values
*/
-- p.3.31
-- Find the average salary of instructors in the Computer Science department #평균

SELECT AVG(salary)
FROM instructor
where dept_name = 'Comp. Sci.';

-- Find the total number of instructors who teach a course in the Spring 2018 semester
-- 09년도로 바꿈
SELECT COUNT(DISTINCT ID)
FROM teaches
WHERE semester = 'Spring' and  year = '2009';

-- p.3.32
-- Find the average salary of instructors in each department

SELECT dept_name , AVG(salary)
FROM instructor
Group by dept_name;

--p.3.34

--Find the names and average salaries of all departments whose average salary is greater than 42000

SELECT dept_name, AVG(salary)
FROM instructor
GROUP BY dept_name
HAVING AVG(salary)>42000;


















































