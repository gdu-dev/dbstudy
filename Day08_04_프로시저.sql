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



-- 프로시저3 정의(만들기) : 사원번호를 전달하면 해당 사원의 FIRST_NAME, LAST_NAME, SALARY를 조회하는 프로시저
-- 입력 파라미터
-- 1. 프로시저로 값을 전달할 때 사용한다.
-- 2. 형식 : 변수명 IN 타입
CREATE OR REPLACE PROCEDURE PROC3(EMP_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE)
IS
    FNAME EMPLOYEES.FIRST_NAME%TYPE;
    LNAME EMPLOYEES.LAST_NAME%TYPE;
    SAL EMPLOYEES.SALARY%TYPE;
BEGIN
    SELECT FIRST_NAME, LAST_NAME, SALARY
      INTO FNAME, LNAME, SAL
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = EMP_ID;
    DBMS_OUTPUT.PUT_LINE(FNAME || ',' || LNAME || ',' || SAL);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('예외가 발생했습니다.');
END;

-- 프로시저3 호출(실행하기)
EXECUTE PROC3(0);



-- 프로시저4 정의(만들기)
-- 사원번호가 100인 사원의 FIRST_NAME, LAST_NAME을 출력 파라미터로 반환하는 프로시저

-- 출력 파라미터
-- 1. 프로시저의 실행 결과를 저장하는 변수이다.
-- 2. 형식 : 변수명 OUT 타입

CREATE OR REPLACE PROCEDURE PROC4(FNAME OUT EMPLOYEES.FIRST_NAME%TYPE, LNAME OUT EMPLOYEES.LAST_NAME%TYPE)
IS
BEGIN
    SELECT FIRST_NAME, LAST_NAME
      INTO FNAME, LNAME           -- 이 곳에서 출력 파라미터에 값이 저장된다.
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = 100;
END;
      
-- 프로시저4 호출(실행하기)
-- FNAME과 LNAME값을 저장할 변수를 선언한 뒤, 프로시저에 전달해야 한다.
DECLARE
    FNAME EMPLOYEES.FIRST_NAME%TYPE;
    LNAME EMPLOYEES.LAST_NAME%TYPE;
BEGIN
    PROC4(FNAME, LNAME);  -- PLSQL 내부에서 프로시저를 호출할 때는 EXECUTE를 생략해야 한다.
    DBMS_OUTPUT.PUT_LINE(FNAME || ',' || LNAME);
END;



-- 프로시저5. 사원번호를 전달하면, 해당 사원의 FIRST_NAME이 출력 파라미터 FNAME에 저장되도록 작성.
-- 없는 사원번호가 전달되면 출력 파라미터 FNAME에 'Noname'이 저장되도록 작성.
-- 실행 예시)
-- PROC6(100, FNAME) : 사원번호 100은 Steven입니다.
-- PROC6(0, FNAME)   : 사원번호 0은 Noname입니다.
CREATE OR REPLACE PROCEDURE PROC5
(
    EMP_ID IN EMPLOYEES.EMPLOYEE_ID%TYPE,
    FNAME OUT EMPLOYEES.FIRST_NAME%TYPE
)
IS
BEGIN
    SELECT FIRST_NAME
      INTO FNAME
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = EMP_ID;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        FNAME := 'Noname';
END;

DECLARE
    FNAME EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    PROC5(100, FNAME);
    DBMS_OUTPUT.PUT_LINE(FNAME);
END;



/*
    프로시저 연습
    
*/