-- 다음 쿼리문을 이용해서 사용자 테이블, 제품 테이블, 구매 테이블을 작성하시오.

-- 테이블 삭제
DROP TABLE BUYS;
DROP TABLE PRODUCTS;
DROP TABLE USERS;

-- 사용자 테이블
CREATE TABLE USERS (
    USER_NO NUMBER NOT NULL,                    -- 사용자번호(기본키)
    USER_ID VARCHAR2(20 BYTE) NOT NULL UNIQUE,  -- 사용자아이디
    USER_NAME VARCHAR2(20 BYTE),                -- 사용자명
    USER_YEAR NUMBER(4),                        -- 태어난년도
    USER_ADDR VARCHAR2(100 BYTE),               -- 주소
    USER_MOBILE1 VARCHAR2(3 BYTE),              -- 연락처1(010, 011 등)
    USER_MOBILE2 VARCHAR2(8 BYTE),              -- 연락처2(12345678, 11111111 등)
    USER_REGDATE DATE                           -- 등록일
);

-- 사용자 테이블 기본키
ALTER TABLE USERS
    ADD CONSTRAINT PK_USERS PRIMARY KEY(USER_NO);

-- 제품 테이블
CREATE TABLE PRODUCTS (
    PROD_CODE NUMBER NOT NULL,
    PROD_NAME VARCHAR2(20 BYTE),
    PROD_CATEGORY VARCHAR2(20 BYTE),
    PROD_PRICE NUMBER
);
-- 제품 테이블 기본키
ALTER TABLE PRODUCTS
    ADD CONSTRAINT PK_PRODUCTS PRIMARY KEY(PROD_CODE);

-- 구매 테이블
CREATE TABLE BUYS (
    BUY_NO NUMBER NOT NULL,
    USER_ID VARCHAR2(20 BYTE),
    PROD_CODE NUMBER,
    BUY_AMOUNT NUMBER
);

-- 구매 테이블 기본키
ALTER TABLE BUYS
    ADD CONSTRAINT PK_BUYS PRIMARY KEY(BUY_NO);
-- 구매-사용자 외래키
ALTER TABLE BUYS
    ADD CONSTRAINT FK_BUYS_USERS FOREIGN KEY(USER_ID)
        REFERENCES USERS(USER_ID);
-- 구매-제품 외래키
ALTER TABLE BUYS
    ADD CONSTRAINT FK_BUYS_PRODUCTS FOREIGN KEY(PROD_CODE)
        REFERENCES PRODUCTS(PROD_CODE);

-- 사용자 시퀀스
DROP SEQUENCE USER_SEQ;
CREATE SEQUENCE USER_SEQ NOCACHE;

-- 제품 시퀀스
DROP SEQUENCE PRODUCT_SEQ;
CREATE SEQUENCE PRODUCT_SEQ NOCACHE;

-- 구매 시퀀스
DROP SEQUENCE BUY_SEQ;
CREATE SEQUENCE BUY_SEQ NOCACHE;

-- 사용자 테이블 데이터
INSERT INTO USERS VALUES (USER_SEQ.NEXTVAL, 'YJS', '유재석', 1972, '서울', '010', '11111111', '08/08/08');
INSERT INTO USERS VALUES (USER_SEQ.NEXTVAL, 'KHD', '강호동', 1970, '경북', '011', '22222222', '07/07/07');
INSERT INTO USERS VALUES (USER_SEQ.NEXTVAL, 'KKJ', '김국진', 1965, '서울', '010', '33333333', '09/09/09');
INSERT INTO USERS VALUES (USER_SEQ.NEXTVAL, 'KYM', '김용만', 1967, '서울', '010', '44444444', '15/05/05');
INSERT INTO USERS VALUES (USER_SEQ.NEXTVAL, 'KJD', '김제동', 1974, '경남', NULL, NULL, '13/03/03');
INSERT INTO USERS VALUES (USER_SEQ.NEXTVAL, 'NHS', '남희석', 1971, '충남', '010', '55555555', '14/04/04');
INSERT INTO USERS VALUES (USER_SEQ.NEXTVAL, 'SDY', '신동엽', 1971, '경기', NULL, NULL, '08/10/10');
INSERT INTO USERS VALUES (USER_SEQ.NEXTVAL, 'LHJ', '이휘재', 1972, '경기', '011', '66666666', '06/04/04');
INSERT INTO USERS VALUES (USER_SEQ.NEXTVAL, 'LKK', '이경규', 1960, '경남', '011', '77777777', '04/12/12');
INSERT INTO USERS VALUES (USER_SEQ.NEXTVAL, 'PSH', '박수홍', 1970, '서울', '010', '88888888', '12/05/05');

-- 제품 테이블 데이터
INSERT INTO PRODUCTS(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '운동화', '신발', 30);
INSERT INTO PRODUCTS(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '청바지', '의류', 50);
INSERT INTO PRODUCTS(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '책', '잡화', 15);
INSERT INTO PRODUCTS(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '노트북', '전자', 1000);
INSERT INTO PRODUCTS(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '모니터', '전자', 200);
INSERT INTO PRODUCTS(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '메모리', '전자', 80);
INSERT INTO PRODUCTS(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '벨트', '잡화', 30);

-- 구매 테이블 데이터
INSERT INTO BUYS(BUY_NO, USER_ID, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 'KHD', 1, 2);
INSERT INTO BUYS(BUY_NO, USER_ID, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 'KHD', 4, 1);
INSERT INTO BUYS(BUY_NO, USER_ID, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 'KYM', 5, 1);
INSERT INTO BUYS(BUY_NO, USER_ID, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 'PSH', 5, 5);
INSERT INTO BUYS(BUY_NO, USER_ID, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 'KHD', 2, 3);
INSERT INTO BUYS(BUY_NO, USER_ID, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 'PSH', 6, 10);
INSERT INTO BUYS(BUY_NO, USER_ID, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 'KJD', 3, 5);
INSERT INTO BUYS(BUY_NO, USER_ID, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 'LHJ', 3, 2);
INSERT INTO BUYS(BUY_NO, USER_ID, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 'LHJ', 2, 1);
INSERT INTO BUYS(BUY_NO, USER_ID, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 'PSH', 1, 2);

COMMIT;


/****************************** 문 제 ****************************************/


-- 1. 제품 테이블에서 제품명이 '책'인 제품의 카테고리를 '서적'으로 수정하시오.



-- 2. 연락처1이 '011'인 사용자의 연락처1을 모두 '010'으로 수정하시오.



-- 3. 사용자 테이블에서 사용자번호가 5인 사용자를 삭제하시오.
--    사용자번호가 5인 사용자의 구매 내역을 먼저 삭제한 뒤 진행하시오.



-- 4. 연락처1이 없는 사용자의 사용자번호, 아이디, 연락처1, 연락처2를 조회하시오.



-- 5. 연락처2가 '5'로 시작하는 사용자의 사용자번호, 아이디, 연락처1, 연락처2를 조회하시오.



-- 6. 제품을 구매한 사용자의 아이디별 구매횟수를 조회하시오.
-- 아이디  구매횟수
-- KHD     3
-- PSH     3
-- KYM     1
-- LHJ     2



-- 7. 제품을 구매한 이력이 있는 고객의 아이디, 고객명, 구매횟수, 총구매액을 조회하시오.
-- 아이디  고객명  구매횟수  총구매액
-- LHJ     이휘재  2         80
-- KYM     김용만  1         200
-- KHD     강호동  3         1210
-- PSH     박수홍  3         1860



-- 8. 구매 이력과 상관 없이 고객별 구매횟수를 조회하시오.
--    구매 이력이 없는 경우 구매횟수는 0으로 조회하시오.
--    아이디, 고객명, 구매횟수를 아이디의 오름차순으로 조회하시오.
-- 아이디  고객명  구매횟수
-- KHD     강호동  3
-- KKJ     김국진  0
-- KYM     김용만  1
-- LHJ     이휘재  2
-- LKK     이경규  0
-- NHS     남희석  0
-- PSH     박수홍  3
-- SDY     신동엽  0
-- YJS     유재석  0



-- 9. 카테고리가 '전자'인 제품을 구매한 고객의 고객명, 제품명, 구매액을 조회하시오.
-- 고객명  제품명  구매액
-- 강호동  노트북  1000
-- 김용만  모니터  200
-- 박수홍  메모리  800
-- 박수홍  모니터  1000



-- 10. 구매횟수가 2회 이상인 고객명과 구매횟수를 조회하시오.
-- 고객명  구매횟수
-- 박수홍  3
-- 이휘재  2
-- 강호동  3



-- 11. 모든 제품의 제품명과 판매횟수를 조회하시오.
--     판매 이력이 없는 제품은 0으로 조회하시오.
-- 제품명  판매횟수
-- 책      1
-- 메모리  1
-- 운동화  2
-- 벨트    0
-- 모니터  2
-- 청바지  2
-- 노트북  1



-- 12. 어떤 고객이 어떤 제품을 구매했는지 조회하시오.
--     구매 이력이 없는 고객도 조회되도록 처리하고 고객아이디로 오름차순 정렬하시오.
-- 고객명   구매제품
-- 강호동   운동화
-- 강호동   노트북
-- 강호동   청바지
-- 김국진   NULL
-- 김용만   모니터
-- 이휘재   책
-- 이휘재   청바지
-- 이경규   NULL
-- 남희석   NULL
-- 박수홍   운동화
-- 박수홍   모니터
-- 박수홍   메모리
-- 신동엽   NULL
-- 유재석   NULL

