/*
    DUAL 테이블
    1. DUMMY 칼럼 1개 + 'X' 값을 1개 가지고 있는 테이블이다.
    2. 아무 일도 안하는 테이블이다.
    3. 오라클은 SELECT - FROM절이 필수이므로 언제나 테이블이 필요하다.
       테이블이 필요 없는 값을 조회할 때 DUAL 테이블을 사용한다.
*/


/* 1. 숫자로 변환하기(TO_NUMBER) */
-- '100' -> 100
SELECT '100', TO_NUMBER('100')
  FROM DUAL;

-- 심화. 오라클에서는 숫자와 '문자'를 연산하면 '문자'를 숫자로 변환한 뒤 연산한다.
-- 이 때 자동으로 TO_NUMBER 함수가 사용된다.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = '150';  -- EMPLOYEE_ID = TO_NUMBER('150')으로 자동으로 변환한 뒤 처리한다.



/* 2. 문자로 변환하기(TO_CHAR) */

-- 1) 숫자를 문자로 변환하기
-- 100  -> '100'
-- 1000 -> '1,000'
SELECT
       TO_CHAR(100)             -- '100'
     , TO_CHAR(100, '999999')   -- '   100'
     , TO_CHAR(100, '000000')   -- '000100'
     , TO_CHAR(1234, '9,999')   -- '1,234'
     , TO_CHAR(12345, '9,999')  -- ####### (5자리 12345를 4자리 형식 9,999에 맞출 수 없다.)
     , TO_CHAR(12345, '99,999') -- '12,345'
     , TO_CHAR(0.123, '0.00')   -- '0.12' (반올림)
     , TO_CHAR(0.125, '0.00')   -- '0.13' (반올림)
  FROM
       DUAL;

-- 2) 날짜를 문자로 변환하기 (중요)
-- 날짜를 원하는 형식으로 변환할 때 사용한다.
-- '2023-02-07' -> '2023년 02월 07일'

-- 먼저, 현재 날짜와 시간 확인하기
SELECT
       SYSDATE       -- DATE 타입의 현재 날짜와 시간
     , SYSTIMESTAMP  -- TIMESTAMP 타입의 현재 날짜와 시간
  FROM
       DUAL;

-- 원하는 형식으로 현재 날짜와 시간 확인하기
SELECT
       TO_CHAR(SYSDATE, 'YYYY-MM-DD')
     , TO_CHAR(SYSDATE, 'AM HH:MI:SS')
     , TO_CHAR(SYSDATE, 'HH24:MI:SS')
  FROM
       DUAL;


/* 3. 날짜로 변환하기(TO_DATE) */
-- 날짜와 시간을 원하는 형식으로 표시하는 함수가 아님을 주의하십시오.
-- '05/06/07' 이 날짜는 알려주기 전에는 해석이 안 되는 날짜이다.
-- 어떤 날짜를 어떤 방법으로 해석해야 하는지 알려주는 함수가 TO_DATE 이다.
SELECT
       TO_DATE('05/06/07', 'YY/MM/DD')
     , TO_DATE('05/06/07', 'MM/DD/YY')
  FROM
       DUAL;

-- EMPLOYEES 테이블에서 2000/01/01 ~ 2005/12/31 사이에 입사한 사원 조회하기
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE
  FROM EMPLOYEES
 WHERE TO_DATE(HIRE_DATE, 'YY/MM/DD') BETWEEN TO_DATE('00/01/01', 'YY/MM/DD') AND TO_DATE('05/12/31', 'YY/MM/DD');


