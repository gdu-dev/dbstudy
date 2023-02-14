/*
    트리거(TRIGGER)
    1. DML(INSERT, UPDATE, DELETE) 작업 후 자동으로 실행되는 데이터베이스 객체이다.
    2. 행(ROW) 단위로 트리거가 동작한다.
    3. 종류
        1) BEFORE 트리거 : DML 동작 이전에 수행된다.
        2) AFTER  트리거 : DML 동작 이후에 수행된다.
    4. 형식
        CREATE [OR REPLACE] TRIGGER 트리거명
        BEFORE | AFTER
        INSERT OR UPDATE OR DELETE
        ON 테이블명
        FOR EACH ROW
        BEGIN
            트리거본문
        END;
*/

SET SERVEROUTPUT ON;

-- TRIG1 정의
CREATE OR REPLACE TRIGGER TRIG1
    AFTER
    UPDATE
    ON EMPLOYEES
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World');
END;

-- TRIG1 동작 확인(EMPLOYEES 테이블의 데이터를 수정해 본다.)
UPDATE EMPLOYEES
   SET LAST_NAME = 'Queen'
 WHERE EMPLOYEE_ID = 100;

ROLLBACK;










