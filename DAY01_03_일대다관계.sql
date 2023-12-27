/*
    외래키(foreign key)
    1. 다른 테이블을 참조할 때 사용하는 키(key)다.
    2. 외래키는 중복 값을 가질 수 있고 NULL 값을 가질 수 있다.
    3. 참조 무결성을 가져야 한다.
        1) 참조하는 테이블에 존재하는 데이터만 가져올 수 있다.
        2) 참조 무결성이 위배되는 경우를 대비해 추가 옵션을 사용할 수 있다.
            (1) ON DELETE SET NULL : 부모키가 삭제되는 경우 자식키만 삭제한다.
            (2) ON DELETE CASCADE  : 부모키가 삭제되는 경우 자식키를 가진 행(Row) 전체를 삭제한다.
    4. 형식
        부모 테이블   -  자식 테이블
        부모키       -  자식 키
        기본키/UNIQUE - 외래키
*/

/*
    일대다 관계
    1. 2개의 테이블을 관계 짓는 가장 흔한 관계이다.
    2.  1 : M
       PK : FK
       UQ
       부모:자식
    3. 반드시 부모 테이블을 먼저 만들어야 한다.
    4. 반드시 자식 테이블을 먼저 삭제해야 한다.
    5. 테이블 생성/삭제 규칙
        생성과 삭제 순서는 반대이다.
*/

-- 제품 테이블
CREATE TABLE PRODUCT_T (
    PRODUCT_NO NUMBER             NOT NULL PRIMARY KEY,
    NAME       VARCHAR2(100 BYTE) NOT NULL,
    PRICE      NUMBER             NOT NULL,
    STOCK      NUMBER             NULL
);

-- 주문 테이블
CREATE TABLE ORDER_T (
    ORDER_NO   NUMBER             NOT NULL PRIMARY KEY,
    MEMBER_ID  VARCHAR2(100 BYTE) NOT NULL,
    PRODUCT_NO NUMBER             REFERENCES PRODUCT_T(PRODUCT_NO),
    ORDERED_AT DATE               NOT NULL
);

-- 주문 테이블 삭제
DROP TABLE ORDER_T;

-- 제품 테이블 삭제
DROP TABLE PRODUCT_T;