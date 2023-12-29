-- 1. 절대값 구하기
SELECT ABS(-5)
  FROM DUAL;

-- 2. 제곱근(루트) 구하기
SELECT SQRT(25)
  FROM DUAL;

-- 3. 제곱 구하기
SELECT POWER(2, 3)
  FROM DUAL;

-- 4. 나머지 구하기
SELECT MOD(5, 2)
  FROM DUAL;

-- 5. 정수 올림 (큰 정수)
SELECT CEIL(1.1)
  FROM DUAL;

-- 6. 정수 내림 (작은 정수)
SELECT FLOOR(1.9)
  FROM DUAL;

-- 7. 원하는 자리수로 반올림
SELECT ROUND(123.456)       -- 123    (정수로 반올림)
     , ROUND(123.456, 1)    -- 123.5  (소수 1자리로 반올림)
     , ROUND(123.456, 2)    -- 123.46 (소수 2자리로 반올림)
     , ROUND(123.456, -1)   -- 120    (일의 자리에서 반올림)
     , ROUND(123.456, -2)   -- 100    (십의 자리에서 반올림)
  FROM DUAL;

-- 8. 원하는 자리수로 절사
SELECT TRUNC(123.456)       -- 123    (정수로 절사)
     , TRUNC(123.456, 2)    -- 123.45 (소수 2자리로 절사)
     , TRUNC(123.456, 1)    -- 123.4  (소수 1자리로 절사)
     , TRUNC(123.456, -1)   -- 120    (일의 자리에서 절사)
     , TRUNC(123.456, -2)   -- 100    (십의 자리에서 절사)
  FROM DUAL;

/*
    원하는 자리로 올림
    
    CEIL(값 * POWER(10, 자리수)) / POWER(10, 자리수)
    
    예시)
    CEIL(123.456 * POWER(10, 1))  / POWER(10, 1)    : 123.5
    CEIL(123.456 * POWER(10, 2))  / POWER(10, 2)    : 123.46
    CEIL(123.456 * POWER(10, -1)) / POWER(10, -1)   : 130
*/