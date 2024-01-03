/*
    서브 쿼리
    1. 메인 쿼리에 포함되는 하위 쿼리를 서브 쿼리라고 한다.
    2. 실행 순서
        서브 쿼리 -> 메인 쿼리
    3. 종류
        1) SELECT 절 : 스칼라 서브 쿼리
        2)   FROM 절 : 인라인 뷰 (INLINE VIEW)
        3)  WHERE 절 : 서브 쿼리
            (1) 단일 행 서브 쿼리 (결과 행이 1행)
            (2) 다중 행 서브 쿼리 (결과 행이 N행)
*/

/*
    단일 행 서브 쿼리
    1. 서브 쿼리의 실행 결과가 1행이다.
    2. 단일 행 서브 쿼리인 경우
        1) 함수 결과를 반환하는 서브 쿼리
        2) PK 또는 UNIQUE 칼럼의 동등 비교 조건을 사용한 서브 쿼리
    3. 단일 행 서브 쿼리 연산자
        =, !=, >, >=, <, <=
*/
-- 1. 사원번호가 1004인 사원의 직책을 가진 사원 조회하기
SELECT *
  FROM EMPLOYEE_T
 WHERE POSITION = (SELECT POSITION
                     FROM EMPLOYEE_T
                    WHERE EMP_NO = 1004);

-- 2. 급여 평균보다 더 큰 급여를 받는 사원 조회하기
SELECT *
  FROM EMPLOYEE_T
 WHERE SALARY > (SELECT AVG(SALARY)
                   FROM EMPLOYEE_T);

/*
    다중 행 서브 쿼리
    1. 서브 쿼리의 실행 결과가 n행이다.
    2. 다중 행 서브 쿼리 연산자
         IN, ANY, ALL 등
*/
-- 1. 부서가 '영업부'인 사원을 조회하시오.
SELECT *
  FROM EMPLOYEE_T
 WHERE DEPART = (SELECT DEPT_NO
                   FROM DEPARTMENT_T
                  WHERE DEPT_NAME = '영업부');
