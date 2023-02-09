/*
    셀프 조인
    1. 하나의 테이블에 PK와 FK가 모두 있는 경우에 사용되는 조인이다.
    2. 동일한 테이블을 조인하기 때문에 별명을 다르게 지정해서 조인한다.
    3. 문법은 기본적으로 내부 조인/외부 조인과 동일하다.
*/

-- 모든 사원들의 EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER의 FIRST_NAME을 조회하시오.

-- 1:M 관계 파악
-- PK            FK
-- EMPLOYEE_ID   MANAGER_ID

-- 조인 조건 파악
-- 사원테이블 E        -  매니저테이블 M
-- 사원들의 매니저번호 -  매니저의 사원번호

SELECT
       E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME  -- 각 사원들의 정보
     , M.FIRST_NAME                              -- 매니저 정보
  FROM
       EMPLOYEES E LEFT OUTER JOIN EMPLOYEES M
    ON
       E.MANAGER_ID = M.EMPLOYEE_ID
 ORDER BY
       E.EMPLOYEE_ID;


-- 셀프 조인 연습.

-- 각 사원 중에서 매니저보다 먼저 입사한 사원을 조회하시오.
       
SELECT
       E.EMPLOYEE_ID, E.FIRST_NAME, E.HIRE_DATE AS 입사일자
     , M.EMPLOYEE_ID, M.FIRST_NAME, M.HIRE_DATE AS 매니저입사일자
  FROM
       EMPLOYEES E INNER JOIN EMPLOYEES M
    ON
       E.MANAGER_ID = M.EMPLOYEE_ID
 WHERE
       TO_DATE(E.HIRE_DATE, 'YY/MM/DD') < TO_DATE(M.HIRE_DATE, 'YY/MM/DD')
 ORDER BY
       E.EMPLOYEE_ID;


-- PK, FK가 아닌 일반 칼럼을 이용한 셀프 조인

-- 동일한 부서에서 근무하는 사원들을 조인하기 위해서 DEPARTMENT_ID로 조인 조건을 생성

-- 사원(나)        사원(남)
-- EMPLOYEES ME    EMPLOYEES YOU

-- 문제. 같은 부서에 근무하는 사원 중에서 나보다 SALARY가 높은 사원 정보를 조회하시오.
SELECT
       ME.EMPLOYEE_ID, ME.FIRST_NAME, ME.SALARY AS 내급여
     , YOU.FIRST_NAME, YOU.SALARY AS 너급여
     , ME.DEPARTMENT_ID, YOU.DEPARTMENT_ID
  FROM
       EMPLOYEES ME INNER JOIN EMPLOYEES YOU
    ON
       ME.DEPARTMENT_ID = YOU.DEPARTMENT_ID
 WHERE
       ME.SALARY < YOU.SALARY
 ORDER BY
       ME.EMPLOYEE_ID;


-- 조인 연습.

-- 1. LOCATION_ID가 1700인 부서에 근무하는 사원들의 EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_NAME을 조회하시오.
-- 1) 표준 문법

-- 2) 오라클 문법



-- 2. DEPARTMENT_NAME이 'Executive'인 부서에 근무하는 사원들의 EMPLOYEE_ID, FIRST_NAME을 조회하시오.
-- 1) 표준 문법

-- 2) 오라클 문법


-- 













       
       
       