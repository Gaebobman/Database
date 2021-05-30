-- ①    서적 정보 출력
-- 서점에 보유한 각 서적에 대한 정보 
-- (ISBN 번호, 제목, 저자, 페이지수, 가격, 출판사, 출판날짜, 주제, 서평, 평점평균 등)를 출력한다.
SET SERVEROUTPUT ON
DECLARE
x_ISBN varchar(13);
x_title varchar(100);
x_pages numeric(4);
x_price numeric(7);
x_publisher_ID varchar(12);
x_theme_ID varchar(4);

x_publication_date date;

x_author_ID varchar(6);
x_writes_author_name varchar(100);
x_author_name varchar(100);

x_writes_book_ISBN varchar(13);
x_publisher_name varchar(40);

x_theme_name varchar(40);

x_review varchar(200);
x_rate numeric(1);
x_customer_ID varchar(12);

t_numOfReview varchar(8) := '0';
t_valOfRate numeric(8, 1) := '0';
t_bookRate  numeric(8, 1) := '0';
-- 책 테이블에서 ISBN, 제목, 저자ID, 페이지수, 가격, 출판사ID, 출판일, 주제ID를 가져온다.
CURSOR bookCursor is
    SELECT ISBN, title, pages, price, publisher_ID, publication_date, theme_ID
    FROM book;

--책의 저자이름을 가져온다.
CURSOR authorNameCursor is
    SELECT author.name
    FROM author, writes
    WHERE author.ID = writes.author_ID
    AND writes.book_ISBN = x_ISBN;

--출판사의 ID로 출판사의 이름을 가져온다.
CURSOR publisherNameCursor is
    SELECT name
    FROM publisher
    WHERE publisher.ID = x_publisher_ID;

--주제 ID로 주제 이름을 가져온다.
CURSOR themeNameCursor is
    SELECT theme
    FROM theme
    WHERE ID = x_theme_ID;

--ISBN으로 리뷰와 평점을 가져온다.
CURSOR reviewCursor is
    SELECT review, rate, customer_ID
    FROM book_review
    WHERE book_ISBN = x_ISBN;

BEGIN
    OPEN bookCursor;
    LOOP
        FETCH bookCursor INTO x_ISBN, x_title, x_pages, x_price, x_publisher_ID, x_publication_date, x_theme_ID;
        EXIT WHEN bookCursor%NOTFOUND;
        --번호, 제목 출력 구역
        dbms_output.put('ISBN: '||x_ISBN||' | 제목: '||x_title);

        --저자출력 구역
        OPEN authorNameCursor;
        dbms_output.put(' | 저자: ');
        LOOP
        FETCH authorNameCursor INTO x_author_name;
        EXIT WHEN authorNameCursor%NOTFOUND;
        dbms_output.put(x_author_name||' ');
        END LOOP;
        CLOSE authorNameCursor;
        --저자출력 끝

        -- 페이지 수, 가격, 출판사, 날짜, 주제 출력
        OPEN publisherNameCursor;
        LOOP
            FETCH publisherNameCursor INTO x_publisher_name;
            EXIT WHEN publisherNameCursor%NOTFOUND;
        END LOOP;
        CLOSE publisherNameCursor;

        dbms_output.new_line;
        dbms_output.put_line('      '||'페이지: '||x_pages||' | '||x_price||'원 |'||' 출판사: '||x_publisher_name);
        dbms_output.new_line;
        -- 페이지 수, 가격, 출판사, 날짜, 주제 출력 그리고 줄바꾸기

        -- 서평 구역
        OPEN reviewCursor;
        LOOP   
            FETCH reviewCursor INTO x_review, x_rate, x_customer_ID;
            EXIT WHEN reviewCursor%NOTFOUND;
            dbms_output.put_line('            '||'작성자 ID('||x_customer_ID||'): '||x_review|| '   점수: '||x_rate);
            t_numOfReview  := t_numOfReview + 1;
            t_valOfRate := t_valOfRate + x_rate;
        END LOOP;
        CLOSE reviewCursor;
        t_bookRate := t_valOfRate / t_numOfReview;
        dbms_output.new_line;
        dbms_output.put_line('            '||'평점: '|| t_bookRate);
        --평점출력
        -- 서평구역 끝

        --사용변수 초기화
        t_numOfReview := 0;
        t_valOfRate := 0;
        t_bookRate := 0;
        dbms_output.new_line;
    END LOOP;
    close bookCursor;
END;