DROP TABLE ko_member cascade constraint;
DROP TABLE ko_authorities;
DROP TABLE ko_board;
DROP sequence ko_board_seq;
DROP TABLE ko_board_comment
DROP sequence ko_board_comment_seq;

DROP TABLE ko_restaurant cascade constraint;
DROP sequence ko_restaurant_no_seq;
DROP TABLE ko_my_pick;
DROP sequence ko_my_pick_seq;
DROP TABLE ko_review;
DROP sequence ko_review_seq;
DROP TABLE ko_reservation;
DROP sequence ko_reservation_seq;

--1. 회원 테이블
CREATE TABLE ko_member(
   id varchar2(100) primary key,
   password varchar2(100) not null,
   email varchar2(100) not null,
   name varchar2(100) not null,
   tel varchar2(10) not null,
   enabled int default 1 not null 
)
ALTER TABLE ko_member MODIFY(tel VARCHAR2(100));

select * from ko_member
--2. 권한 테이블
CREATE TABLE ko_authorities(
   id varchar(100) not null,
   authority varchar(30) not null,
   CONSTRAINT fk_ko_authorities foreign key(id) references ko_member(id) on delete cascade,
   CONSTRAINT ko_member_authorities primary key(id,authority)
)

--3.자유 게시판 테이블
CREATE TABLE ko_board(
   board_no number primary key,
   title varchar2(100) not null,
   time_posted date not null,
   content clob not null,
   hits number default 0,
   id varchar2(100) not null,
   img varchar2(100),
   CONSTRAINT ko_board_fk foreign key(id) references ko_member(id) on delete cascade
)
CREATE sequence ko_board_seq;
alter table ko_board add img varchar2(100) not null;
select * from KO_BOARD


select * from ko_authorities

--4. 자유 게시판 댓글 
CREATE TABLE ko_board_comment(
   comment_no number primary key,
   comment_content clob not null,
   comment_time date not null,
   id varchar2(100) not null,
   board_no number not null,
   CONSTRAINT fk_ko_board_comment foreign key(board_no) references ko_board(board_no) on delete cascade,
   CONSTRAINT fk_ko_member_id foreign key(id) references ko_member(id) on delete cascade
)

select * from ko_restaurant
CREATE sequence ko_board_comment_seq;

--5. 레스토랑 테이블
CREATE TABLE ko_restaurant(
	res_no number not null primary key,
	id varchar2(100) not null,
	res_name varchar2(100) not null,
	res_info varchar2(100) not null,
	res_tel varchar2(100) not null,
	res_loc varchar2(100) not null,
	res_detailloc varchar2(100) not null,
	res_image varchar2(100) not null,
	food_type varchar2(100) not null,
	start_time varchar2(100) not null,
	end_time varchar2(100) not null,
	CONSTRAINT fk_ko_restaurant_id foreign key(id) references ko_member(id) on delete cascade
)
CREATE sequence ko_restaurant_no_seq;

--alter table ko_restaurant drop column res_time;
--alter table ko_restaurant add start_time;
--alter table ko_restaurant add end_time;

select * from ko_restaurant

--6. 찜 테이블
CREATE TABLE ko_my_pick(
	pick_no number primary key,
    id VARCHAR2(100) not null,
    res_no number not null,
    CONSTRAINT ko_pick_id foreign key(id) references ko_member(id) on delete cascade,
    CONSTRAINT ko_pick_resno foreign key(res_no) references ko_restaurant(res_no) on delete cascade
)
CREATE sequence ko_my_pick_seq;
SELECT * FROM ko_my_pick where id='1234'
select * from KO_MY_PICK

drop table ko_my_pick
drop sequence ko_my_pick_seq;

--7. 예약 테이블
CREATE TABLE ko_reservation(
	rev_no number primary key,
	rev_time varchar2(100) not null,
	rev_hour varchar2(100) not null,
	rev_headcount number not null,
	res_no number not null,
	id varchar2(100) not null,
	CONSTRAINT ko_rev_res foreign key(res_no) references ko_restaurant(res_no) on delete cascade,
	CONSTRAINT ko_rev_id foreign key(id) references ko_member(id) on delete cascade
)
CREATE sequence ko_reservation_seq;

--밑에 alter 및 update 하나씩 실행 시켜줘야함(동건)
alter table ko_reservation add rev_hour varchar2(100)
update ko_reservation set rev_hour='3:00 PM'
alter table ko_reservation modify rev_hour varchar2(100) not null

select * from ko_reservation

--8. 예약 리뷰 테이블
CREATE TABLE ko_review(
	review_no number primary key,
	review_title varchar2(100) not null,
	review_content varchar2(100) not null,
	review_image varchar2(100) not null,
	review_regdate date not null,
	review_grade number not null,
	res_no number not null,
	id varchar2(100) not null,
	CONSTRAINT ko_review_res foreign key(res_no) references ko_restaurant(res_no) on delete cascade,
	CONSTRAINT ko_review_id foreign key(id) references ko_member(id) on delete cascade
)
CREATE sequence ko_review_seq;
select * from ko_review

--9.예약 기록 테이블(동건 추가)
CREATE TABLE ko_record(
	record_no varchar2(100) primary key,
	record_check varchar2(100) not null,
	record_time varchar2(100) not null,
	id varchar2(100) not null,
	res_no number not null,
	CONSTRAINT ko_record_res foreign key(res_no) references ko_restaurant(res_no) on delete cascade,
	CONSTRAINT ko_record_id foreign key(id) references ko_member(id) on delete cascade
)
CREATE sequence ko_record_seq;

select * from KO_RECORD

update ko_record
set record_check=1 
where id='java2' and res_no='1' and record_time='2021-07-14'

---------------------------------

SELECT * FROM ko_member;


 select AVG(a.review_grade)
 from ko_review a, ko_restaurant b
 where a.res_no = b.res_no and a.res_no=3
