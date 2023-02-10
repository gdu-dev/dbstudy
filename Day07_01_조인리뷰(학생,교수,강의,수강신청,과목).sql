-- 학생 이름, 담당 교수 이름 조회하기
SELECT S.S_NAME, P.P_NAME
  FROM PROFESSOR_TBL P INNER JOIN STUDENT_TBL S
    ON P.P_NO = S.P_NO;

SELECT S.S_NAME, P.P_NAME
  FROM PROFESSOR_TBL P, STUDENT_TBL S
 WHERE P.P_NO = S.P_NO;

-- 교수번호, 교수이름, 교수전공, 강좌이름, 강좌위치를 조회하시오.
