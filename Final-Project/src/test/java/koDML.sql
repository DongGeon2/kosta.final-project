--회원
insert into ko_member(id,password,email,name,tel) values('KDG','1','rlagjqm1@naver.com','김동건','0101');
insert into ko_member(id,password,email,name,tel) values('JJH','1','J@naver.com','장지훈','0102');
insert into ko_member(id,password,email,name,tel) values('BKS','1','B@naver.com','백경성','0103');
insert into ko_member(id,password,email,name,tel) values('KJS','1','S@naver.com','김진솔','0104');
insert into ko_member(id,password,email,name,tel) values('JYJ','1','Y@naver.com','정예진','0105');

select * from ko_member

select * from KO_AUTHORITIES

insert into ko_authorities(id,authority) values('1234',#{authority})
--예진 사장 식당 등록 test
insert into ko_member(id,password,email,name,tel) values('aaaas','a','Y@naver.com','정예진','0105');
insert into ko_authorities(id,authority) values('1234','ROLE_OWNER');

--권한
insert into ko_authorities(id,authority) values('java','ROLE_ADMIN');
insert into ko_authorities(id,authority) values('java','ROLE_OWNER');
insert into ko_authorities(id,authority) values('양양크랩','ROLE_OWNER');
insert into ko_authorities(id,authority) values('h541_owner','ROLE_OWNER');
insert into ko_authorities(id,authority) values('aaaas','ROLE_MEMBER');
insert into ko_authorities(id,authority) values('BKS','ROLE_MEMBER');
insert into ko_authorities(id,authority) values('JYJ','ROLE_MEMBER');

insert into ko_authorities(id,authority) values('java','ROLE_ADMIN');


--권한 추가해야할것.
insert into ko_authorities(id,authority) values('owner','ROLE_OWNER');
insert into ko_authorities(id,authority) values('KDG','ROLE_MEMBER');
insert into ko_authorities(id,authority) values('KJS','ROLE_MEMBER');

select * from ko_authorities



--레스토랑
insert into ko_restaurant(res_no,id,res_name,res_info,res_tel,res_loc,res_image,food_type,end_time,start_time)
values(ko_restaurant_no_seq.nextval,'KDG','김가네','분식집소개','031-123','오리','경로','한식','22','9');
insert into ko_restaurant(res_no,id,res_name,res_info,res_tel,res_loc,res_image,food_type,end_time,start_time)
values(ko_restaurant_no_seq.nextval,'KJS','미정국수','국수집소개','031-222','동탄','경로','한식','20','10');
insert into ko_restaurant(res_no,id,res_name,res_info,res_tel,res_loc,res_image,food_type,end_time,start_time)
values(ko_restaurant_no_seq.nextval,'KJS','맥도날드','햄버거소개','02-123','서울','경로','양식','19','12');
insert into ko_restaurant(res_no,id,res_name,res_info,res_tel,res_loc,res_image,food_type,end_time,start_time)
values(ko_restaurant_no_seq.nextval,'KJS','짬뽕집','중식소개','051-777','부산','경로','중식','18','11');
insert into ko_restaurant(res_no,id,res_name,res_info,res_tel,res_loc,res_image,food_type,end_time,start_time)
values(ko_restaurant_no_seq.nextval,'KDG','고앤스시','스시소개','033-445','강릉','경로','일식','17','13');

insert into ko_restaurant(res_no,id,res_name,res_info,res_tel,res_loc,res_image,food_type,end_time,start_time)
values(ko_restaurant_no_seq.nextval,'BKS','홍콩반점','중식소개','031-445','구리','경로','중식','20','11');

insert into ko_restaurant(res_no,id,res_name,res_info,res_tel,res_loc,res_image,food_type,end_time,start_time)
values(ko_restaurant_no_seq.nextval,'BKS','쓰리팝','라면소개','031-234','구리','경로','분식','23','9');

	SELECT res_no,res_name,res_info,res_tel,res_loc,res_image,food_type
	FROM ko_restaurant 
	WHERE res_name LIKE '%김가%';

select b.no,b.title,b.content,b.id 
from (select row_number() over(order by no desc) as rnum,
no,title,content,id from star_board) b, ko_member m
where b.id=m.id and b.rnum between #{getStartRowNumber} and #{getEndRowNumber}
 		
--------------------------------------------------------동건
select * from ko_restaurant
select * from ko_review where id='1234'
	
select b.res_name, a.review_title, a.id, a.review_regdate
from ko_review a, ko_restaurant b
where  a.res_no = b.res_no and a.id='1234'
 
select a.rev_no, b.res_name, a.id, a.rev_headcount, a.rev_time 
FROM KO_RESERVATION a, KO_RESTAURANT b
where  a.res_no=b.res_no  AND a.id='1234'

select * 
from ko_review a, ko_restaurant b
where a.res_no=b.res_no and b.res_no=3
		
delete from ko_review where review_grade='4'

		select r.res_no,r.res_name,r.res_info,r.res_tel,r.res_loc,r.res_image,r.food_type,
		r.end_time,r.start_time,m.id,m.password,m.email,m.name,m.tel,m.enabled
		from 
			(select row_number() over(order by res_no desc) as rnum, id, res_no,
			res_name,res_info,res_tel,res_loc,res_image,food_type,end_time,start_time
			from ko_restaurant) r, ko_member m 
		where r.id=m.id and rnum between 1 and 5
--------------------------------------------------------------------	

SELECT board_no,title,hits,time_posted,id
FROM ko_board 
WHERE id='1234'
--------------------------------------------------------------------
SELECT * FROM KO_MY_PICK

SELECT r.res_no, r.res_image, r.res_name, p.id, r.res_loc,r.start_time,r.end_time
FROM ko_my_pick p, ko_restaurant r 
WHERE p.res_no=r.res_no AND p.id='1234'

select * from ko_reservation
select * from ko_reservation_record
delete from ko_reservation
where rev_no='7' cascade constraint