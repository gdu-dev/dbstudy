-- 수학 함수

-- 1. 제곱
--    POWER(A, B) : A의 B제곱
SELECT POWER(2, 3)  -- 2의 3제곱
  FROM DUAL;


-- 2. 절대값
--    ABS(A) : A의 절대값
SELECT ABS(-5)
  FROM DUAL;


-- 3. 나머지 값
--    MOD(A, B) : A를 B로 나눈 나머지 값
SELECT MOD(7, 3)
  FROM DUAL;


-- 4. 부호 판별
--    SIGN(A) : A가 양수이면 1, A가 음수이면 -1, A가 0이면 0을 반환
SELECT
       SIGN(5)
     , SIGN(-5)
     , SIGN(0)
  FROM
       DUAL;


-- 5. 제곱근(루트)
--    SQRT(A) : 루트 A
SELECT SQRT(25) FROM DUAL;


-- 6. 정수로 올림
--    CEIL(A) : 실수 A를 정수로 올린 값을 반환
SELECT
       CEIL(1.1)
     , CEIL(-1.1)
  FROM
       DUAL;


-- 7. 정수로 내림
--    FLOOR(A) : 실수 A를 정수로 내린 값을 반환
SELECT
       FLOOR(1.9)
     , FLOOR(-1.9)
  FROM
       DUAL;


-- 8. 원하는 자릿수로 반올림
--    ROUND(A, [DIGIT]) : 실수 A를 DIGIT 자릿수로 반올린 값을 반환, DIGIT을 생략하면 정수로 반올린 값을 반환
SELECT
       ROUND(123.456)       -- 정수로 반올림
     , ROUND(123.456, 1)    -- 소수 1자리 남기고 반올림
     , ROUND(123.456, 2)    -- 소수 2자리 남기고 반올림
     , ROUND(123.456, -1)   -- 일의 자리에서 반올림
     , ROUND(123.456, -2)   -- 십의 자리에서 반올림
  FROM
       DUAL;


-- 9. 원하는 자릿수로 절사 (공부해 두기)
--    TRUNC(A, [DIGIT]) : 실수 A를 DIGIT 자릿수로 절사 값을 반환, DIGIT을 생략하면 정수로 절사한 값을 반환
SELECT
       TRUNC(123.456)       -- 정수로 절사
     , TRUNC(123.456, 1)    -- 소수 1자리 남기고 절사
     , TRUNC(123.456, 2)    -- 소수 2자리 남기고 절사
     , TRUNC(123.456, -1)   -- 일의 자리에서 절사
     , TRUNC(123.456, -2)   -- 십의 자리에서 절사
  FROM
       DUAL;


-- 생각해보기.
-- FLOOR 함수와 TRUNC 함수는 무엇이 다른가?
-- FLOOR : 작은 정수 찾기
-- TRUNC : 보이는 소수점 자르기
SELECT
       FLOOR(1.9)
     , TRUNC(1.9)
     , FLOOR(-1.9)
     , TRUNC(-1.9)
  FROM 
       DUAL;