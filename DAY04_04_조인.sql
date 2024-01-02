/*
    조인
    1. 조회할 때 필요한 칼럼이 2개 이상의 테이블에 존재할 때 조인을 사용한다.
    2. 조인 조건을 이용해서 각 테이블을 조인한다.
    3. 조인 종류
        1) 내부 조인 : 조회할 테이블에 모두 존재하는 데이터를 대상으로 조인
        2) 외부 조인 : 어느 한 테이블에만 존재하는 데이터를 조회 대상에 포함
*/

/*
    내부 조인(INNER JOIN)
    1. 조인하는 두 테이블에 모두 존재하는 데이터만 조회된다.
    2. 어느 한 테이블에만 존재하는 데이터는 조회되지 않는다.
    3. ANSI 문법
        SELECT 조회할 칼럼, ...
          FROM 테이블1 INNER JOIN 테이블2
            ON 조인조건
*/

-- 1. 사원번호, 사원명, 부서번호, 부서명을 조회하시오.
SELECT E.EMP_NO, E.NAME, E.DEPART, D.DEPT_NAME
  FROM DEPARTMENT_T D INNER JOIN EMPLOYEE_T E
    ON D.DEPT_NO = E.DEPART;

-- 2. 부서별 평균연봉을 조회하시오. 부서명과 평균연봉을 조회하시오.
SELECT D.DEPT_NAME, AVG(E.SALARY)
  FROM DEPARTMENT_T D INNER JOIN EMPLOYEE_T E
    ON D.DEPT_NO = E.DEPART
 GROUP BY D.DEPT_NAME;



/*
    외부 조인(OUTER JOIN)
    1. 어느 한 테이블에만 존재하는 데이터도 조회된다.
    2. 해당 테이블이 왼쪽에 있으면 왼쪽 외부 조인이고 오른쪽에 있으면 오른쪽 외부 조인이다.
    3. ANSI 문법
        1) 왼쪽 외부 조인
        SELECT 조회할 칼럼, ...
          FROM 테이블1 LEFT [OUTER] JOIN 테이블2
            ON 조인조건
        2) 오른쪽 외부 조인
        SELECT 조회할 칼럼, ...
          FROM 테이블1 RIGHT [OUTER] JOIN 테이블2
            ON 조인조건
*/

-- 외부 조인 확인을 위한 데이터 입력
INSERT INTO EMPLOYEE_T (
    EMP_NO
  , NAME
  , DEPART
  , POSITION
  , GENDER
  , HIRE_DATE
  , SALARY
) VALUES (
    EMPLOYEE_SEQ.NEXTVAL
  , '홍길동'
  , NULL
  , '회장'
  , 'F'
  , '00/01/01'
  , 10000000
);
COMMIT;

-- 1. 모든 사원들의 사원번호, 사원명, 부서명을 조회하시오.
SELECT E.EMP_NO, E.NAME, D.DEPT_NAME
  FROM DEPARTMENT_T D RIGHT JOIN EMPLOYEE_T E
    ON D.DEPT_NO = E.DEPART;

-- 2. 부서별 사원수를 조회하시오. 부서명, 사원수를 조회하시오. 사원이 없으면 0으로 조회하시오.
SELECT D.DEPT_NAME, E.EMP_NO, E.NAME, E.DEPART, E.POSITION, E.GENDER
  FROM DEPARTMENT_T D LEFT JOIN EMPLOYEE_T E
    ON D.DEPT_NO = E.DEPART;

SELECT D.DEPT_NAME, COUNT(E.EMP_NO)
  FROM DEPARTMENT_T D LEFT JOIN EMPLOYEE_T E
    ON D.DEPT_NO = E.DEPART
 GROUP BY D.DEPT_NAME;