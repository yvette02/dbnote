CREATE TABLE summer
( sid number,
  class varchar2(20),
  price number
  );

INSERT INTO Summer values (100, 'FORTRAN', 20000);
INSERT INTO Summer values (150, 'PASCAL', 15000);
INSERT INTO Summer values (200, 'C', 10000);
INSERT INTO Summer values (250, 'FORTRAN', 20000);

/* 생성된 Summer 테이블 확인 */

select *
from summer;

--200번 학생의 계절학기 수강신청을 취소하시오

/* 강좌 수강료 조회 */

SELECT price "C 수강료"
FROM SUMMER
WHERE CLASS ='C';

DELETE FROM Summer
WHERE sid=200;

/*강좌 수강료 다시 조회 */
select price "C 수강료"
from summer
where class ='c';

Insert into summer values (200, 'c', 10000);

Insert into summer values (null, 'Java', 25000);

select *
from summer;

select count(*) "수강인원"
from summer;

select count(sid) "수강인원"
from summer;

select count(*) "수강인원"
from summer
where sid IS NOT NULL;

/* FORTRAN 강좌 수강료 수정 */

UPDATE Summer
SET price=15000
WHERE class='FORTRAN';

SELECT *
FROM SUMMER;

SELECT DISTINCT price "FORTRAN 수강료"
FROM SUMMER
WHERE CLASS='FORTRAN';

/*다음 실습을 위해 FORTRAN 강좌의 수강료를 다시 20,000원으로 복구*/

UPDATE SUMMER
SET PRICE=20000
WHERE CLASS='FORTRAN';
  
SELECT *
FROM SUMMER;

/*만약 UPDATE문을 다음과 같이 작성하면 데이터 불일치 문제가 발생함*/

UPDATE Summer
SET PRICE=15000
WHERE CLASS='FORTRAN' AND SID=100;

SELECT *
FROM SUMMER;

/*FORTRAN 수강료를 조회하면 두 건이 나옴(데이터 불일치 문제 발생) */

SELECT PRICE "FORTRAN 수강료"
FROM Summer
WHERE CLASS='FORTRAN';


/*정규화 과정 아예 이해 안됨...*/