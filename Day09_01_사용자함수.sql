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
