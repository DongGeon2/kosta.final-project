--drop--
DROP TABLE ko_member cascade constraint;
DROP TABLE ko_authorities;
DROP TABLE ko_board;
DROP sequence ko_board_seq;
DROP TABLE ko_board_comment
DROP sequence ko_board_comment_seq;

DROP TABLE ko_restaurant;
DROP sequence ko_restaurant_no_seq;
DROP TABLE ko_my_pick;
DROP TABLE ko_review;
DROP sequence ko_review_seq;
DROP TABLE ko_reservation;
DROP sequence ko_reservation_seq;

--select--
SELECT * FROM ko_member;
SELECT * FROM ko_authorities;
SELECT * FROM ko_board;
SELECT * FROM ko_board_comment;
SELECT * FROM ko_restaurant;
SELECT * FROM ko_my_pick;
SELECT * FROM ko_reservation;
SELECT * FROM ko_review;

--1. 회원 테이블
CREATE TABLE ko_member(
   id varchar2(100) primary key,
   password varchar2(100) not null,
   email varchar2(100) not null,
   name varchar2(100) not null,
   tel varchar2(10) not null,
   enabled int default 1 not null 
)
SELECT * FROM ko_member;


--2. 권한 테이블
CREATE TABLE ko_authorities(
   id varchar(100) not null,
   authority varchar(30) not null,
   CONSTRAINT fk_ko_authorities foreign key(id) references ko_member(id) on delete cascade,
   CONSTRAINT ko_member_authorities primary key(id,authority)
)
SELECT * FROM ko_authorities;


--3.자유 게시판 테이블
CREATE TABLE ko_board(
   board_no number primary key,
   title varchar2(100) not null,
   time_posted date not null,
   content clob not null,
   hits number default 0,
   id varchar2(100) not null,
   CONSTRAINT ko_board_fk foreign key(id) references ko_member(id) on delete cascade
)
CREATE sequence ko_board_seq;
SELECT * FROM ko_board;


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
CREATE sequence ko_board_comment_seq;
SELECT * FROM ko_board_comment;


--5. 레스토랑 테이블
CREATE TABLE ko_restaurant(
	res_no number primary key,
	res_name varchar2(100) not null,
	res_info varchar2(100) not null,
	res_tel varchar2(100) not null,
	res_loc varchar2(100) not null,
	res_image varchar2(100) not null,
	food_type varchar2(100) not null,
	end_time varchar2(100) not null,
	start_time varchar2(100) not null
)
CREATE sequence ko_restaurant_no_seq;
SELECT * FROM ko_restaurant;

alter table ko_restaurant drop column res_time;
alter table ko_restaurant ADD start_time varchar2(100);
alter table ko_restaurant ADD end_time varchar2(100);


--6. 찜 테이블
CREATE TABLE ko_my_pick(
   id VARCHAR2(100) not null,
   res_no number not null,
   res_pick_date date not null,
   CONSTRAINT ko_my_pick PRIMARY KEY (id, res_no),
   CONSTRAINT ko_pick_id foreign key(id) references ko_member(id) on delete cascade,
   CONSTRAINT ko_pick_resno foreign key(res_no) references ko_restaurant(res_no) on delete cascade
)
SELECT * FROM ko_my_pick;

--7. 예약 테이블
CREATE TABLE ko_reservation(
	rev_no number primary key,
	rev_time varchar2(100) not null,
	rev_headcount number not null,
	res_no number not null,
	id varchar2(100) not null,
	CONSTRAINT ko_rev_res foreign key(res_no) references ko_restaurant(res_no) on delete cascade,
	CONSTRAINT ko_rev_id foreign key(id) references ko_member(id) on delete cascade
)
CREATE sequence ko_reservation_seq;
SELECT * FROM ko_reservation;

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
SELECT * FROM ko_review;

