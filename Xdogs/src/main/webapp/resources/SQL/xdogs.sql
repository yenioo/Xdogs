show user;
-- USER이(가) "SYS"입니다.

alter session set "_ORACLE_SCRIPT"=true;
-- Session이(가) 변경되었습니다.

create user xdogs identified by aclass default tablespace users;
-- User XDOGS이(가) 생성되었습니다.

grant connect, resource, create view, unlimited tablespace to xdogs;
-- Grant을(를) 성공했습니다.

--------------------------------------------------------------------------------