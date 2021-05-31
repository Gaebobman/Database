-- ⑤    각 고객에 대해 포인트 합을 출력하고, 작성한 서평과 평점들을 출력 
-- (고객(ID, 이름), 포이트합, 구입서적(제목과 ISBN번호), 서평, 평점)
SET SERVEROUTPUT ON;
DECLARE

x_ID VARCHAR(8);
x_name VARCHAR(30);

x_point NUMERIC(3);
x_ISBN  VARCHAR(13);
 

x_book_title VARCHAR(100);
x_rate NUMERIC(8);
x_review VARCHAR(200);

CURSOR customerCursor is
    SELECT ID, name, point
    FROM customer;

CURSOR purchaseHistoryCursor is
    SELECT book_ISBN
    FROM purchase_record 
    WHERE customer_ID = x_ID;

CURSOR getBookReviewCursor is  
    SELECT B.title, R.review, R.rate
    FROM book B, book_review R
    WHERE B.ISBN = x_ISBN
    AND B.ISBN = R.book_ISBN
    AND R.customer_ID = x_ID;

BEGIN
    OPEN customerCursor;
    LOOP
        FETCH customerCursor INTO x_ID, x_name,x_point;
        EXIT WHEN customerCursor%NOTFOUND;

        dbms_output.put_line('고객('||x_ID||':'||x_name||') 님의 포인트:'||x_point);
        dbms_output.new_line;
        dbms_output.put_line('      '||'구입서적목록');
        dbms_output.new_line;
        OPEN purchaseHistoryCursor;
        LOOP
            FETCH purchaseHistoryCursor INTO x_ISBN;
            EXIT WHEN purchaseHistoryCursor%NOTFOUND;
                OPEN getBookReviewCursor;
                LOOP
                    FETCH getBookReviewCursor INTO x_book_title, x_review, x_rate;
                    EXIT WHEN getBookReviewCursor%NOTFOUND;
                    dbms_output.put_line('      '||'제목: '||x_book_title);
                    dbms_output.put_line('          '||'서평:'||x_review||' 평점: '|| x_rate||'점');
                    dbms_output.new_line;
                END LOOP;
                CLOSE getBookReviewCursor;
        END LOOP;
        CLOSE purchaseHistoryCursor;
    dbms_output.new_line;
    END LOOP;
    CLOSE customerCursor;
END;