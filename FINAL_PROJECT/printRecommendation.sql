-- ④    각 고객에게 서적을 추천하는데 그 고객이 구입한 서적의 주제와 그것의 관련주제를 이용하고, 
-- 공저자가 있을 경우 공저자가 집필한 서적도 추천한다 (고객(ID, 이름), 추천서적(제목과 ISBN번호) , 서평, 평점평균) 
-- 이때, 추천 서적은 평균평점의 역순으로 정렬한다
SET SERVEROUTPUT ON
DECLARE
x_ID varchar(8);
x_name varchar(30);

x_ISBN  varchar(13);
x_theme_ID varchar(4);

x_book_title VARCHAR(100);
x_rel_theme_ISBN VARCHAR(13);
x_rate NUMERIC(8);

x_rel_author_ID varchar(6);
x_review VARCHAR(200);
x_rate_customer numeric(1);
--고객정보를 가져오는 커서
CURSOR customerCursor is
    SELECT ID, name
    FROM customer;

-- 고객정보를 가지고 구매한 책 ISBN을 가져오는 커서
CURSOR purchaseHistoryCursor is
    SELECT P.book_ISBN
    FROM purchase_record P
    WHERE P.customer_ID = x_ID;

-- ISBN으로 책의 테마ID를 가져오는 커서
CURSOR getBookThemeCursor is
    SELECT theme.ID
    FROM book, theme
    WHERE book.ISBN = x_ISBN
    AND book.theme_ID = theme.ID;

CURSOR getBookByTheme is
    SELECT distinct B.title , B.ISBN, B.rate
    FROM book B, theme T
    WHERE B.theme_ID = x_theme_ID
    ORDER BY B.rate DESC;

CURSOR getAuthorsByBook is
    SELECT A.ID
    FROM BOOK B, writes W, author A
    WHERE B.ISBN = W.BOOK_ISBN
    AND B.ISBN = x_ISBN
    AND A.ID = W.author_ID;

CURSOR getBookByAuthors is
    SELECT distinct B.title , B.ISBN, B.rate
    FROM book B, writes W
    WHERE W.author_ID = x_rel_author_ID
    AND B.ISBN = W.book_ISBN
    ORDER BY B.rate DESC;

CURSOR getBookReviewCursor is
    SELECT review, rate
    FROM book_review
    WHERE book_ISBN = x_rel_theme_ISBN;


BEGIN

OPEN customerCursor;
    LOOP
    -- GET CUSTOMER 
        FETCH customerCursor INTO x_ID, x_name;
        EXIT WHEN customerCursor%NOTFOUND;
        dbms_output.put_line(x_ID||'('||x_name||')'||'님 에게 추천드리는 도서 목록');
        dbms_output.new_line;
        -- GET CUSTOMER's HISTORY
        dbms_output.new_line;
        dbms_output.put_line('###고객님이 구매하신 서적의 관련주제의 책###');
        dbms_output.new_line;
        OPEN purchaseHistoryCursor;
            LOOP
                FETCH purchaseHistoryCursor INTO x_ISBN;
                EXIT WHEN purchaseHistoryCursor%NOTFOUND;
                --GET RELATED BOOK BY THEME
                -- 1. 관련주제의 도서
                OPEN getBookThemeCursor;
                    LOOP
                        FETCH getBookThemeCursor INTO x_theme_ID;
                        EXIT WHEN getBookThemeCursor%NOTFOUND;
                        --GET RECOMMENDATIONS
                        OPEN getBookByTheme;
                            LOOP
                            FETCH getBookByTheme INTO x_book_title, x_rel_theme_ISBN, x_rate;
                            EXIT WHEN getBookByTheme%NOTFOUND;
                            dbms_output.put_line('      '||'제목: '||x_book_title||' ISBN: '||x_rel_theme_ISBN);
                            dbms_output.new_line;
                            dbms_output.put_line('          '||'서평');
                                --GET REVIEW OF BOOKS 
                                    OPEN getBookReviewCursor;
                                        LOOP   
                                            FETCH getBookReviewCursor INTO x_review, x_rate_customer;
                                            EXIT WHEN getBookReviewCursor%NOTFOUND;
                                            dbms_output.put_line('          '||x_review||' 점수: '||x_rate_customer);
                                        END LOOP;
                                    CLOSE getBookReviewCursor;
                            dbms_output.new_line;
                            dbms_output.put_line('      '||'평점: '||x_rate);
                            dbms_output.new_line;
                            END LOOP;
                        CLOSE getBookByTheme;
                    END LOOP;
                CLOSE getBookThemeCursor;
                -- 2. 공저자의 도서 (WE HAVE HISTORY HERE USE ISBN) 
                -- 테마로 책을 가져오는 패턴과 동일하다.
                dbms_output.put_line('###고객님이 구매하신 서적의 저자가 집필한 책###');
                dbms_output.new_line;
                OPEN getAuthorsByBook;
                    LOOP
                    FETCH getAuthorsByBook INTO x_rel_author_ID;
                    EXIT WHEN getAuthorsByBook%NOTFOUND;
                    --GET RECOMMENDATION BY AUTHORS
                    OPEN getBookByAuthors;
                        LOOP
                        FETCH getBookByAuthors INTO x_book_title, x_rel_theme_ISBN, x_rate;
                        EXIT WHEN getBookByAuthors%NOTFOUND;
                            dbms_output.put_line('      '||'제목: '||x_book_title||' ISBN: '||x_rel_theme_ISBN);
                            dbms_output.new_line;
                            dbms_output.put_line('          '||'서평');
                                    --GET REVIEW OF BOOKS 
                                    OPEN getBookReviewCursor;
                                        LOOP   
                                            FETCH getBookReviewCursor INTO x_review, x_rate_customer;
                                            EXIT WHEN getBookReviewCursor%NOTFOUND;
                                            dbms_output.put_line('          '||x_review||' 점수: '||x_rate_customer);
                                        END LOOP;
                                    CLOSE getBookReviewCursor;
                                dbms_output.new_line;
                        dbms_output.put_line('      '||'평점: '||x_rate);
                        dbms_output.new_line;
                        END LOOP;
                    CLOSE getBookByAuthors;
                    END LOOP;
                CLOSE getAuthorsByBook;

            END LOOP;
        CLOSE purchaseHistoryCursor;
        dbms_output.put_line('####################################################');
        dbms_output.new_line;
        
    END LOOP;
CLOSE customerCursor;
END;
