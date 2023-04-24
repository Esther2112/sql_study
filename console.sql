
-- 테이블(엔터티) 생성
-- 성적 정보 저장 테이블
create table tbl_score (
  name varchar2(5) not null,
  kor number(3) not null check ( kor >= 0 and kor <= 100 ),
  eng number(3) not null check ( eng >= 0 and eng <= 100 ),
  math number(3) not null check ( math >= 0 and math <= 100 ),
  total number(3),
  average number(5, 2),
  grade char(1),
  stu_num number(6),
  -- PK 거는법
  constraint pk_stu_num primary key (stu_num)
);

-- 테이블 생성 후 PK 적용하기
alter table tbl_score
add constraint pk_stu_num primary key (stu_num);

-- 컬럼 추가하기
alter table tbl_score add (sci number(3) not null);

-- 컬럼 제거하기
alter table tbl_score drop column sci;

-- 테이블 복사 (tb_emp)
-- CTAS
create table tb_emp_copy as select * from tb_emp;

-- 복사 테이블 조회
select * from tb_emp_copy;
select * from tb_emp;

-- drop table
drop table tb_emp_copy;

-- truncate table
-- 테이블 구조는 남기고 내부 데이터만 전체삭제
-- 롤백 안됨
truncate table tb_emp_copy;

-- 예시 테이블
create table goods (
  id number(6) primary key,
  g_name varchar2(10) not null,
  price number(10) default 1000,
  reg_date date
);

select * from goods;

-- insert
insert into goods (id, g_name, price, reg_date) values (1, '선풍기', '120000', sysdate);
insert into goods (id, g_name, reg_date) values (2, '자전거', sysdate);
insert into goods (id, g_name, price) values (3, '껌', 500);

-- 수정 update
update goods set price = 200000
where id = 2;

update goods set g_name = '콜라', price = 3000
where id = 3;

update goods set reg_date = sysdate
where id = 3;

-- 행을 삭제 delete
delete from goods
where id = 3;

select * from goods;

-- select 조회
select CERTI_CD, CERTI_NM, ISSUE_INSTI_NM
from TB_CERTI;

-- 중복제거 distinct
select distinct ISSUE_INSTI_NM
from TB_CERTI;
