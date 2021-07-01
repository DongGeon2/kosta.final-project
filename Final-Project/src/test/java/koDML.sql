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

select * from ko_authorities


--레스토랑
insert into ko_restaurant(res_no,res_name,res_info,res_tel,res_loc,res_image,food_type,end_time,start_time)
values(ko_restaurant_no_seq.nextval,'김가네','분식집소개','031-123','오리','경로','한식','22','9');
insert into ko_restaurant(res_no,res_name,res_info,res_tel,res_loc,res_image,food_type,end_time,start_time)
values(ko_restaurant_no_seq.nextval,'미정국수','국수집소개','031-222','동탄','경로','한식','20','10');
insert into ko_restaurant(res_no,res_name,res_info,res_tel,res_loc,res_image,food_type,end_time,start_time)
values(ko_restaurant_no_seq.nextval,'맥도날드','햄버거소개','02-123','서울','경로','양식','19','12');
insert into ko_restaurant(res_no,res_name,res_info,res_tel,res_loc,res_image,food_type,end_time,start_time)
values(ko_restaurant_no_seq.nextval,'짬뽕집','중식소개','051-777','부산','경로','중식','18','11');
insert into ko_restaurant(res_no,res_name,res_info,res_tel,res_loc,res_image,food_type,end_time,start_time)
values(ko_restaurant_no_seq.nextval,'고앤스시','스시소개','033-445','강릉','경로','일식','17','13');

select * from ko_restaurant