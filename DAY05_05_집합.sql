/*
    집합
    1. 2개 이상의 테이블을 한 번에 조회하는 방식 중 하나이다.
    2. 집합 연산자
        1) UNION     : 합집합, 중복 값은 제외하고 조회
        2) UNION ALL : 합집합, 중복 값도 그대로 조회
        3) INTERSECT : 교집합
        4) MINUS     : 차집합
    3. 형식
        SELECT 칼럼1, 칼럼2, ...
          FROM 테이블1
        집합연산자
        SELECT 칼럼1, 칼럼2, ...
          FROM 테이블2
        [ORDER BY 정렬]
    4. 2개 테이블의 칼럼 순서와 타입은 모두 일치해야 한다.
*/

-- 합집합
-- 사원 테이블과 부서 테이블에 존재하는 모든 부서번호를 조회하시오.
SELECT DEPART
  FROM EMPLOYEE_T
 UNION
SELECT DEPT_NO
  FROM DEPARTMENT_T;

SELECT DEPART
  FROM EMPLOYEE_T
 UNION ALL
SELECT DEPT_NO
  FROM DEPARTMENT_T;

-- 교집합
-- 사원들이 근무하고 있는 부서번호를 조회하시오.
SELECT DEPART
  FROM EMPLOYEE_T
INTERSECT
SELECT DEPT_NO
  FROM DEPARTMENT_T;

-- 차집합
-- 사원들이 근무하고 있지 않은 부서번호를 조회하시오.
SELECT DEPT_NO
  FROM DEPARTMENT_T
 MINUS
SELECT DEPART
  FROM EMPLOYEE_T;
