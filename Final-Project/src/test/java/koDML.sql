--회원
insert into ko_member(id,password,email,name,tel) values('KDG','1','rlagjqm1@naver.com','김동건','0101');
insert into ko_member(id,password,email,name,tel) values('JJH','1','J@naver.com','장지훈','0102');
insert into ko_member(id,password,email,name,tel) values('BKS','1','B@naver.com','백경성','0103');
insert into ko_member(id,password,email,name,tel) values('KJS','1','S@naver.com','김진솔','0104');
insert into ko_member(id,password,email,name,tel) values('JYJ','1','Y@naver.com','정예진','0105');

select * from ko_member


--권한
insert into ko_authorities(id,authority) values('KDG','ROLE_ADMIN');
insert into ko_authorities(id,authority) values('KJS','ROLE_OWNER');
insert into ko_authorities(id,authority) values('JJH','ROLE_MEMBER');
insert into ko_authorities(id,authority) values('BKS','ROLE_MEMBER');
insert into ko_authorities(id,authority) values('JYJ','ROLE_MEMBER');

--권한 추가해야할것.
insert into ko_authorities(id,authority) values('KDG','ROLE_OWNER');
insert into ko_authorities(id,authority) values('KDG','ROLE_MEMBER');
insert into ko_authorities(id,authority) values('KJS','ROLE_MEMBER');

select * from ko_authorities

CREATE TABLE ko_restaurant(
	res_no number not null,
	id varchar2(100) not null,
	res_name varchar2(100) not null,
	res_info varchar2(100) not null,
	res_tel varchar2(100) not null,
	res_loc varchar2(100) not null,
	res_image varchar2(100) not null,
	food_type varchar2(100) not null,
	start_time varchar2(100) not null,
	end_time varchar2(100) not null,
	CONSTRAINT ko_member_restaurant primary key(id,res_no),
	CONSTRAINT fk_ko_restaurant_id foreign key(id) references ko_member(id) on delete cascade
)

--레스토랑
insert into ko_restaurant(res_no,id,res_name,res_info,res_tel,res_loc,res_image,food_type,start_time,end_time)
values(ko_restaurant_no_seq.nextval,'KDG','김가네','분식집소개','031-123','오리','경로','한식','9','22');
insert into ko_restaurant(res_no,id,res_name,res_info,res_tel,res_loc,res_image,food_type,start_time,end_time)
values(ko_restaurant_no_seq.nextval,'JJH','맥도날드','햄버거소개','02-123','서울','경로','양식','12','19');
insert into ko_restaurant(res_no,id,res_name,res_info,res_tel,res_loc,res_image,food_type,start_time,end_time)
values(ko_restaurant_no_seq.nextval,'BKS','짬뽕집','중식소개','051-777','부산','경로','중식','11','18');
insert into ko_restaurant(res_no,id,res_name,res_info,res_tel,res_loc,res_image,food_type,start_time,end_time)
values(ko_restaurant_no_seq.nextval,'KJS','미정국수','국수집소개','031-222','동탄','경로','한식','10','20');
insert into ko_restaurant(res_no,id,res_name,res_info,res_tel,res_loc,res_image,food_type,start_time,end_time)
values(ko_restaurant_no_seq.nextval,'JYJ','고앤스시','스시소개','033-445','강릉','경로','일식','13','17');

select b.no,b.title,b.content,b.id 
from (select row_number() over(order by no desc) as rnum,
no,title,content,id from star_board) b, ko_member m
where b.id=m.id and b.rnum between #{getStartRowNumber} and #{getEndRowNumber}
 		
select * from ko_restaurant