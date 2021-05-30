-- 고객이 서평 작성시 10포인트 추가하는 트리거입니다.
CREATE OR REPLACE TRIGGER customer_point_plus 
    after insert on BOOK_REVIEW 
    FOR EACH ROW
BEGIN 
    UPDATE customer
    SET point = point + 10
    WHERE customer.ID = :NEW.customer_ID;
END customer_point_plus;