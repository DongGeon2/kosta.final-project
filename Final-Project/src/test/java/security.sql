
/* SPRING SECURITY 를 적용할 경우 
 * 회원 가입시 비즈니스 계층(서비스)에서  회원가입과 권한을 함께 insert하도록 처리한다 (트랜잭션 처리 필요!)
 */
drop table security_member;
create table security_member(
	id varchar(100) primary key,
	password varchar(100) not null,
	name varchar(100) not null,
	address varchar(100) not null,
	enabled int default 1 not null 
)

delete from security_member;
commit
select * from security_member;


-- 아이디는 id , 패스워드는 password , 
--탈퇴여부(0은 탈퇴, 1은 가입상태)는 enabled 로 별칭주면 된다 

-- 비밀번호 암호화해서 등록해야 하므로 어플리케이션에서 회원가입을 이용한다 
--insert into security_member(id,password,name,address,enabled) 
--values('java','1234','아이유','판교',1);

--select id,password,name,address,enabled from security_member
--where id='java' and enabled=1;

/*
 * SPRING SECURITY는 권한이 일치하는 대상에 대해 인가하기 때문에 
   관리자 권한 즉, ROLE_ADMIN을 보유하고 있더라도 
   사용자 권한인 ROLE_MEMBER 보유하고 있지 않을 경우 접근을 못하게 된다 
   따라서 한 유저는 여러개의 권한(1:n)을 보유할 수 있어야 하므로 테이블을 생성한다 
 */
drop table authorities;

create table authorities(
	username varchar(100) not null,
	authority varchar(30) not null,
	constraint fk_authorities foreign key(username) references security_member(id),
	constraint member_authorities primary key(username,authority)
)
delete from authorities;
-- -- 어플리케이션에서 회원가입을 하면 ROLE_MEMBER가 등록된다 
-- insert into authorities(username,authority) values('java','ROLE_MEMBER');
-----------------------------------------------------------
--  관리자 권한까지 추가해본다 
insert into authorities(username,authority) values('king','ROLE_ADMIN');

select * from authorities;

commit

create table star_member(
	id varchar(100) primary key,
	name varchar(100) not null
)

create sequence star_member_seq;

insert into star_member(id,name) values(star_member_seq.nextval, '동건');
insert into star_member(id,name) values(star_member_seq.nextval, '지훈');
insert into star_member(id,name) values(star_member_seq.nextval, '경성');
insert into star_member(id,name) values(star_member_seq.nextval, '진솔');
insert into star_member(id,name) values(star_member_seq.nextval, '민수');

drop table star_member;
drop sequence star_member_seq;
drop table star_board;
drop sequence star_board_seq;

select * from star_member;
select * from star_board;
select count(*) from star_member;

create table star_board(
	no number primary key,
	title varchar2(100) not null,
	content clob not null,
	id varchar2(100) not null,
	constraint star_board_fk foreign key(id) references star_member(id)
)

create sequence star_board_seq;

insert into star_board(no,title,content,id) 
values(star_board_seq.nextval,'방가','ㅋㅋ',1);

insert into star_board(no,title,content,id) 
values(star_board_seq.nextval,'안녕','치맥',2);

insert into star_board(no,title,content,id) 
values(star_board_seq.nextval,'즐연휴','추석 연휴 잘보내세요^^',3);

SELECT B.no,B.title,B.content,M.name
FROM 
	(select row_number() over(order by no desc) as rnum, no,title,content,id
	from star_board) B, star_member M
WHERE B.id=M.id AND B.rnum

	   select b.no,b.title,b.content,b.id 
       from (select row_number() over(order by no desc) as rnum,
       no,title,content,id from star_board) b, star_member m
       where b.id=m.id and b.rnum between #{getStartRowNumber} and #{getEndRowNumber}
