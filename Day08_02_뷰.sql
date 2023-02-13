/*
    뷰(View)
    1. 테이블이나 뷰를 이용해서 만들어 낸 가상 테이블이다.
    2. 쿼리문 자체를 저장하고 있다.
    3. 자주 사용하는 복잡한 쿼리문이 있다면 뷰로 만들어 두고 편하게 호출한다.
    4. 뷰로 인한 성능상의 이점은 없다.
*/

-- 뷰 만들기
CREATE VIEW VIEW_EMP
    AS (SELECT E.EMP_NO, E.NAME, E.DEPART, D.DEPT_NAME, E.GENDER, E.POSITION, E.HIRE_DATE, E.SALARY
          FROM DEPARTMENT_TBL D INNER JOIN EMPLOYEE_TBL E
            ON D.DEPT_NO = E.DEPART);

-- 뷰 조회하기
SELECT EMP_NO, NAME, DEPT_NAME
  FROM VIEW_EMP
 WHERE DEPART = 1;

-- 뷰 삭제하기
DROP VIEW VIEW_EMP;