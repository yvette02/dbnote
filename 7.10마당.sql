CREATE TABLE summer
( sid number,
  class varchar2(20),
  price number
  );

INSERT INTO Summer values (100, 'FORTRAN', 20000);
INSERT INTO Summer values (150, 'PASCAL', 15000);
INSERT INTO Summer values (200, 'C', 10000);
INSERT INTO Summer values (250, 'FORTRAN', 20000);

/* ������ Summer ���̺� Ȯ�� */

select *
from summer;

--200�� �л��� �����б� ������û�� ����Ͻÿ�

/* ���� ������ ��ȸ */

SELECT price "C ������"
FROM SUMMER
WHERE CLASS ='C';

DELETE FROM Summer
WHERE sid=200;

/*���� ������ �ٽ� ��ȸ */
select price "C ������"
from summer
where class ='c';

Insert into summer values (200, 'c', 10000);

Insert into summer values (null, 'Java', 25000);

select *
from summer;

select count(*) "�����ο�"
from summer;

select count(sid) "�����ο�"
from summer;

select count(*) "�����ο�"
from summer
where sid IS NOT NULL;

/* FORTRAN ���� ������ ���� */

UPDATE Summer
SET price=15000
WHERE class='FORTRAN';

SELECT *
FROM SUMMER;

SELECT DISTINCT price "FORTRAN ������"
FROM SUMMER
WHERE CLASS='FORTRAN';

/*���� �ǽ��� ���� FORTRAN ������ �����Ḧ �ٽ� 20,000������ ����*/

UPDATE SUMMER
SET PRICE=20000
WHERE CLASS='FORTRAN';
  
SELECT *
FROM SUMMER;

/*���� UPDATE���� ������ ���� �ۼ��ϸ� ������ ����ġ ������ �߻���*/

UPDATE Summer
SET PRICE=15000
WHERE CLASS='FORTRAN' AND SID=100;

SELECT *
FROM SUMMER;

/*FORTRAN �����Ḧ ��ȸ�ϸ� �� ���� ����(������ ����ġ ���� �߻�) */

SELECT PRICE "FORTRAN ������"
FROM Summer
WHERE CLASS='FORTRAN';


/*����ȭ ���� �ƿ� ���� �ȵ�...*/