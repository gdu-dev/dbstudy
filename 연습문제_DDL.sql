-- 1. 다음 칼럼 정보를 이용하여 MEMBER_T 테이블을 생성하시오.
--    1) 회원번호: MEM_NO, NUMBER, 필수
--    2) 회원아이디: MEM_ID, VARCHAR2(30 BYTE), 필수, 중복 불가
--    3) 회원패스워드: MEM_PW, VARCHAR2(30 BYTE), 필수
--    4) 회원포인트: MEM_POINT, NUMBER
--    5) 회원구분: MEM_GUBUN, VARCHAR2(7 BYTE), 'REGULAR', 'SOCIAL' 값 중 하나를 가짐
--    6) 회원이메일: MEM_EMAIL, VARCHAR2(100 BYTE), 중복 불가


-- 2. MEMBER_T 테이블에 다음 새로운 칼럼을 추가하시오.
--    1) 회원주소: MEM_ADDRESS VARCHAR2(200 BYTE) NULL
--    2) 회원가입일: JOINED_AT DATE NULL


-- 3. 추가된 회원주소 칼럼을 다시 삭제하시오.


-- 4. 회원구분 칼럼의 타입을 VARCHAR2(20 BYTE)으로 수정하시오.


-- 5. 회원패스워드 칼럼의 이름을 MEM_PWD로 수정하시오.


-- 6. 회원번호 칼럼에 기본키(PK_MEMBER)를 설정하시오.


-- 7. 다음 칼럼 정보를 이용하여 BOARD_T 테이블을 생성하시오.
--    1) 글번호: BOARD_NO, NUMBER, 필수
--    2) 글제목: TITLE, VARCHAR2(4000 BYTE), 필수
--    3) 글내용: CONTENTS, VARCHAR2(4000 BYTE), 필수
--    4) 조회수: HIT, VARCHAR2(1 BYTE)
--    5) 작성자: MEM_ID, VARCHAR2(30 BYTE), 필수
--    6) 작성일자: CREATED_AT, VARCHAR2(10 BYTE)


-- 8. 조회수 칼럼의 타입을 NUMBER로 수정하시오.


-- 9. 글내용 칼럼의 필수 제약조건을 제거하시오.


-- 10. 글번호 칼럼에 기본키(PK_BOARD)를 설정하시오.


-- 11. 작성자 칼럼에 MEMBER_T 테이블의 회원아이디를 참조하는 FK_BOARD_MEMBER 외래키를 설정하시오.
-- 게시글을 작성한 회원 정보가 삭제되면 해당 회원이 작성한 게시글도 모두 함께 지워지도록 처리하시오.


-- 12. MEMBER_T 테이블과 BOARD_T 테이블을 모두 삭제하시오.
