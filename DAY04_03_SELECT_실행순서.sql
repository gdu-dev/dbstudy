/*
    SELECT 문의 실행 순서
    
    1. FROM
    2. WHERE
    3. GROUP BY
    4. HAVING
    5. SELECT
    6. ORDER BY
*/

-- 1. 부서번호를 기준으로 오름차순 정렬하시오.
SELECT DEPART AS 부서번호  -- 2
  FROM EMPLOYEE_T          -- 1
 ORDER BY 부서번호;        -- 3 (별명의 인식이 가능함)

-- 2. 부서별로 연봉 평균을 조회하시오.
SELECT DEPART AS 부서번호, AVG(SALARY) AS 평균연봉  -- 3
  FROM EMPLOYEE_T                                   -- 1
 GROUP BY 부서번호;                                 -- 2 (별명의 인식이 불가능함)

-- 3. 부서별로 연봉 평균과 사원수를 조회하시오. 사원수가 2명 이상인 부서만 조회하시오. 평균연봉의 내림차순 정렬하시오.
SELECT DEPART AS 부서번호
     , AVG(SALARY) AS 평균연봉
     , COUNT(*) AS 사원수
  FROM EMPLOYEE_T
 GROUP BY DEPART
HAVING COUNT(*) >= 2
 ORDER BY 평균연봉 DESC;