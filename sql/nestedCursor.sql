SET SERVEROUTPUT ON
DECLARE
   x_id   VARCHAR(5);
   x_name VARCHAR(20);
   x_dept_name varchar(20);
   x_course_id varchar(8);
   x_semester varchar(8);
   x_year numeric(4,0);

   CURSOR c1 is
      SELECT ID, name, dept_name  
      FROM instructor;
        
   CURSOR c2 is
      SELECT course_id, semester, year 
      FROM teaches
      WHERE ID = x_id;

BEGIN
   OPEN c1;
   LOOP
      FETCH c1 INTO x_id, x_name, x_dept_name;
      EXIT WHEN c1%NOTFOUND;
      dbms_output.put_line (x_name||': '||x_dept_name);
      open c2;
      loop
          fetch c2 into x_course_id, x_semester, x_year;
          exit when c2%NOTFOUND;
          dbms_output.put_line ('       '||x_course_id||' '||x_semester||' '||x_year);
      end loop;
      close c2;
   END LOOP;
   CLOSE c1;
END;
