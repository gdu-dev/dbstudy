/*
    DML
    1. Data Manipulation Language
    2. 데이터 조작어
    3. 데이터(행, Row)를 다루는 언어이다.
    4. 트랜잭션 처리가 필요하다.
    5. 종류
        1) 행 삽입 : INSERT INTO VALUES
        2) 행 수정 : UPDATE SET WHERE
        3) 행 삭제 : DELETE FROM WHERE
*/
/*
    트랜잭션
    1. 한 번에 수행해야 하는 작업을 의미한다.(원자성, All or Nothing)
    2. 2가지 이상의 작업이 하나의 트랜잭션으로 구성된다.
    3. 작업의 저장을 의미하는 COMMIT과 작업의 취소를 의미하는 ROLLBACK이 필요하다.
    4. 예시 : 은행 이체
        1) 내 통장에서 돈 빼기
        2) 너 통장으로 돈 넣기
*/
/*
    시퀀스
    1. 일련번호를 생성하는 데이터베이스 객체이다.
    2. 주로 기본키의 값을 생성할 때 사용한다.
    3. 함수
        1) 새 번호 생성하기   : NEXTVAL
        2) 현재 번호 확인하기 : CURRVAL
*/

-- 시퀀스 삭제
DROP SEQUENCE DEPT_SEQ;
DROP SEQUENCE EMPLOYEE_SEQ;

-- 부서 테이블의 부서번호를 생성하는 시퀀스 만들기 (디폴트로 생성)
CREATE SEQUENCE DEPT_SEQ
    INCREMENT BY 1  -- 1씩 증가하는 번호 생성
    START WITH 1    -- 1부터 번호 생성
    NOMAXVALUE      -- 상한선 없음
    NOMINVALUE      -- 하한선 없음
    NOCYCLE         -- 번호 순환 없음
    CACHE 20        -- 20개의 번호를 미리 생성 (번호를 미리 생성하지 않는 NOCACHE 옵션을 사용함)
    NOORDER         -- 번호를 순서 없이 사용
;

-- 사원 테이블의 사원번호를 생성하는 시퀀스 만들기
CREATE SEQUENCE EMPLOYEE_SEQ
    START WITH 1001
    NOCACHE;

-- 테이블 삭제
DROP TABLE EMPLOYEE_T;
DROP TABLE DEPARTMENT_T;

-- 테이블 생성
CREATE TABLE DEPARTMENT_T (
    DEPT_NO   NUMBER            NOT NULL,
    DEPT_NAME VARCHAR2(15 BYTE) NOT NULL,
    LOCATION  VARCHAR2(15 BYTE) NOT NULL,
    CONSTRAINT PK_DEPARTMENT PRIMARY KEY(DEPT_NO)
);
CREATE TABLE EMPLOYEE_T (
    EMP_NO    NUMBER            NOT NULL,
    NAME      VARCHAR2(20 BYTE) NOT NULL,
    DEPART    NUMBER,
    POSITION  VARCHAR2(20 BYTE),
    GENDER    CHAR(2 BYTE),
    HIRE_DATE DATE,
    SALARY    NUMBER,
    CONSTRAINT PK_EMPLOYEE PRIMARY KEY(EMP_NO),
    CONSTRAINT FK_EMPLOYEE_DEPARTMENT FOREIGN KEY(DEPART) REFERENCES DEPARTMENT_T(DEPT_NO) ON DELETE SET NULL
);

-- 부서 테이블에 행 삽입하기
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '영업부', '대구');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '인사부', '서울');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '총무부', '대구');
INSERT INTO DEPARTMENT_T(DEPT_NO, DEPT_NAME, LOCATION) VALUES(DEPT_SEQ.NEXTVAL, '기획부', '서울');

-- 사원 테이블에 행 삽입하기
INSERT INTO EMPLOYEE_T VALUES(EMPLOYEE_SEQ.NEXTVAL, '구창민', 1, '과장', 'M', '95/05/01', 5000000);  -- 날짜는 하이픈(-) 또는 슬래시(/)로 구분
INSERT INTO EMPLOYEE_T VALUES(EMPLOYEE_SEQ.NEXTVAL, '김민서', 1, '사원', 'M', '17/09/01', 2500000);
INSERT INTO EMPLOYEE_T VALUES(EMPLOYEE_SEQ.NEXTVAL, '이은영', 2, '부장', 'F', '90/09/01', 5500000);
INSERT INTO EMPLOYEE_T VALUES(EMPLOYEE_SEQ.NEXTVAL, '한성일', 2, '과장', 'M', '93/04/01', 5000000);

-- 커밋
COMMIT;

/*
    수정
    
    UPDATE 테이블명 SET 업데이트할내용, 업데이트할내용, ... WHERE 조건식
*/

-- 1. DEPARTMENT_T에서 부서번호(DEPT_NO)가 3인 부서의 지역(LOCATION)을 '인천'으로 수정하시오.
UPDATE DEPARTMENT_T
   SET LOCATION = '인천'   -- SET절의 등호(=)는 대입 연산자
 WHERE DEPT_NO = 3;        -- WHERE절의 등호(=)는 동등비교 연산자

-- 2. EMPLOYEE_T에서 부서번호(DEPART)가 2인 부서의 사원들의 기본급(SALARY)을 10% 인상하시오.
UPDATE EMPLOYEE_T
   SET SALARY = SALARY * 1.1
 WHERE DEPART = 2;

-- 롤백
ROLLBACK;


/*
    삭제
    
    DELETE FROM 테이블명 WHERE 조건식
*/
-- 1. DEPARTMENT_T에서 부서번호(DEPT_NO)가 3인 부서를 삭제하시오. (부서번호가 3인 사원은 없다. 참조 무결성에 영향을 미치지 않는다.)
DELETE 
  FROM DEPARTMENT_T
 WHERE DEPT_NO = 3;

-- 2. EMPLOYEE_T에서 부서번호(DEPART)가 1과 4인 사원을 삭제하시오.
DELETE
  FROM EMPLOYEE_T
 WHERE DEPART = 1 OR DEPART = 4;  -- WHERE DEPART IN(1, 4)

-- 3. DEPARTMENT_T에서 부서번호(DEPT_NO)가 2인 부서를 삭제하시오. (부서번호가 2인 사원이 있다. 부서가 없어지면 사원 정보가 참조 무결성에 위배된다. 참조 무결성 위배에 대비해서 ON DELETE SET NULL 옵션을 주었으므로 사원 테이블의 부서번호가 NULL로 함께 수정된다.)
DELETE 
  FROM DEPARTMENT_T
 WHERE DEPT_NO = 2;

-- 롤백
ROLLBACK;