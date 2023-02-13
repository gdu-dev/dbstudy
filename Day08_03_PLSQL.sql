/*
    PL/SQL
    
    1. 오라클 전용 문법이고 프로그래밍 처리가 가능한 SQL이다.
    2. 형식
        [DECLARE
            변수 선언]
        BEGIN
            수행할 PL/SQL
        END;
    3. 변수에 저장된 값을 출력하기 위해서 서버 출력을 ON 시켜줘야 한다.
       최초 1번만 실행시켜 두면 된다.(디폴트는 OFF)
        SET SERVEROUTPUT ON;
*/

-- 서버출력 ON
SET SERVEROUTPUT ON;

-- 서버출력 확인
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World');
END;


/*
    테이블 복사하기
    1. CREATE TABLE과 복사할 데이터의 조회(SELECT)를 이용한다.
    2. PK와 FK 제약조건은 복사되지 않는다.
    3. 복사하는 쿼리
        1) 데이터를 복사하기
            CREATE TABLE 테이블 AS(SELECT 칼럼 FROM 테이블);
        2) 데이터를 제외하고 구조만 복사하기(칼럼만 복사하기)
            CREATE TABLE 테이블 AS(SELECT 칼럼 FROM 테이블 WHERE 1=2);
*/
-- HR 계정의 EMPLOYEES 테이블을 GDJ61 계정으로 복사해서 기초 데이터로 사용하기
DROP TABLE EMPLOYEES;
CREATE TABLE EMPLOYEES
    AS (SELECT *
          FROM HR.EMPLOYEES);

-- EMPLOYEES 테이블에 PK 생성하기
ALTER TABLE EMPLOYEES
    ADD CONSTRAINT PK_EMPLOYEE PRIMARY KEY(EMPLOYEE_ID);


/*
     변수 선언하기
     1. 대입 연산자(:=)를 사용한다.
     2. 종류
        1) 스칼라 변수 : 타입을 직접 지정한다.
        2) 참조 변수   : 특정 칼럼의 타입을 가져다가 지정한다.
        3) 레코드 변수 : 2개 이상의 칼럼을 합쳐서 하나의 타입으로 지정한다.
        4) 행 변수     : 행 전체 데이터를 저장한다.
*/

-- 1. 스칼라 변수
--    직접 타입을 명시
DECLARE
    NAME VARCHAR2(10 BYTE);
    AGE NUMBER(3);
BEGIN
    NAME := '제시카';
    AGE := 30;
    DBMS_OUTPUT.PUT_LINE('이름은 ' || NAME || '입니다.');
    DBMS_OUTPUT.PUT_LINE('나이는 ' || AGE || '살입니다.');
END;


-- 2. 참조 변수
--    특정 칼럼의 타입을 그대로 사용하는 변수
--    SELECT절의 INTO를 이용해서 테이블의 데이터를 가져와서 변수에 저장할 수 있다.
--    선언방법 : 변수명 테이블명.칼럼명%TYPE
DECLARE
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


-- 3. 레코드 변수
--    여러 칼럼의 값을 동시에 저장하는 변수
--    레코드 변수 정의(만들기)와 레코드 변수 선언으로 구분해서 진행
DECLARE
    -- 레코드 변수 정의하기
    TYPE MY_RECORD_TYPE IS RECORD(  -- 타입명 : MY_RECORD_TYPE
        FNAME EMPLOYEES.FIRST_NAME%TYPE,
        LNAME EMPLOYEES.LAST_NAME%TYPE,
        SAL EMPLOYEES.SALARY%TYPE
    );
    -- 레코드 변수 선언하기
    EMP MY_RECORD_TYPE;
BEGIN
    SELECT FIRST_NAME, LAST_NAME, SALARY
      INTO EMP
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = 100;
    DBMS_OUTPUT.PUT_LINE(EMP.FNAME || ',' || EMP.LNAME || ',' || EMP.SAL);
END;


--  4. 행 변수
--     행 전체 데이터를 저장할 수 있는 타입
--     항상 행 전체 데이터를 저장해야 한다.
--     선언 방법 : 변수명 테이블명%ROWTYPE
DECLARE
    EMP EMPLOYEES%ROWTYPE;
BEGIN
    SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID
      INTO EMP
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = 100;
    DBMS_OUTPUT.PUT_LINE(EMP.FIRST_NAME || ',' || EMP.LAST_NAME || ',' || EMP.SALARY);
END;


/*
    IF 구문
    
    IF 조건식 THEN
        실행문
    ELSIF 조건식 THEN
        실행문
    ELSE
        실행문
    END IF;
*/

-- 성적에 따른 학점(A,B,C,D,F) 출력하기
DECLARE
    SCORE NUMBER(3);
    GRADE CHAR(1 BYTE);
BEGIN
    SCORE := 50;
    IF SCORE >= 90 THEN
        GRADE := 'A';
    ELSIF SCORE >= 80 THEN
        GRADE := 'B';
    ELSIF SCORE >= 70 THEN
        GRADE := 'C';
    ELSIF SCORE >= 60 THEN
        GRADE := 'D';
    ELSE
        GRADE := 'F';
    END IF;
    DBMS_OUTPUT.PUT_LINE(SCORE || '점은 ' || GRADE || '학점입니다.');
END;


-- EMPLOYEE_ID가 150인 사원의 SALARY가 15000 이상이면 '고액연봉', 아니면 '보통연봉'을 출력하시오.
DECLARE
    EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
    SAL EMPLOYEES.SALARY%TYPE;
    MESSAGE VARCHAR2(20 BYTE);
BEGIN
    EMP_ID := 150;
    SELECT SALARY
      INTO SAL
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = EMP_ID;
    IF SAL >= 15000 THEN
        MESSAGE := '고액연봉';
    ELSE
        MESSAGE := '보통연봉';
    END IF;
    DBMS_OUTPUT.PUT_LINE('사원번호 ' || EMP_ID || '인 사원의 연봉은 ' || SAL || '이고 ' || MESSAGE || '입니다.');
END;

-- EMPLOYEE_ID가 150인 사원의 COMMISSION_PCT가 0이면 '커미션없음', 아니면 실제 커미션(COMMISSION_PCT * SALARY)을 출력하시오.
DECLARE
    EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
    COMM_PCT EMPLOYEES.COMMISSION_PCT%TYPE;
    SAL EMPLOYEES.SALARY%TYPE;
    MESSAGE VARCHAR2(20 BYTE);
BEGIN
    EMP_ID := 150;
    SELECT NVL(COMMISSION_PCT, 0), SALARY
      INTO COMM_PCT, SAL
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = EMP_ID;
    IF COMM_PCT = 0 THEN
        MESSAGE := '커미션없음';
    ELSE
        MESSAGE := TO_CHAR(COMM_PCT * SAL);
    END IF;
    DBMS_OUTPUT.PUT_LINE('사원번호 ' || EMP_ID || '인 사원의 커미션은 ' || MESSAGE || '입니다.');
END;


/*
    CASE 구문
    
    CASE
        WHEN 조건식 THEN
            실행문
        WHEN 조건식 THEN
            실행문
        ELSE
            실행문
    END CASE;
*/

-- EMPLOYEE_ID가 150인 사원의 PHONE_NUMBER에 따른 지역을 출력하시오.
-- 011 : MOBILE
-- 515 : EAST
-- 590 : WEST
-- 603 : SOUTH
-- 650 : NORTH
DECLARE
    EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
    PHONE CHAR(3 BYTE);
    MESSAGE VARCHAR2(6 BYTE);
BEGIN
    EMP_ID := 150;
    SELECT SUBSTR(PHONE_NUMBER, 1, 3)
      INTO PHONE
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = EMP_ID;
    CASE
        WHEN PHONE = '011' THEN
            MESSAGE := 'MOBILE';
        WHEN PHONE = '515' THEN
            MESSAGE := 'EAST';
        WHEN PHONE = '590' THEN
            MESSAGE := 'WEST';
        WHEN PHONE = '603' THEN
            MESSAGE := 'SOUTH';
        WHEN PHONE = '650' THEN
            MESSAGE := 'NORTH';
    END CASE;
    DBMS_OUTPUT.PUT_LINE(PHONE || ',' || MESSAGE);
END;


/*
    WHILE 구문
    
    WHILE 조건식 LOOP
        실행문
    END LOOP;
*/

-- 1 ~ 5 출력하기
DECLARE
    N NUMBER(1);
BEGIN
    N := 1;
    WHILE N <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        N := N + 1;
    END LOOP;
END;

-- 사원번호가 100 ~ 206인 사원들의 FIRST_NAME, LAST_NAME을 조회하시오.
DECLARE
    EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
    FNAME EMPLOYEES.FIRST_NAME%TYPE;
    LNAME EMPLOYEES.LAST_NAME%TYPE;
BEGIN
    EMP_ID := 100;
    WHILE EMP_ID <= 206 LOOP
        SELECT FIRST_NAME, LAST_NAME
          INTO FNAME, LNAME
          FROM EMPLOYEES
         WHERE EMPLOYEE_ID = EMP_ID;
        DBMS_OUTPUT.PUT_LINE(FNAME || ' ' || LNAME);
        EMP_ID := EMP_ID + 1;
    END LOOP;
END;

-- 사원번호가 100 ~ 206인 사원들의 FIRST_NAME, LAST_NAME을 조회하시오.
-- FIRST_NAME과 LAST_NAME을 저장할 수 있는 레코드 변수를 활용하시오.
DECLARE
    EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
    TYPE NAME_TYPE IS RECORD(
        FNAME EMPLOYEES.FIRST_NAME%TYPE,
        LNAME EMPLOYEES.LAST_NAME%TYPE
    );
    FULL_NAME NAME_TYPE;
BEGIN
    EMP_ID := 100;
    WHILE EMP_ID <= 206 LOOP
        SELECT FIRST_NAME, LAST_NAME
          INTO FULL_NAME
          FROM EMPLOYEES
         WHERE EMPLOYEE_ID = EMP_ID;
        DBMS_OUTPUT.PUT_LINE(FULL_NAME.FNAME || ' ' || FULL_NAME.LNAME);
        EMP_ID := EMP_ID + 1;
    END LOOP;
END;


/*
    FOR 구문
    
    FOR 변수 IN 시작..종료 LOOP
        실행문
    END LOOP;
*/
-- 1 ~ 5 출력하기
DECLARE
    N NUMBER(1);
BEGIN
    FOR N IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;

-- 1 ~ 10 사이 정수를 '짝수', '홀수', '3의배수'로 출력하시오.
DECLARE
    N NUMBER(2);
    MODULAR NUMBER(1);  -- 나머지 값
    MESSAGE VARCHAR2(10 BYTE);
BEGIN
    FOR N IN 1..10 LOOP
        SELECT MOD(N, 3)
          INTO MODULAR
          FROM DUAL;
        IF MODULAR = 0 THEN
            MESSAGE := '3의배수';
        ELSE
            SELECT MOD(N, 2)
              INTO MODULAR
              FROM DUAL;
            IF MODULAR = 1 THEN
                MESSAGE := '홀수';
            ELSE
                MESSAGE := '짝수';
            END IF;
        END IF;
        DBMS_OUTPUT.PUT_LINE(N || '은(는) ' || MESSAGE || '입니다.');
    END LOOP;
END;

-- 사원번호가 100 ~ 206인 사원들의 연봉 평균을 출력하시오.
-- 연봉 평균 = 연봉 합 / 사원 수
DECLARE
    EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
    SAL EMPLOYEES.SALARY%TYPE;
    TOTAL NUMBER;
    CNT NUMBER;
BEGIN
    TOTAL := 0;
    CNT := 0;
    FOR EMP_ID IN 100..206 LOOP
        SELECT SALARY
          INTO SAL
          FROM EMPLOYEES
         WHERE EMPLOYEE_ID = EMP_ID;
        TOTAL := TOTAL + SAL;
        CNT := CNT + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(TOTAL / CNT);
END;


-- DEPARTMENT_ID가 50인 사원들의 목록을 DEPT50 테이블로 복사하시오.
-- 1) DEPT50 테이블 만들기
-- 2) 행 변수로 EMPLOYEES 테이블의 정보 읽기
-- 3) DEPARTMENT_ID가 50이면 행 변수에 저장된 내용을 DEPT50 테이블에 INSERT

DROP TABLE DEPT50;
CREATE TABLE DEPT50
    AS (SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID
          FROM EMPLOYEES
         WHERE 1 = 2);

/*
DECLARE
    EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
    EMP EMPLOYEES%ROWTYPE;
BEGIN
    FOR EMP_ID IN 100..206 LOOP
        SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID
          INTO EMP
          FROM EMPLOYEES
         WHERE EMPLOYEE_ID = EMP_ID;
        IF EMP.DEPARTMENT_ID = 50 THEN
            INSERT INTO DEPT50 VALUES EMP;
        END IF;
    END LOOP;
    COMMIT;
END;
*/

DECLARE
    EMP EMPLOYEES%ROWTYPE;
BEGIN
    FOR EMP IN (SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID 
                  FROM EMPLOYEES 
                 WHERE DEPARTMENT_ID = 50) LOOP
        INSERT INTO DEPT50 VALUES EMP;
    END LOOP;
    COMMIT;
END;


/*
    EXIT : 반복문 종료하기
    CONTINUE : LOOP문의 시작부터 다시 실행하기
*/

-- 1부터 정수 값을 누적하시오. 누적 값이 100을 초과하면 그만 누적하고 어디까지 누적했는지 출력하시오.
DECLARE
    N NUMBER;
    TOTAL NUMBER;
BEGIN
    N := 1;
    TOTAL := 0;
    WHILE TRUE LOOP
        IF TOTAL > 100 THEN
            EXIT;
        END IF;
        TOTAL := TOTAL + N;
        N := N + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1부터 ' || N || '까지 합은 ' || TOTAL || '입니다.');
END;

-- 1부터 3의 배수를 제외한 정수 값을 누적하시오. 누적 값이 100을 초과하면 그만 누적하고 어디까지 누적했는지 출력하시오.
DECLARE
    N NUMBER;
    TOTAL NUMBER;
    MODULAR NUMBER(1);
BEGIN
    N := 0;
    TOTAL := 0;
    WHILE TRUE LOOP
        N := N + 1;
        IF TOTAL > 100 THEN
            EXIT;
        END IF;
        SELECT MOD(N, 3)
          INTO MODULAR
          FROM DUAL;
        IF MODULAR = 0 THEN
            CONTINUE;
        END IF;
        TOTAL := TOTAL + N;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(TOTAL || '입니다.');
END;


/*
    예외처리 구문
    
    EXCEPTION
        WHEN 예외종류 THEN
            예외처리
        WHEN 예외종류 THEN
            예외처리
        WHEN OTHERS THEN
            예외처리
*/
DECLARE
    FNAME EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    SELECT FIRST_NAME
      INTO FNAME
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = 0;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('조회된 데이터가 없습니다.');
END;

DECLARE
    FNAME EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    SELECT FIRST_NAME
      INTO FNAME
      FROM EMPLOYEES
     WHERE DEPARTMENT_ID = 50;
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('조회된 데이터가 2개 이상입니다.');
END;

DECLARE
    FNAME EMPLOYEES.FIRST_NAME%TYPE;
BEGIN
    SELECT FIRST_NAME
      INTO FNAME
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = 0;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;