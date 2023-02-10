/*
    서브쿼리(Sub Query)
    1. 메인쿼리에 포함하는 하위쿼리를 의미한다.
    2. 일반적으로 하위쿼리는 괄호()로 묶어서 메인쿼리에 포함한다.
    3. 하워쿼리가 항상 메인쿼리보다 먼저 실행된다.
*/

/*
    서브쿼리가 포함되는 위치
    1. SELECT절 : 스칼라 서브쿼리
    2. FROM절   : 인라인 뷰
    3. WHERE절  : 서브쿼리
*/

/*
    서브쿼리의 실행 결과에 의한 구분
    1. 단일 행 서브쿼리
        1) 결과 행이 1개이다.
        2) 단일 행 서브쿼리인 대표적인 경우
            (1) WHERE절에서 사용한 동등비교(=) 칼럼이 PK, UNIQUE 칼럼인 경우
            (2) 집계함수처럼 결과가 1개의 값을 반환하는 경우
        3) 단일 행 서브쿼리에서 사용하는 연산자
            단일 행 연산자를 사용(=, !=, >, >=, <, <=)
    2. 다중 행 서브쿼리
        1) 결과 행이 1개 이상이다.
        2) FROM절, WHERE절에서 많이 사용된다.
        3) 다중 행 서브쿼리에서 사용하는 연산자
            다중 행 연산자를 사용(IN, ANY, ALL 등)
*/


/* WHERE절의 서브쿼리 */

-- 1. 사원번호가 1001인 사원과 동일한 직급(POSITION)을 가진 사원을 조회하시오.
SELECT 사원정보
  FROM 사원
 WHERE 직급 = (사원번호가 1001인 사원의 직급);

SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE POSITION = (SELECT POSITION
                     FROM EMPLOYEE_TBL
                    WHERE EMP_NO = 1001);


-- 2. 부서번호가 2인 부서와 동일한 지역에 있는 부서를 조회하시오.
SELECT 부서정보
  FROM 부서
 WHERE 지역 = (부서번호가 2인 부서의 지역);

SELECT DEPT_NO, DEPT_NAME, LOCATION
  FROM DEPARTMENT_TBL
 WHERE LOCATION = (SELECT LOCATION
                     FROM DEPARTMENT_TBL
                    WHERE DEPT_NO = 2);


-- 3. 가장 높은 급여를 받는 사원을 조회하시오.
SELECT 사원정보
  FROM 사원
 WHERE 급여 = (가장 높은 급여);

SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE SALARY = (SELECT MAX(SALARY)
                   FROM EMPLOYEE_TBL);


-- 4. 평균 급여 이상을 받는 사원을 조회하시오.
SELECT 사원정보
  FROM 사원
 WHERE 급여 >= (평균 급여);

SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE SALARY >= (SELECT AVG(SALARY)
                    FROM EMPLOYEE_TBL);


-- 5. 평균 근속 개월 수 이상을 근무한 사원을 조회하시오.
SELECT 사원정보
  FROM 사원
 WHERE 근속개월수 >= (평균 근속개월수);

SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE MONTHS_BETWEEN(SYSDATE, HIRE_DATE) >= (SELECT AVG(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))
                                                FROM EMPLOYEE_TBL);


-- 6. 부서번호가 2인 부서에 근무하는 사원들의 직급과 일치하는 사원을 조회하시오.
SELECT 사원정보
  FROM 사원
 WHERE 직급 IN (부서번호가 2인 부서에 근무하는 사원들의 직급);

SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE POSITION IN (SELECT POSITION
                      FROM EMPLOYEE_TBL
                     WHERE DEPART = 2);  -- WHERE절에서 사용한 DEPART 칼럼이 PK/UNIQUE 칼럼이 아니므로 다중 행 서브쿼리이다.
                                         -- 따라서 단일 행 연산자인 등호(=) 대신 다중 행 연산자 IN을 사용해야 한다.


-- 7. 부서명이 '영업부'인 부서에 근무하는 사원을 조회하시오.
SELECT 사원정보
FROM 사원
WHERE 부서번호 IN (부서명이 '영업부'인 부서의 부서번호);

SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE DEPART IN (SELECT DEPT_NO
                    FROM DEPARTMENT_TBL
                   WHERE DEPT_NAME = '영업부');  -- WHERE절에서 사용한 DEPART_NAME 칼럼이 PK/UNIQUE가 아니므로 다중 행 서브쿼리이다.

-- 참고. 조인으로 풀기
SELECT E.EMP_NO, E.NAME, E.DEPART, E.GENDER, E.POSITION, E.HIRE_DATE, E.SALARY
  FROM DEPARTMENT_TBL D INNER JOIN EMPLOYEE_TBL E
    ON D.DEPT_NO = E.DEPART
 WHERE D.DEPT_NAME = '영업부';


-- 8. 직급이 '과장'인 사원들이 근무하는 부서 정보를 조회하시오.
SELECT 부서정보
FROM 부서
WHERE 부서번호 IN (직급이 '과장'인 사원들이 근무하는 부서번호);

SELECT DEPT_NO, DEPT_NAME, LOCATION
  FROM DEPARTMENT_TBL
 WHERE DEPT_NO IN (SELECT DEPART
                     FROM EMPLOYEE_TBL
                    WHERE POSITION = '과장');  -- WHERE절에서 사용한 POSITION 칼럼이 PK/UNIQUE가 아니므로 다중 행 서브쿼리이다.

-- 참고. 조인으로 풀기
SELECT D.DEPT_NO, D.DEPT_NAME, D.LOCATION
  FROM DEPARTMENT_TBL D INNER JOIN EMPLOYEE_TBL E
    ON D.DEPT_NO = E.DEPART
 WHERE E.POSITION = '과장';


-- 9. '영업부'의 가장 높은 급여보다 더 높은 급여를 받는 사원을 조회하시오.
SELECT 사원정보
FROM 사원
WHERE 급여 > ('영업부'의 최대 급여);

SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE SALARY > (SELECT MAX(SALARY)
                   FROM EMPLOYEE_TBL
                  WHERE DEPART IN (SELECT DEPT_NO
                                     FROM DEPARTMENT_TBL
                                    WHERE DEPT_NAME = '영업부'));

-- 참고. 서브쿼리를 조인으로 풀기
SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
  FROM EMPLOYEE_TBL
 WHERE SALARY > (SELECT MAX(E.SALARY)
                   FROM DEPARTMENT_TBL D INNER JOIN EMPLOYEE_TBL E
                     ON D.DEPT_NO = E.DEPART
                  WHERE D.DEPT_NAME = '영업부');


/* SELECT절의 서브쿼리 */






/*
    인라인 뷰(Inline View)
    1. 쿼리문에 포함된 뷰(가상 테이블)이다.
    2. FROM절에 포함되는 서브쿼리를 의미한다.
    3. 단일 행/다중 행 개념이 필요 없다.
    4. 인라인 뷰에 포함된 칼럼만 메인쿼리에서 사용할 수 있다.
    5. 인라인 뷰를 이용해서 SELECT문의 실행 순서를 조정할 수 있다.
*/

/*
    가상 칼럼
    1. PSEUDO COLUMN (P는 묵음)
    2. 존재하지만 저장되어 있지 않은 칼럼을 의미한다.
    3. 사용할 수 있지만 일부 사용에 제약이 있다.
    4. 종류
        1) ROWID  : 행(ROW) 아이디, 어떤 행이 어디에 저장되어 있는지 알고 있는 칼럼(물리적 저장 위치)
        2) ROWNUM : 행(ROW) 번호, 어떤 행의 순번
*/

-- ROWID
SELECT ROWID, EMP_NO, NAME
  FROM EMPLOYEE_TBL;

-- 오라클의 가장 빠른 검색은 ROWID를 이용한 검색이다.
-- 실무에선 ROWID 사용이 불가능하기 때문에 대신 인덱스(INDEX)를 활용한다.
SELECT EMP_NO, NAME
  FROM EMPLOYEE_TBL
 WHERE ROWID = 'AAAE9yAABAAALG5AAA';

/*
    ROWNUM의 제약 사항
    1. ROWNUM이 1을 포함하는 범위를 조건으로 사용할 수 있다.
    2. ROWNUM이 1을 포함하지 않는 범위는 조건으로 사용할 수 없다.
    3. 모든 ROWNUM을 사용하려면 ROWNUM에 별명을 지정하고 그 별명을 사용하면 된다.
*/

SELECT EMP_NO, NAME
  FROM EMPLOYEE_TBL
 WHERE ROWNUM = 1;  -- ROWNUM이 1을 포함한 범위가 사용되므로 가능!

SELECT EMP_NO, NAME
  FROM EMPLOYEE_TBL
 WHERE ROWNUM <= 2;  -- ROWNUM이 1을 포함한 범위가 사용되므로 가능!
 
SELECT EMP_NO, NAME
  FROM EMPLOYEE_TBL
 WHERE ROWNUM = 2;  -- ROWNUM이 1을 포함한 범위가 아니므로 불가능!

SELECT ROWNUM AS RN, EMP_NO, NAME
  FROM EMPLOYEE_TBL
 WHERE RN = 2;  -- 실행 순서가 맞지 않기 때문에 실행이 불가능하다.(별명을 사용할 수 없다.)
                -- 별명 지정을 WHERE절보다 먼저 처리하면 해결된다.
                -- 별명을 지정하는 인라인 뷰를 사용하면 가장 먼저 별명이 지정되므로 해결된다.

SELECT E.EMP_NO, E.NAME
  FROM (SELECT ROWNUM AS RN, EMP_NO, NAME
          FROM EMPLOYEE_TBL) E
 WHERE E.RN = 2;


/* FROM절의 서브쿼리 */

-- 1. 연봉이 2번째로 높은 사원을 조회하시오.
--    1) 연봉순으로 정렬한다.
--    2) 정렬 결과에 행 번호(ROWNUM)을 붙인다.
--    3) 원하는 행 번호를 조회한다.
SELECT E.EMP_NO, E.NAME, E.DEPART, E.GENDER, E.POSITION, E.HIRE_DATE, E.SALARY
  FROM (SELECT ROWNUM AS RN, A.EMP_NO, A.NAME, A.DEPART, A.GENDER, A.POSITION, A.HIRE_DATE, A.SALARY
          FROM (SELECT EMP_NO, NAME, DEPART, GENDER, POSITION, HIRE_DATE, SALARY
                  FROM EMPLOYEE_TBL
                 ORDER BY SALARY DESC) A) E
 WHERE E.RN = 3;

















