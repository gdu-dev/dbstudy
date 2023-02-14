/*
    사용자 함수(FUNCTION)
    1. 어떤 값을 반환할 때 사용하는 데이터베이스 객체이다.
    2. 실제로 함수를 만들어서 사용하는 개념이다.
    3. RETURN 개념이 존재한다.
    4. 함수의 결과 값을 확인할 수 있도록 SELECT문에서 많이 사용한다.
    5. 형식
        CREATE [OR REPLACE] FUNCTION 함수명[(매개변수)]
        RETURN 반환타입
        IS  -- AS도 가능
            변수 선언
        BEGIN
            함수 본문
        [EXCEPTION
            예외 처리]
        END;
*/


-- 사용자 함수 FUNC1 정의
CREATE OR REPLACE FUNCTION FUNC1
RETURN VARCHAR2  -- 반환타입에서는 크기를 명시하지 않는다.
IS
BEGIN
    RETURN 'Hello World';
END;

-- 사용자 함수 FUNC1 호출
SELECT FUNC1() FROM DUAL;



-- 사용자 함수 FUNC2 정의
-- 사원번호를 전달하면 해당 사원의 FULL_NAME(Steven King)을 반환하는 함수

-- 사용자 함수의 파라미터는 IN/OUT 표기가 없다.
-- 입력 파라미터 형식으로 사용된다.

CREATE OR REPLACE FUNCTION FUNC2(EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE)
RETURN VARCHAR2
IS
    FNAME EMPLOYEES.FIRST_NAME%TYPE;
BEGIN

    SELECT FIRST_NAME
      INTO FNAME
      FROM EMPLOYEES
     WHERE EMPLOYEE_ID = EMP_ID;

    RETURN FNAME;

END;

-- 사용자 함수 FUNC2 호출
SELECT FUNC2(100), LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 100;







