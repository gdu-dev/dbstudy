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
       
       
       
       
       
       
       
       
       
       
       
       
       
       