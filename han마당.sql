
CREATE TABLE book(
    Bookid number(3), 
    bookname varchar2(50),
    publisher varchar2(30),
    price number(8),
    primary key(bookid)

);
/*
INSERT INTO tablename
VALUES(값 리스트);
*/
INSERT INTO book VALUES(1,'레미제라블','대한출',14000);
INSERT INTO book(bookid, bookname, publisher)
        VALUES(2, '장발장', '한빛');
UPDATE book
SET price = 30000;
WHERE bookid = 2;

DELETE FROM book;
WHERE bookid = 2;
rollback;
SELECT * FROM book;
        
SELECT *
FROM book;

DROP TABLE book;

CREATE TABLE book (
    Bookid number(2) primary key, 
    bookname varchar2(40),
    publisher varchar2(40),
    price number(8)
    );
    
CREATE TABLE Customer(
    custid number(2) PRIMARY KEY, 
    name varchar2(40),
    address varchar2(50),
    phone VARCHAR2(20)
    );
    
CREATE TABLE Orders(
    orderid number(3) primary key, 
    custid number(2) references customer(custid),
    bookid number(2) references book(bookid),
    saleprice number(8),
    orderdate DATE
    );

INSERT INTO Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO Book VALUES(2, '축구아는여자', '나무수', 13000);
INSERT INTO Book VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO Book VALUES(6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO Book VALUES(10, 'Olypic Champions', 'Pearson', 13000);

INSERT INTO Customer VALUES(1, '박지성', '영국 맨체스터', '000-5000-0001');
INSERT INTO Customer VALUES(2, '김연아', '대한민국 서울', '000-6000-0001');
INSERT INTO Customer VALUES(3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO Customer VALUES(4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO Customer VALUES(5, '박세리', '대한민국 대전', '000-9000-0001');

INSERT INTO Orders VALUES(1, 1, 1, 6000, TO_DATE('2014-07-01', 'yyyy-mm-dd'));
INSERT INTO Orders VALUES(2, 1, 3, 21000, TO_DATE('2014-07-03', 'yyyy-mm-dd'));
INSERT INTO Orders VALUES(3, 2, 5, 8000, TO_DATE('2014-07-03', 'yyyy-mm-dd'));
INSERT INTO Orders VALUES(4, 3, 6, 6000, TO_DATE('2014-07-04', 'yyyy-mm-dd'));
INSERT INTO Orders VALUES(5, 4, 7, 20000, TO_DATE('2014-07-05', 'yyyy-mm-dd'));
INSERT INTO Orders VALUES(6, 1, 2, 12000, TO_DATE('2014-07-07', 'yyyy-mm-dd'));
INSERT INTO Orders VALUES(7, 4, 8, 13000, TO_DATE('2014-07-07', 'yyyy-mm-dd'));
INSERT INTO Orders VALUES(8, 3, 10, 12000, TO_DATE('2014-07-08', 'yyyy-mm-dd'));
INSERT INTO Orders VALUES(9, 2, 10, 7000, TO_DATE('2014-07-09', 'yyyy-mm-dd'));
INSERT INTO Orders VALUES(10, 3, 8, 13000, TO_DATE('2014-07-10', 'yyyy-mm-dd'));

CREATE TABLE Imported_Book (
bookid Number,
bookname VARCHAR(40),
publisher VARCHAR(40),
price Number(8)
);

INSERT INTO Imported_Book VALUES(21, 'Zen Golf', 'Pearson', 12000);
INSERT INTO Imported_Book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);

COMMIT;

SELECT *
FROM book, customer;

SET AUTO OFF;


select * from customer;
INSERT INTO customer
VALUES(6, '홍길동', '대한민국 대전', NULL);
rollback;


select * from customer;
commit;
rollback;
select * from customer;
delete from customer where custid=6;
select * from customer;
rollback;
select * from customer;

commit;
delete from customer;


SELECT *
FROM BOOK;

CREATE TABLE NewBOOK (
BOOKID NUMBER, 
BOOKNAME VARCHAR2(40),
PUBLISHER VARCHAR2(40),
PRICE NUMBER);

drop table newbook cascade constraints purge;

create table newbook (
bookid number,
bookname varchar2(40),
publisher varchar2(40),
price number,
primary key (bookid));

insert into newbook(bookid, bookname, publisher, price)
values (42, '인체의 신비', '학지사', 13000);

select*from newbook;

insert into newbook(bookid, bookname, publisher, price)
values (23, '요가의 기술', '쉴라', 24000);

select*from newbook;

update newbook
set bookname='요가의 신비'
where bookid=23;

select*from newbook;

update newbook
set price='15000'
where bookid=23;

select*from newbook;

insert into newbook(bookid, bookname, publisher, price)
values (13, '아쉬탕가 요가', '지학사', 21000);

select*from newbook;

delete from newbook
where bookid=13;

rollback;
select*from newbook;

insert into newbook(bookid, bookname, publisher, price)
values (3, '빈야사 요가', '카밀라', 8000);

select max(price)
from newbook;

select bookname
from newbook
where price=24000;

select bookname
from book
where price = (select min(price)
from book);

select bookname
from newbook
where price = (select min(price)
from newbook);

--도서를 구매한 적이 있는 고객의 이름을 검색하시오.

select name
from customer
where custid in(select custid 
from orders);

--대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오.

select name
from customer
where custid in(select custid
from orders
--주문테이블에서 고객아이디를 찾고
where bookid in(select bookid 
from book
--북테이블에서 북아이디를 찾고
where publisher='대한미디어'));
--


select bookid
from book 
where publisher='대한미디어';

select custid
from orders
where bookid in(select bookid
from book
where publisher='대한미디어');

select name
from customer
where custid in(select custid
from orders
where bookid in(select bookid
from book
where publisher='대한미디어'));

--굿스포츠에서 출판한 도서를 구매한 고객의 이름을 보이시오
--
select bookid
from book
where publisher='굿스포츠';


--테이블 생성
CREATE TABLE ex (
id number(3),
name varchar(30),
salary number(7)
);


insert into ex values(1, '홍길동', 100);
insert into ex values(1, '홍길동', 200);

select*
from ex;

drop table ex;
--제약조건 primary키를 걸어서 테이블을 생성해보자.
CREATE TABLE ex (
id number(3) Primary key,
name varchar(30),
salary number(7)
);    

select * from ex;

insert into ex values(1, '홍길동', 300);
insert into ex values(2, '박문수', 2000);
insert into ex values(3, '성춘향', 500);
drop table ex;

CREATE TABLE ex (
id number(3),
name varchar(30) constraint cname_unique unique,
salary number(7), constraint cname_check CHECK(salary BETWEEN 300 AND 1000),
primary key(id)
);

drop table ex;

select constraint_name from user_constraints;

--테이블 이름 변경
rename example to ex;

--테이블에 컬럼을 추가
--alter table add(새로운컬럼이름, 타입)
alter table ex add(dept_id number(3));

desc ex;

--컬럼속성수정
alter table ex modify(name varchar(50));

desc ex;

alter table ex drop column dept_id;

--컬럼 이름수정 
alter table ex rename column salary to pay;
desc ex;


SELECT TO_DATE('2014-07-01', 'yyyy-mm-dd')+3,
TO_DATE('2014-07-01', 'yyyy-mm-dd')-3 after
FROM Dual;

SELECT orderid "주문번호", orderdate "주문일", orderdate+10 "확정"
FROM Orders;

select bookid, replace(bookname, '야구', '농구') bookname, publisher, price
from book;

select bookid, replace(bookname, '바이블', '교본') bookname, publisher, price
from book;

select sysdate , to_char(sysdate, 'yyyymmdd day')
from dual;

select sysdate, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') "sysdate_1"
from dual;

SELECT orderid "주문번호", TO_CHAR(orderdate, 'yyyy-mm-dd dy') "주문일",
custid "고객번호", bookid "도서번호"
FROM Orders
WHERE orderdate=TO_DATE('20140707', 'yyyymmdd');

SELECT cs.name, sum(od.saleprice) "total"
FROM  (select custid, name 
FROM customer
WHERE custid <=2) cs,
orders od
WHERE cs.custid=od.custid
GROUP BY cs.name;

SELECT name, sum(od.saleprice) "total"
FROM (select custid, name
FROM customer
WHERE custid < 4) cs,
orders od
WHERE cs.custid=od.custid
GROUP BY cs.name;

select orderid "주문번호", orderdate "주문일자", orderdate+14 "확정일자"
from orders;

SELECT SYSDATE 오늘날짜, ADD_MONTHS(SYSDATE, 120) "10년 뒤 날짜"
FROM DUAL;

CREATE TABLE Mybook (
bookid number(3),
price number(7)
);


select*
from mybook;



insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook values(3, NULL);

select price+100
from mybook
where bookid=2;


CREATE TABLE o_tbl(a number, b number, c number);

CREATE or replace view view1
as
    select a, b
    from o_tbl;
    
--실제 오리지널 테이블에 들어가는지 보자

insert into view1 values(1,2);
select * from o_tbl;
select * from view1;

update o_tbl set b=1 where a=1;

select * from view1;


CREATE or replace view view2
as
    select a, b
    from o_tbl
with read only;

insert into view2 values(99,99);

select * from view2;

select * from user_views;

select * from tabs;
--시스템 안에 존재하는 테이블 정보들을 조회할 수 있다.
/*
view는 수정하는 기능은 없음.
*/


CREATE or replace view view2
as
    select b, c
    from o_tbl
with read only;

select * from view2;
select * from user_views;
/*
자료를 만들면서 생길 수 있는 이상현상을 초기화
아노말리

뷰를 만들어놓고 간단하게 뷰를 통해 검색하는게 더 간편하고 용이함.
*/

CREATE view vw_customer
as select *
from customer
where address like '%대한민국%';



CREATE OR REPLACE VIEW vw_customer(custid, name, address)
AS SELECT custid, name, address
FROM customer
WHERE address LIKE '%영국%';

SELECT *
FROM vw_customer;

--판매가격이 20,000원 이상인 도서의 도서번호, 도서이름, 고객이름, 출판사, 판매가격을 보여주는 highorders 뷰를 생성하시오.
CREATE or replace view highorders
as 
select b.bookid, b.bookname, c.name, b.publisher, o.saleprice
from book b, customer c, orders o
where o.custid = c.custid
and o.bookid = b.bookid
and o.saleprice >= 20000;

select * from highorders;

--생성한 뷰를 이용하여 판매된 도서의 이름과 고객의 이름을 출력하는 SQL 문을 작성하시오

select bookname, name
from highorders
where;

create index ix_book ON book (bookname);
DROP INDEX ix_book;

CREATE TABLE test(no NUMBER);

BEGIN
    FOR i IN 1..10000 LOOP
        INSERT INTO test VALUES(i);
    END LOOP;
    COMMIT;
END;
/

SELECT * FROM test;

SELECT * FROM test WHERE no = 9999;

CREATE INDEX idx_test_no on test(no);

--인덱스의 상태를 조회하는 방법
ANALYZE INDEX idx_test_no VALIDATE STRUCTURE;

SELECT (del_lf_rows_len / lf_rows_len) * 100 BALANCE
FROM index_stats
WHERE name='IDX_TEST_NO';

select *
from index_stats;

DELETE FROM test
WHERE no BETWEEN 2500 AND 6500; 

ANALYZE INDEX idx_test_no VALIDATE STRUCTURE;
SELECT (del_lf_rows_len / lf_rows_len) * 100 BALANCE
FROM index_stats
WHERE name='IDX_TEST_NO';

-- 인덱스를 리빌드
ALTER INDEX idx_test_no REBUILD;

ANALYZE INDEX idx_test_no VALIDATE STRUCTURE;
SELECT (del_lf_rows_len / lf_rows_len) * 100 BALANCE
FROM index_stats
WHERE name='IDX_TEST_NO';