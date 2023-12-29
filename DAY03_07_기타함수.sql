-- 1. 암호화하기 (해시 알고리즘)
SELECT STANDARD_HASH('1111', 'SHA256')  -- SHA256 암호화 방식
     , STANDARD_HASH('1111', 'SHA384')  -- SHA384 암호화 방식
     , STANDARD_HASH('1111', 'SHA512')  -- SHA512 암호화 방식
     , STANDARD_HASH('1111', 'MD5')     -- MD5 암호화 방식
  FROM DUAL;

-- 2. 순위 구하기 (동점자의 경우 같은 순위를 가짐)
SELECT EMP_NO, NAME, SALARY
     , RANK() OVER(ORDER BY SALARY ASC)  AS 연봉적은순  -- SALARY를 오름차순 정렬하고 순위를 매김
     , RANK() OVER(ORDER BY SALARY DESC) AS 연봉많은순  -- SALARY를 내림차순 정렬하고 순위를 매김
  FROM EMPLOYEE_T;

-- 3. 행 번호 구하기 (동점자 처리 방식이 없음)
SELECT EMP_NO, NAME, SALARY
     , ROW_NUMBER() OVER(ORDER BY SALARY ASC)  AS 연봉적은순
     , ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS 연봉많은순
  FROM EMPLOYEE_T;

-- 4. 분기 처리하기

-- 문제. 사원번호, 사원명, 부서명 조회하기
-- 1  영업부
-- 2  인사부
-- 3  총무부
-- 4  기획부

-- 1) DECODE 함수
SELECT EMP_NO
     , NAME
     , DECODE(DEPART
        , 1, '영업부'
        , 2, '인사부'
        , 3, '총무부'
        , 4, '기획부') AS 부서명
  FROM EMPLOYEE_T;

-- 2) CASE WHEN 표현식
SELECT EMP_NO
     , NAME
     , CASE
        WHEN DEPART = 1 THEN '영업부'
        WHEN DEPART = 2 THEN '인사부'
        WHEN DEPART = 3 THEN '총무부'
        WHEN DEPART = 4 THEN '기획부'
        ELSE 'Unknown'
       END AS 부서명
  FROM EMPLOYEE_T;