-- 서버메시지 출력 ON
SET SERVEROUTPUT ON;

-- 테이블 삭제
DROP TABLE BUYS;
DROP TABLE USERS;

-- 사용자 테이블
-- 칼럼 : 사용자번호, 아이디, 이름, 태어난년도, 주소, 연락처1, 연락처2, 가입일
-- 기본키 : 사용자번호
CREATE TABLE USERS (
    USER_NO NUMBER NOT NULL CONSTRAINT PK_USERS PRIMARY KEY,
    USER_ID VARCHAR2(20 BYTE) NOT NULL UNIQUE,
    USER_NAME VARCHAR2(20 BYTE),
    USER_YEAR NUMBER(4),
    USER_ADDR VARCHAR2(100 BYTE),
    USER_MOBILE1 VARCHAR2(3 BYTE),  -- 010, 011 등
    USER_MOBILE2 VARCHAR2(8 BYTE),  -- 12345678, 11111111 등
    USER_REGDATE DATE
);

-- 구매 테이블
-- 칼럼 : 구매번호, 아이디, 제품명, 제품카테고리, 제품가격, 구매개수
-- 기본키 : 구매번호
-- 외래키 : 아이디 (사용자 테이블의 아이디 칼럼을 참조하는 키)
CREATE TABLE BUYS (
    BUY_NO NUMBER NOT NULL CONSTRAINT PK_BUYS PRIMARY KEY,
    USER_ID VARCHAR2(20 BYTE) CONSTRAINT FK_BUYS_USERS REFERENCES USERS(USER_ID),
    PROD_NAME VARCHAR2(20 BYTE),
    PROD_CATEGORY VARCHAR2(20 BYTE),
    PROD_PRICE NUMBER,
    BUY_AMOUNT NUMBER
);

-- USERS 테이블에 레코드(행, ROW) 삽입하기
INSERT INTO USERS VALUES (1, 'YJS', '유재석', 1972, '서울', '010', '11111111', '08/08/08');
INSERT INTO USERS VALUES (2, 'KHD', '강호동', 1970, '경북', '011', '22222222', '07/07/07');
INSERT INTO USERS VALUES (3, 'KKJ', '김국진', 1965, '서울', '019', '33333333', '09/09/09');
INSERT INTO USERS VALUES (4, 'KYM', '김용만', 1967, '서울', '010', '44444444', '15/05/05');
INSERT INTO USERS VALUES (5, 'KJD', '김제동', 1974, '경남', NULL, NULL, '13/03/03');
INSERT INTO USERS VALUES (6, 'NHS', '남희석', 1971, '충남', '016', '55555555', '14/04/04');
INSERT INTO USERS VALUES (7, 'SDY', '신동엽', 1971, '경기', NULL, NULL, '08/10/10');
INSERT INTO USERS VALUES (8, 'LHJ', '이휘재', 1972, '경기', '011', '66666666', '06/04/04');
INSERT INTO USERS VALUES (9, 'LKK', '이경규', 1960, '경남', '018', '77777777', '04/12/12');
INSERT INTO USERS VALUES (10, 'PSH', '박수홍', 1970, '서울', '010', '88888888', '12/05/05');

-- BUYS 테이블에 레코드(행, ROW) 삽입하기
INSERT INTO BUYS VALUES (1001, 'KHD', '운동화', NULL, 30, 2);
INSERT INTO BUYS VALUES (1002, 'KHD', '노트북', '전자', 1000, 1);
INSERT INTO BUYS VALUES (1003, 'KYM', '모니터', '전자', 200, 1);
INSERT INTO BUYS VALUES (1004, 'PSH', '모니터', '전자', 200, 5);
INSERT INTO BUYS VALUES (1005, 'KHD', '청바지', '의류', 50, 3);
INSERT INTO BUYS VALUES (1006, 'PSH', '메모리', '전자', 80, 10);
INSERT INTO BUYS VALUES (1007, 'KJD', '책', '서적', 15, 5);
INSERT INTO BUYS VALUES (1008, 'LHJ', '책', '서적', 15, 2);
INSERT INTO BUYS VALUES (1009, 'LHJ', '청바지', '의류', 50, 1);
INSERT INTO BUYS VALUES (1010, 'PSH', '운동화', NULL, 30, 2);

COMMIT;



-- 1. 구매(BUYS) 테이블에서 구매개수(BUY_AMOUNT)의 평균을 정수로 내림 처리해서 조회하는 쿼리문을 작성하시오. (5점)


-- 2. 사용자(USERS) 테이블에서 가입일(USER_REGDATE)로부터 현재까지 경과한 일수를 조회하는 쿼리문을 작성하시오. 결과의 소수점은 정수로 반올림해서 조회하시오. (5점)


-- 3. 사용자(USERS) 테이블의 태어난년도(USER_YEAR) 칼럼을 이용하여 가장 나이가 많은 사용자가 태어난년도를 조회하는 쿼리문을 작성하시오. (5점)


-- 4. 사용자(USERS) 테이블의 태어난년도(USER_YEAR) 칼럼을 이용하여 가장 나이가 적은 사용자의 이름(USER_NAME)을 조회하는 쿼리문을 작성하시오. (5점)


-- 5. 특정 테이블을 가지고 있는 SCOTT 사용자 계정을 제거하는 쿼리문을 작성하시오.
-- SCOTT 사용자 계정이 제거되면서 테이블도 함께 삭제될 수 있도록 옵션을 사용하시오.
-- 단, 실제로 SCOTT 사용자 계정을 제거하지는 말고 쿼리문만 작성하시오. (5점)


-- 6. 다음 사용자를 생성하는 쿼리문과 생성된 사용자에게 권한을 부여하는 쿼리문을 각각 모두 작성하시오. (5점)
--    1) 사용자명 : ADMIN
--    2) 비밀번호 : 1234
--    3) 사용권한 : DBA


-- 7. 모든 고객의 고객아이디, 고객명, 구매횟수를 조회하시오. 외부조인을 사용하시오. (10점)
   

-- 8. 카테고리가 '전자'인 제품을 구매한 고객아이디, 고객명, 총구매액을 조회하시오. (10점)


-- 9. 구매횟수가 2회 이상인 고객아이디, 고객명, 구매횟수를 조회하시오. 내부조인을 사용하시오. (10점)


-- 10. 태어난년도(USER_YEAR)가 1960년인 사용자의 이름을 서버메시지로 출력할 수 있는 USER_PROC 프로시저를 작성하시오.
-- 작성된 USER_PROC 프로시저를 호출하기 위한 코드도 함께 작성하시오.
-- (참고. 1960년에 태어난 사람은 1명이고, 이름은 이경규이다.) (프로시저 작성 8점, 프로시저 호출 2점)

-- 작성
CREATE OR REPLACE PROCEDURE USER_PROC
IS
    NAME USERS.USER_NAME%TYPE;
BEGIN
    SELECT USER_NAME
      INTO NAME
      FROM USERS
     WHERE USER_YEAR = 1960;
    DBMS_OUTPUT.PUT_LINE(NAME);
END;

-- 호출
EXECUTE USER_PROC();


-- 11. 사용자의 아이디(USER_ID)를 전달하면 해당 아이디를 가진 사용자의 구매총액(PROD_PRICE * BUY_AMOUNT)의 합계를 계산한 뒤 합계가 1000 이상이면 'A', 1000 미만 500 이상이면 'B', 500 미만이면 'C'를 반환하는 GET_GRADE() 사용자 함수를 작성하시오.
--     아이디가 'KHD'인 사용자의 이름(USER_NAME)과 GET_GRADE() 함수의 결과를 조회하는 쿼리문을 작성하시오. (함수 작성 8점, 함수 결과 조회 2점)
CREATE OR REPLACE FUNCTION GET_GRADE(USERID USERS.USER_ID%TYPE)
RETURN VARCHAR2
IS
    BUY_TOTAL NUMBER;
BEGIN
    SELECT SUM(PROD_PRICE * BUY_AMOUNT)
      INTO BUY_TOTAL
      FROM BUYS
     WHERE USER_ID = USERID;
    IF BUY_TOTAL >= 1000 THEN
        RETURN 'A';
    ELSIF BUY_TOTAL >= 500 THEN
        RETURN 'B';
    ELSE
        RETURN 'C';
    END IF;
END;

SELECT USER_NAME AS 고객명, GET_GRADE('KHD') AS 등급
  FROM USERS
 WHERE USER_ID = 'KHD';

-- 팁. 모든 고객의 등급 확인은?
SELECT USER_NAME AS 고객명, GET_GRADE(USER_ID) AS 등급
  FROM USERS;


-- 12. 구매(BUYS) 테이블의 각 행(Row)이 수정(UPDATE)되거나 추가(INSERT)된 이후에 '구매내역이 변동되었습니다.'라는 서버메시지를 출력하는 BUYS_TRIG 트리거를 작성하시오. (10점)
CREATE OR REPLACE TRIGGER BUYS_TRIG
    AFTER
    UPDATE OR INSERT
    ON BUYS
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('구매내역이 변동되었습니다.');
END;

-- 팁. 트리거 동작 확인
UPDATE BUYS
   SET USER_ID = 'KHD'
 WHERE BUY_NO = 1001;
