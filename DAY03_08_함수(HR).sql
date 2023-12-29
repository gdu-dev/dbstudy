-- 1. 사원들의 근무 개월 수를 정수로 내림하여 조회하시오.
-- 사번 근무개월수
-- 100  246
-- 101  219
SELECT EMPLOYEE_ID AS 사번
     , FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS 근무개월수
  FROM EMPLOYEES;
 
 -- 2. 직업은 "분야_직급" 형식으로 되어 있다. 예) PU_MAN : 분야(PU), 직급(MAN)
 -- 분야와 직급을 분리하여 조회하시오.
 -- JOB_ID     분야  직급
 -- AC_ACCOUNT AC     ACCOUNT
 -- AC_MGR     AC     MGR
 SELECT JOB_ID
     , SUBSTR(JOB_ID, 1, INSTR(JOB_ID, '_') - 1) AS 분야
     , SUBSTR(JOB_ID, INSTR(JOB_ID, '_') + 1) AS 직급
  FROM EMPLOYEES;

-- 3. FIRST_NAME과 LAST_NAME을 연결한 뒤 모두 대문자로 바꾼 이름을 조회하시오.
-- 사번 이름
-- 100  STEVEN KING
-- 101  NEENA KOCHHAR
SELECT EMPLOYEE_ID AS 사번
     , UPPER(CONCAT(CONCAT(FIRST_NAME, ' '), LAST_NAME)) AS 이름
  FROM EMPLOYEES
 ORDER BY EMPLOYEE_ID;

-- 4. 사원들이 고용된 순서대로 순위를 매긴 뒤 조회하시오.
-- 입사순위 사번  고용일
-- 1        102   01/01/13
-- 2        206   02/06/07
SELECT RANK() OVER(ORDER BY HIRE_DATE) AS 입사순위
     , EMPLOYEE_ID AS 사번
     , HIRE_DATE AS 고용일
  FROM EMPLOYEES;

-- 5. 사원번호, 부서번호, 부서명을 조회하시오.
-- 부서번호가 10이면 'Administration', 20이면 'Marketing', 30이면 'Purchasing', 40이면 'Human Resources', 50이면 'Shipping', 나머지는 'Unknown'
-- 사번  부서번호  부서명
-- 100   90        Unknown
-- ...
-- 114   30        Purchasing
SELECT EMPLOYEE_ID AS 사번
     , DEPARTMENT_ID AS 부서번호
     , NVL(DECODE(DEPARTMENT_ID
        , 10, 'Administration'
        , 20, 'Marketing'
        , 30, 'Purchasing'
        , 40, 'Human Resources'
        , 50, 'Shipping'), 'Unknown') AS 부서명
  FROM EMPLOYEES;