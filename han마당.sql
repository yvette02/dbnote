
CREATE TABLE book(
    Bookid number(3), 
    bookname varchar2(50),
    publisher varchar2(30),
    price number(8),
    primary key(bookid)

);
/*
INSERT INTO tablename
VALUES(�� ����Ʈ);
*/
INSERT INTO book VALUES(1,'���������','������',14000);
INSERT INTO book(bookid, bookname, publisher)
        VALUES(2, '�����', '�Ѻ�');
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

INSERT INTO Book VALUES(1, '�౸�� ����', '�½�����', 7000);
INSERT INTO Book VALUES(2, '�౸�ƴ¿���', '������', 13000);
INSERT INTO Book VALUES(3, '�౸�� ����', '���ѹ̵��', 22000);
INSERT INTO Book VALUES(4, '���� ���̺�', '���ѹ̵��', 35000);
INSERT INTO Book VALUES(5, '�ǰ� ����', '�½�����', 8000);
INSERT INTO Book VALUES(6, '���� �ܰ躰���', '�½�����', 6000);
INSERT INTO Book VALUES(7, '�߱��� �߾�', '�̻�̵��', 20000);
INSERT INTO Book VALUES(8, '�߱��� ��Ź��', '�̻�̵��', 13000);
INSERT INTO Book VALUES(9, '�ø��� �̾߱�', '�Ｚ��', 7500);
INSERT INTO Book VALUES(10, 'Olypic Champions', 'Pearson', 13000);

INSERT INTO Customer VALUES(1, '������', '���� ��ü����', '000-5000-0001');
INSERT INTO Customer VALUES(2, '�迬��', '���ѹα� ����', '000-6000-0001');
INSERT INTO Customer VALUES(3, '��̶�', '���ѹα� ������', '000-7000-0001');
INSERT INTO Customer VALUES(4, '�߽ż�', '�̱� Ŭ������', '000-8000-0001');
INSERT INTO Customer VALUES(5, '�ڼ���', '���ѹα� ����', '000-9000-0001');

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
VALUES(6, 'ȫ�浿', '���ѹα� ����', NULL);
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
values (42, '��ü�� �ź�', '������', 13000);

select*from newbook;

insert into newbook(bookid, bookname, publisher, price)
values (23, '�䰡�� ���', '����', 24000);

select*from newbook;

update newbook
set bookname='�䰡�� �ź�'
where bookid=23;

select*from newbook;

update newbook
set price='15000'
where bookid=23;

select*from newbook;

insert into newbook(bookid, bookname, publisher, price)
values (13, '�ƽ����� �䰡', '���л�', 21000);

select*from newbook;

delete from newbook
where bookid=13;

rollback;
select*from newbook;

insert into newbook(bookid, bookname, publisher, price)
values (3, '��߻� �䰡', 'ī�ж�', 8000);

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

--������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.

select name
from customer
where custid in(select custid 
from orders);

--���ѹ̵��� ������ ������ ������ ���� �̸��� ���̽ÿ�.

select name
from customer
where custid in(select custid
from orders
--�ֹ����̺��� �����̵� ã��
where bookid in(select bookid 
from book
--�����̺��� �Ͼ��̵� ã��
where publisher='���ѹ̵��'));
--


select bookid
from book 
where publisher='���ѹ̵��';

select custid
from orders
where bookid in(select bookid
from book
where publisher='���ѹ̵��');

select name
from customer
where custid in(select custid
from orders
where bookid in(select bookid
from book
where publisher='���ѹ̵��'));

--�½��������� ������ ������ ������ ���� �̸��� ���̽ÿ�
--
select bookid
from book
where publisher='�½�����';


--���̺� ����
CREATE TABLE ex (
id number(3),
name varchar(30),
salary number(7)
);


insert into ex values(1, 'ȫ�浿', 100);
insert into ex values(1, 'ȫ�浿', 200);

select*
from ex;

drop table ex;
--�������� primaryŰ�� �ɾ ���̺��� �����غ���.
CREATE TABLE ex (
id number(3) Primary key,
name varchar(30),
salary number(7)
);    

select * from ex;

insert into ex values(1, 'ȫ�浿', 300);
insert into ex values(2, '�ڹ���', 2000);
insert into ex values(3, '������', 500);
drop table ex;

CREATE TABLE ex (
id number(3),
name varchar(30) constraint cname_unique unique,
salary number(7), constraint cname_check CHECK(salary BETWEEN 300 AND 1000),
primary key(id)
);

drop table ex;

select constraint_name from user_constraints;

--���̺� �̸� ����
rename example to ex;

--���̺� �÷��� �߰�
--alter table add(���ο��÷��̸�, Ÿ��)
alter table ex add(dept_id number(3));

desc ex;

--�÷��Ӽ�����
alter table ex modify(name varchar(50));

desc ex;

alter table ex drop column dept_id;

--�÷� �̸����� 
alter table ex rename column salary to pay;
desc ex;


SELECT TO_DATE('2014-07-01', 'yyyy-mm-dd')+3,
TO_DATE('2014-07-01', 'yyyy-mm-dd')-3 after
FROM Dual;

SELECT orderid "�ֹ���ȣ", orderdate "�ֹ���", orderdate+10 "Ȯ��"
FROM Orders;

select bookid, replace(bookname, '�߱�', '��') bookname, publisher, price
from book;

select bookid, replace(bookname, '���̺�', '����') bookname, publisher, price
from book;

select sysdate , to_char(sysdate, 'yyyymmdd day')
from dual;

select sysdate, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') "sysdate_1"
from dual;

SELECT orderid "�ֹ���ȣ", TO_CHAR(orderdate, 'yyyy-mm-dd dy') "�ֹ���",
custid "����ȣ", bookid "������ȣ"
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

select orderid "�ֹ���ȣ", orderdate "�ֹ�����", orderdate+14 "Ȯ������"
from orders;

SELECT SYSDATE ���ó�¥, ADD_MONTHS(SYSDATE, 120) "10�� �� ��¥"
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
    
--���� �������� ���̺� ������ ����

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
--�ý��� �ȿ� �����ϴ� ���̺� �������� ��ȸ�� �� �ִ�.
/*
view�� �����ϴ� ����� ����.
*/


CREATE or replace view view2
as
    select b, c
    from o_tbl
with read only;

select * from view2;
select * from user_views;
/*
�ڷḦ ����鼭 ���� �� �ִ� �̻������� �ʱ�ȭ
�Ƴ븻��

�並 �������� �����ϰ� �並 ���� �˻��ϴ°� �� �����ϰ� ������.
*/

CREATE view vw_customer
as select *
from customer
where address like '%���ѹα�%';



CREATE OR REPLACE VIEW vw_customer(custid, name, address)
AS SELECT custid, name, address
FROM customer
WHERE address LIKE '%����%';

SELECT *
FROM vw_customer;

--�ǸŰ����� 20,000�� �̻��� ������ ������ȣ, �����̸�, ���̸�, ���ǻ�, �ǸŰ����� �����ִ� highorders �並 �����Ͻÿ�.
CREATE or replace view highorders
as 
select b.bookid, b.bookname, c.name, b.publisher, o.saleprice
from book b, customer c, orders o
where o.custid = c.custid
and o.bookid = b.bookid
and o.saleprice >= 20000;

select * from highorders;

--������ �並 �̿��Ͽ� �Ǹŵ� ������ �̸��� ���� �̸��� ����ϴ� SQL ���� �ۼ��Ͻÿ�

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

--�ε����� ���¸� ��ȸ�ϴ� ���
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

-- �ε����� ������
ALTER INDEX idx_test_no REBUILD;

ANALYZE INDEX idx_test_no VALIDATE STRUCTURE;
SELECT (del_lf_rows_len / lf_rows_len) * 100 BALANCE
FROM index_stats
WHERE name='IDX_TEST_NO';