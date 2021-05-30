-- ②    각 저자에 대해 출판한 서적명, 공저자가 있을 경우 공저자명, 
-- 출판사, 출판날짜를 출력하고 총 출판 권수를 단독, 2인공저, 3인공저 별로 출력
SET SERVEROUTPUT ON
DECLARE
x_author_ID varchar(6);
x_author_name varchar(100);

x_title varchar(100);
x_ISBN varchar(13);
x_publisher_ID varchar(12);

x_publisher_name varchar(40);

x_publication_date date;

t_nowAuthor_ID varchar(6) :='';
CURSOR authorCursor is
    SELECT ID, name
    FROM author;

CURSOR authorWritesCursor is
    SELECT book_ISBN
    FROM writes
    WHERE author_ID = x_author_ID;

CURSOR bookCursor is
    SELECT title, publisher_ID, publication_date
    FROM book
    WHERE ISBN = x_ISBN;


CURSOR publisherNameCursor is
    SELECT name
    FROM publisher
    WHERE ID = x_publisher_ID;

CURSOR coAuthorCursor is
    SELECT name
    FROM author, writes
    WHERE author.ID = writes.author_ID
    AND writes.book_ISBN= x_ISBN
    AND author_ID <> t_nowAuthor_ID; 

BEGIN
    OPEN authorCursor;
    LOOP
        FETCH authorCursor INTO x_author_ID, x_author_name;
        EXIT WHEN authorCursor%NOTFOUND;
        t_nowAuthor_ID := x_author_ID;

        dbms_output.put_line('저자: '||x_author_name);
        dbms_output.new_line;
        dbms_output.put_line('       '||'저서목록');
        dbms_output.new_line;
        OPEN authorWritesCursor;
        LOOP
            FETCH authorWritesCursor INTO x_ISBN;
            EXIT WHEN authorWritesCursor%NOTFOUND;
            
            OPEN bookCursor;
            LOOP
                FETCH bookCursor INTO x_title, x_publisher_ID, x_publication_date;
                EXIT WHEN bookCursor%NOTFOUND;
                dbms_output.put_line('          '||'제목: '||x_title);

                OPEN publisherNameCursor;
                LOOP
                    FETCH publisherNameCursor INTO x_publisher_name;
                    EXIT WHEN publisherNameCursor%NOTFOUND;
                    dbms_output.put_line('              '||'출판사: '||x_publisher_name||' 출판일: '||x_publication_date);
                    dbms_output.put('              '||'공저자: ');
                    OPEN coAuthorCursor;
                    LOOP
                        FETCH coAuthorCursor INTO x_author_name;
                        EXIT WHEN coAuthorCursor%NOTFOUND;

                        dbms_output.put(x_author_name||' | ');
                        END LOOP;
                        CLOSE coAuthorCursor;
                        dbms_output.new_line;
                    dbms_output.new_line;
                END LOOP;
                CLOSE publisherNameCursor;

            END LOOP;
            CLOSE bookCursor;

        END LOOP;
        CLOSE authorWritesCursor;
        
    t_nowAuthor_ID :='';
    END LOOP;
    CLOSE authorCursor;
END;