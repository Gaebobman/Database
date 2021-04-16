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

-- Can you find  ALL the supervisors (direct and indirect) of “Bob”?
with test (person, supervisor) as
(select 'bob', 'alice'   from dual union all
     select 'mary', 'susan'  from dual union all
     select 'alice', 'david' from dual union all
     select 'david', 'mary'  from dual
    )
  select sys_connect_by_path(supervisor, '->') sv
  from test
  start with person = 'bob'
  connect by person = prior supervisor;


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
-- WHERE: 튜플의 조건 , HAVING: 그룹의 조건
SELECT dept_name, AVG(salary)
FROM instructor
GROUP BY dept_name
HAVING AVG(salary)>42000;

-- Set Membership
--p.3.37
--Find courses offered in Fall 2017 and in Spring 2018

Select course_id
from section
WHERE semester = 'Fall' and year = '2009'
and course_id in (select course_id
from section
WHERE semester = 'Spring' and year = '2010');

--Find courses offered in Fall 2017 but not in Spring 2018
Select course_id
from section
WHERE semester = 'Fall' and year = '2009'
and course_id not in (select course_id
from section
WHERE semester = 'Spring' and year = '2010');

--p.3.38
--Name all instructors whose name is neither “Mozart” nor Einstein”

select name
from instructor
where name not in ('Mozart', 'Einstein');

-- Find the total number of (distinct) students 
-- who have taken course sections taught by the instructor with ID 10101

select count (distinct T.id)
FROM takes T, teaches E
WHERE T.course_id = E.course_id
AND T.sec_id = E.sec_id
AND T.semester = E.semester
AND T.year = E.year
AND E.id = '10101';

select count (distinct ID)
from takes
where (course_id, sec_id, semester, year) in 
(select course_id, sec_id, semester, year
                                 from teaches
                                 where teaches.ID= 10101);

-- Find names of instructors with salary greater than that of some (at least one) 
-- instructor in the Biology department.

Select name 
FROM instructor
WHERE Salary > some(Select salary
    from instructor
    where dept_name = 'Biology');

Select name 
FROM instructor
WHERE Salary > (Select min(salary)
    from instructor
    where dept_name = 'Biology');

-- Find the names of all instructors whose salary is greater than the salary of 
-- all instructors in the Biology department.

Select name 
FROM instructor
WHERE Salary > all(Select salary
    from instructor
    where dept_name = 'Biology');

-- Yet another way of specifying the query “Find all courses taught in both the 
-- Fall 2017 semester and in the Spring 2018 semester”

select course_id
from section A
where semester = 'Fall' and year = '2009'
and exists (
    select *
	from section B
	where A.course_id = B.course_id and
    semester = 'Spring' and year = '2010');

-- Use of “not exists” Clause
-- Find all students who have taken all courses offered in the Biology department
-- p.3.46
Select S.name ,S.id
FROM Student S
WHERE NOT EXISTS (
    (SELECT course_id
    FROM Course
    Where Dept_name ='Biology')
    MINUS
    (Select T.course_id
     FROM Takes T
     WHERE T.id = S.id
    )
);
    






select S.name, S.id
from student S
where not exists(
    (Select course_id
    from course
    where dept_name = 'Biology')
    minus
    (select T.course_id
     From takes T
     where T.id = S.id
 	)
);

-- p.3.47
-- Find all courses that were offered at most once in 2017

/*SELECT C.course_id
FROM course C
WHERE UNIQUE(
    select S.course_id
    FROM section S
    WHERE C.course_id = S.course_id
	and S.year = '2009'
);
*/

-- Subqueries in the Form Clause
--p.3.49

-- Find the average instructors’ salaries of those departments 
-- where the average salary is greater than $42,000.”
Select dept_name, avg_salary
from (select dept_name, avg(salary) avg_salary
    from instructor
    group by dept_name
)
where avg_salary >'42000';

-- With Clause
-- p.3.50
-- Find all departments with the maximum budget 
-- with의 값이 하나일때만 씁시다.

/*
with max_budget(value) as 
	(select max(budget)
        from department)
select D.dept_name
from department D
where D.budget =max_budget.value;
안됨 */

select dept_name
from department
where budget = (select max(budget)
FROM department
);

-- Complex Queries using With Clause
-- p.3.51
-- Find all departments where the total salary is greater than the average of the total salary at all departments

--생략

-- Scalar Subquery
--p.3.52
-- List all departments along with the number of instructors in each department

Select dept_name, (select count(id)	
    				From instructor
    				where department.dept_name = instructor.dept_name) as ins_count
from department;


-- 4장 chapter 4
-- p.4.4
-- Natural Join in SQL
-- List the names of instructors along with the course ID of the courses that they taught
Select id, course_id
FROM instructor NATURAL JOIN teaches;

SELECT * 
FROM student natural join takes;

-- p.4.9
-- List the names of students along with the titles of courses that they have taken

SELECT name, title 
from student natural join takes, course
Where takes.course_id = course.course_id;

-- p.4.10
-- To avoid the danger of equating attributes erroneously, we can use the “using” construct
-- that allows us to specify exactly which columns should be equated.
select name, title
from (student natural join takes) join course using (course_id);


/*[ON vs WHERE]
ON : JOIN 을 하기 전 필터링을 한다 (=ON 조건으로 필터링이 된 레코들간 JOIN이 이뤄진다)
WHERE : JOIN 을 한 후 필터링을 한다 (=JOIN을 한 결과에서 WHERE 조건절로 필터링이 이뤄진다)
*/
-- p.4.11

select *
from takes join student on student.id= takes.id;
-- 중복삭제 X

-- 실행안됨 (중복 컬럼이름들 바꿔주면 됨)
select *
from takes, student
where takes.id = student.id;
-- 같은거


select *
from takes natural join student;
-- 중복삭제 O














