DROP TABLE ko_member cascade constraint;
DROP TABLE ko_authorities;
DROP TABLE ko_board cascade constraint; 
DROP sequence ko_board_seq;
DROP TABLE ko_board_comment
DROP sequence ko_board_comment_seq;

DROP TABLE ko_restaurant cascade constraint;
DROP sequence ko_restaurant_no_seq;
DROP TABLE ko_my_pick;
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

select * from ko_board
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
   id VARCHAR2(100) not null,
   res_no number not null,
   res_pick_date date not null,
   CONSTRAINT ko_my_pick PRIMARY KEY (id, res_no),
   CONSTRAINT ko_pick_id foreign key(id) references ko_member(id) on delete cascade,
   CONSTRAINT ko_pick_resno foreign key(res_no) references ko_restaurant(res_no) on delete cascade
)

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
--select

SELECT * FROM ko_member;

select a.* , b.res_no
from 
	(select row_number() over(order by review_no desc) as rnum, review_no, review_title,
	review_content, review_image, review_regdate, review_grade, res_no, id
	from KO_REVIEW
	where res_no=4) a, ko_restaurant b
where a.res_no = b.res_no and rnum between 1 and 10

SELECT a.res_no, a.res_name, a.res_info, a.res_tel, a.res_loc, a.res_image, a.food_type,
				a.start_time, a.end_time, b.id, b.email, b.tel, b.name, b.enabled 
FROM ko_restaurant a, ko_member b
WHERE a.id=b.id and res_no=4
