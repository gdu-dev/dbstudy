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

-- 부서 테이블의 부서 번호를 생성하는 시퀀스 만들기 (디폴트로 생성)
CREATE SEQUENCE DEPT_SEQ
    INCREMENT BY 1  -- 1씩 증가하는 번호 생성
    START WITH 0    -- 1부터 번호 생성
    NOMAXVALUE      -- 상한선 없음
    NOMINVALUE      -- 하한선 없음
    NOCYCLE         -- 번호 순환 없음
    CACHE 20        -- 20개의 번호를 미리 생성 (번호를 미리 생성하지 않는 NOCACHE 옵션을 사용함)
    NOORDER         -- 번호를 순서 없이 사용
;







