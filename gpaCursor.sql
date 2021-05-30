SET SERVEROUTPUT ON
DECLARE
x_id VARCHAR(5);
x_name VARCHAR(20);
x_dept_name varchar(20);

x_course_id varchar(8);
x_sec_id varchar(8);
x_semester varchar(6);
x_year numeric(4,0);
x_grade varchar(2);

x_givengrade varchar(4);
x_coursecredit varchar(4);

totaltemp varchar(8) := '0';
givenGPA numeric(8, 1) := '0';
num_of_finished_course varchar(8):= '0';
-- x_numOfCourse;

CURSOR c1 is
    SELECT distinct(dept_name)
    FROM student;

CURSOR c2 is 
    SELECT id, name
    FROM student
    WHERE dept_name = x_dept_name;

CURSOR c3 is 
    SELECT T.course_id, T.semester, T.year, T.grade, G.N_grade, C.credits
    FROM takes T, grade G, course C
    WHERE T.id = x_id and G.L_grade = T.grade
    and T.course_id = C.course_id;


BEGIN
    OPEN c1;
    LOOP
        FETCH c1 INTO x_dept_name;
        EXIT WHEN c1%NOTFOUND;
        dbms_output.put_line (x_dept_name);
        OPEN c2;
        LOOP
        FETCH c2 INTO x_id, x_name;
        EXIT WHEN c2%NOTFOUND;
        dbms_output.put_line ('       '||x_name);
            OPEN c3;
            LOOP
            FETCH c3 INTO x_course_id, x_semester,x_year, x_grade, x_givengrade, x_coursecredit;
            EXIT WHEN c3%NOTFOUND;
                if(x_givengrade > 0) then
                    
            	    totaltemp := totaltemp + x_coursecredit;
                    givenGPA := givenGPA + (x_givengrade * x_coursecredit);
                END if;

            dbms_output.put_line ('              '||x_course_id||' '||x_semester||'       '||x_year||' '|| x_grade);
            END LOOP;
            if(totaltemp>0) then
            givenGPA := givenGPA / totaltemp;
            end if;
            dbms_output.put_line('              Total Credits: '||totaltemp || ' GPA: ' || givenGPA);
        
            totaltemp := 0;
            givenGPA:=0;
            CLOSE C3;
        END LOOP;
        CLOSE c2;

    END LOOP;
    close c1;
END;
