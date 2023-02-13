/*
    프로시저(PROCEDURE)
    1. 하나의 프로시저에 여러 개의 쿼리문을 작성해서 처리할 수 있다.
    2. 여러 개의 쿼리문이 필요한 서비스를 프로시저로 작성해 두면 사용이 편리하다.
       (예시 : 은행 이체(UPDATE 쿼리가 2개로 구성))
    3. 형식
        CREATE [OR REPLACE] PROCEDURE 프로시저명[(매개변수)]
        IS  -- AS도 가능
            변수선언
        BEGIN
            본문
        [EXCEPTION
            예외처리]
        END;
    4. 작성된 프로시저는 EXECUTE 프로시저(); 형식으로 실행한다.
*/


-- 프로시저1 정의(만들기)
CREATE OR REPLACE PROCEDURE PROC1
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World');
END;

-- 프로시저1 호출(실행하기)
EXECUTE PROC1();



-- 프로시저2 정의(만들기) : 사원번호가 100인 사원의 FIRST_NAME, LAST_NAME, SALARY를 조회하는 프로시저
CREATE OR REPLACE PROCEDURE PROC2
IS
    FNAME EMPLOYEES.FIRST_NAME%TYPE;
    LNAME EMPLOYEES.LAST_NAME%TYPE;
    SAL EMPLOYEES.SALARY%TYPE;
BEGIN
    SELECT FIRST_NAME, LAST_NAME, SALARY
      INTO FNAME, LNAME, SAL
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = 100;
    DBMS_OUTPUT.PUT_LINE(FNAME || ',' || LNAME || ',' || SAL);
END;

-- 프로시저2 호출(실행하기)
EXECUTE PROC2();












