-- 테이블 삭제
DROP TABLE BUY_T;
DROP TABLE PRODUCT_T;
DROP TABLE USER_T;

-- 사용자 테이블
CREATE TABLE USER_T (
    USER_NO      NUMBER             NOT NULL         -- 사용자번호(기본키)
  , USER_ID      VARCHAR2(20 BYTE)  NOT NULL UNIQUE  -- 사용자아이디
  , USER_NAME    VARCHAR2(20 BYTE)  NULL             -- 사용자명
  , USER_YEAR    NUMBER(4)          NULL             -- 태어난년도
  , USER_ADDR    VARCHAR2(100 BYTE) NULL             -- 주소
  , USER_MOBILE1 VARCHAR2(3 BYTE)   NULL             -- 연락처1(010, 011 등)
  , USER_MOBILE2 VARCHAR2(8 BYTE)   NULL             -- 연락처2(12345678, 11111111 등)
  , USER_REGDATE DATE               NULL             -- 등록일
  , CONSTRAINT PK_USER PRIMARY KEY(USER_NO)
);

-- 제품 테이블
CREATE TABLE PRODUCT_T (
    PROD_CODE     NUMBER            NOT NULL
  , PROD_NAME     VARCHAR2(20 BYTE) NULL
  , PROD_CATEGORY VARCHAR2(20 BYTE) NULL
  , PROD_PRICE    NUMBER            NULL
  , CONSTRAINT PK_PRODUCT PRIMARY KEY(PROD_CODE)
);

-- 구매 테이블
CREATE TABLE BUY_T (
    BUY_NO     NUMBER NOT NULL
  , USER_NO    NUMBER NULL
  , PROD_CODE  NUMBER NULL
  , BUY_AMOUNT NUMBER NULL
  , CONSTRAINT PK_BUY PRIMARY KEY(BUY_NO)
  , CONSTRAINT FK_USER_BUY    FOREIGN KEY(USER_NO)   REFERENCES USER_T(USER_NO)
  , CONSTRAINT FK_PRODUCT_BUY FOREIGN KEY(PROD_CODE) REFERENCES PRODUCT_T(PROD_CODE) ON DELETE SET NULL
);

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
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'YJS', '유재석', 1972, '서울', '010', '11111111', '08/08/08');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'KHD', '강호동', 1970, '경북', '011', '22222222', '07/07/07');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'KKJ', '김국진', 1965, '서울', '010', '33333333', '09/09/09');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'KYM', '김용만', 1967, '서울', '010', '44444444', '15/05/05');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'KJD', '김제동', 1974, '경남', NULL, NULL, '13/03/03');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'NHS', '남희석', 1971, '충남', '010', '55555555', '14/04/04');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'SDY', '신동엽', 1971, '경기', NULL, NULL, '08/10/10');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'LHJ', '이휘재', 1972, '경기', '011', '66666666', '06/04/04');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'LKK', '이경규', 1960, '경남', '011', '77777777', '04/12/12');
INSERT INTO USER_T(USER_NO, USER_ID, USER_NAME, USER_YEAR, USER_ADDR, USER_MOBILE1, USER_MOBILE2, USER_REGDATE) VALUES (USER_SEQ.NEXTVAL, 'PSH', '박수홍', 1970, '서울', '010', '88888888', '12/05/05');

-- 제품 테이블 데이터
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '운동화', '신발', 30);
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '청바지', '의류', 50);
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '책', '잡화', 15);
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '노트북', '전자', 1000);
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '모니터', '전자', 200);
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '메모리', '전자', 80);
INSERT INTO PRODUCT_T(PROD_CODE, PROD_NAME, PROD_CATEGORY, PROD_PRICE) VALUES (PRODUCT_SEQ.NEXTVAL, '벨트', '잡화', 30);

-- 구매 테이블 데이터
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 2, 1, 2);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 2, 4, 1);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 4, 5, 1);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 10, 5, 5);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 2, 2, 3);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 10, 6, 10);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 5, 3, 5);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 8, 3, 2);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 8, 2, 1);
INSERT INTO BUY_T(BUY_NO, USER_NO, PROD_CODE, BUY_AMOUNT) VALUES(BUY_SEQ.NEXTVAL, 10, 1, 2);

COMMIT;


/****************************** 문 제 ****************************************/

-- 1. 연락처1이 없는 사용자의 사용자번호, 아이디, 연락처1, 연락처2를 조회하시오.


-- 2. 연락처2가 '5'로 시작하는 사용자의 사용자번호, 아이디, 연락처1, 연락처2를 조회하시오.


-- 3. 2010년 이후에 가입한 사용자의 사용자번호, 아이디, 가입일을 조회하시오.


-- 4. 사용자번호와 연락처1, 연락처2를 연결하여 조회하시오. 연락처가 없는 경우 NULL 대신 'None'으로 조회하시오.


-- 5. 지역별 사용자수를 조회하시오.
-- 주소   사용자수
-- 경북   1
-- 경남   2
-- 서울   4
-- 경기   2
-- 충남   1


-- 6. '서울', '경기'를 제외한 지역별 사용자수를 조회하시오.
-- 주소   사용자수
-- 경북   1
-- 경남   2
-- 충남   1

  
-- 7. 구매내역이 없는 사용자를 조회하시오.
-- 번호  아이디
-- 6     HNS
-- 1     YJS
-- 7     SDY
-- 3     KKJ
-- 9     LKK


-- 8. 카테고리별 구매횟수를 조회하시오.
-- 카테고리  구매횟수
-- 전자      4
-- 신발      2
-- 잡화      2
-- 의류      2


-- 9. 아이디별 구매횟수를 조회하시오.
-- 아이디  구매횟수
-- KHD     3
-- LHJ     2
-- KYM     1
-- KJD     1
-- PSH     3


-- 10. 아이디별 구매횟수를 조회하시오. 구매 이력이 없는 경우 구매횟수는 0으로 조회하고 아이디의 오름차순으로 조회하시오.
-- 아이디  고객명  구매횟수
-- KHD     강호동  3
-- KJD     김제동  1
-- KKJ     김국진  0
-- KYM     김용만  1
-- LHJ     이휘재  2
-- LKK     이경규  0
-- NHS     남희석  0
-- PSH     박수홍  3
-- SDY     신동엽  0
-- YJS     유재석  0


-- 11. 모든 제품의 제품명과 판매횟수를 조회하시오. 판매 이력이 없는 제품은 0으로 조회하시오.
-- 제품명  판매횟수
-- 메모리  1개
-- 운동화  2개
-- 청바지  2개
-- 노트북  1개
-- 모니터  2개
-- 책      2개
-- 벨트    0개


-- 12. 카테고리가 '전자'인 제품을 구매한 고객의 구매내역을 조회하시오.
-- 고객명  제품명  구매액
-- 강호동  노트북  1000
-- 김용만  모니터  200
-- 박수홍  모니터  1000
-- 박수홍  메모리  800


-- 13. 제품을 구매한 이력이 있는 고객의 아이디, 고객명, 구매횟수, 총구매액을 조회하시오.
-- 아이디  고객명  구매횟수  총구매액
-- PSH     박수홍  3         1860
-- KYM     김용만  1         200
-- KJD     김제동  1         75
-- LHJ     이휘재  2         80
-- KHD     강호동  3         1210


-- 14. 구매횟수가 2회 이상인 고객명과 구매횟수를 조회하시오.
-- 고객명  구매횟수
-- 박수홍  3
-- 강호동  3
-- 이휘재  2


-- 15. 어떤 고객이 어떤 제품을 구매했는지 조회하시오. 구매 이력이 없는 고객도 조회하고 아이디로 오름차순 정렬하시오.
-- 고객명   구매제품
-- 강호동   운동화
-- 강호동   청바지
-- 강호동   노트북
-- 김제동   책
-- 김국진   NULL
-- 김용만   모니터
-- 이휘재   청바지
-- 이휘재   책
-- 이경규   NULL
-- 남희석   NULL
-- 박수홍   모니터
-- 박수홍   운동화
-- 박수홍   메모리
-- 신동엽   NULL
-- 유재석   NULL


-- 16. 제품 테이블에서 제품명이 '책'인 제품의 카테고리를 '서적'으로 수정하시오.


-- 17. 연락처1이 '011'인 사용자의 연락처1을 모두 '010'으로 수정하시오.


-- 18. 구매번호가 가장 큰 구매내역을 삭제하시오.


-- 19. 제품코드가 1인 제품을 삭제하시오. 삭제 이후 제품번호가 1인 제품의 구매내역이 어떻게 변하는지 조회하시오.


-- 20. 사용자번호가 5인 사용자를 삭제하시오. 사용자번호가 5인 사용자의 구매 내역을 먼저 삭제한 뒤 진행하시오.
