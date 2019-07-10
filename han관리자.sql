create tablespace madang 
datafile 'd:\Honggildong\madang.dbf'
size 50M
autoextend on next 10M 
maxsize unlimited;

drop tablespace madang;

create user madang identified by madang
default tablespace madang;

grant connect, resource, dba to madang;