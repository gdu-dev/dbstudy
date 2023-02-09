/*
    드라이브(DRIVE) 테이블과 드리븐(DRIVEN) 테이블
    1. 드라이브(DRIVE) 테이블
        1) 조인 관계를 처리하는 메인 테이블
        2) 1:M 관계에서 1에 해당하는 테이블
        3) 행(ROW)의 개수가 일반적으로 적고, PK를 조인 조건으로 사용하기 때문에 인덱스(INDEX) 활용이 가능하다.
    2. 드리븐(DRIVEN) 테이블
        1) 1:M 관계에서 M에 해당하는 테이블
        2) 행(ROW)의 개수가 일반적으로 많고, FK를 조인 조건으로 사용하기 때문에 인덱스(INDEX) 활용이 불가능하다.
    3. 조인 성능 향상을 위해서 가급적 드라이브(DRIVE) 테이블을 먼저 작성한다. 드리븐(DRIVEN) 테이블은 나중에 작성한다.
*/

-- 1. 내부 조인(두 테이블에 일치하는 정보를 조인한다.)

-- 1) 표준 문법
SELECT E.EMP_NO, E.NAME, D.DEPT_NO, D.DEPT_NAME
  FROM DEPARTMENT_TBL D INNER JOIN EMPLOYEE_TBL E
    ON D.DEPT_NO = E.DEPART;

-- 2) 오라클 문법
SELECT E.EMP_NO, E.NAME, D.DEPT_NO, D.DEPT_NAME
  FROM DEPARTMENT_TBL D, EMPLOYEE_TBL E
 WHERE D.DEPT_NO = E.DEPART;


-- 2. 왼쪽 외부 조인(왼쪽에 있는 테이블은 일치하는 정보가 없어도 무조건 조인한다.)

-- 1) 표준 문법
SELECT D.DEPT_NO, D.DEPT_NAME, E.EMP_NO, E.NAME
  FROM DEPARTMENT_TBL D LEFT OUTER JOIN EMPLOYEE_TBL E
    ON D.DEPT_NO = E.DEPART;

-- 2) 오라클 문법
SELECT D.DEPT_NO, D.DEPT_NAME, E.EMP_NO, E.NAME
  FROM DEPARTMENT_TBL D, EMPLOYEE_TBL E
 WHERE D.DEPT_NO = E.DEPART(+);



-- 외래키 제약조건의 비활성화(일시 중지)
-- 제약조건이름 : FK_EMP_DEPT
ALTER TABLE EMPLOYEE_TBL
    DISABLE CONSTRAINT FK_EMP_DEPT;

-- 외래키 제약조건이 없는 상태이므로, 제약조건을 위배하는 데이터를 입력할 수 있다.
INSERT INTO EMPLOYEE_TBL(EMP_NO, NAME, DEPART, POSITION, GENDER, HIRE_DATE, SALARY)
VALUES(EMPLOYEE_SEQ.NEXTVAL, '김성실', 5, '대리', 'F', '98/12/01', 3500000);
COMMIT;

-- 외래키 제약조건의 활성화(다시 시작)
-- 제약조건이름 : FK_EMP_DEPT
ALTER TABLE EMPLOYEE_TBL
    ENABLE CONSTRAINT FK_EMP_DEPT;











