-- 본인의 이름 주석으로 작성 예)홍길동
# 백새로미

 -- 계정생성 쿼리문
# 계정명: book, 비번: book, 모든곳에서 접근가능한 계정을 생성합니다.
create user 'book'@'%' identified by 'book';

-- 권한설정 쿼리문
# book_db데이터베이스의 book계정이 모든테이블에 모든 권한을 부여받습니다.
grant all privileges on book_db.* to 'book'@'%' ;

-- book_db 데이터베이스 생성 쿼리문
create database book_db
default character set utf8mb4
collate utf8mb4_general_ci
default encryption='n';

-- 테이블 생성 쿼리문 2개
# 컬럼명은 문제 이미지를 참고합니다. # 각각의 테이블의 pk컬럼은 자동증가 기능을 사용합니다
# author_id 는 pk, fk 관계입니다.
create table author(
				author_id int	auto_increment  primary key,
				author_name varchar(100),
				author_desc varchar(100)
);
create table book(
				book_id	 	int		auto_increment  primary key,
				title 	 	varchar(100),
				pubs	 	varchar(100),
				pub_date 	varchar(50),
                author_id 	int	,
				constraint book_fk foreign key (author_id)
				references author(author_id)
);

-- author테이블 데이터 입력 쿼리문 6개
# 문제 이미지의 결과가 나오도록 데이터를 입력합니다.
insert into author
values(null,'이문열','경북 영양');
insert into author
values(null,'박경리','경상남도 통영');
insert into author
values(null,'유시민','17대 국회의원');
insert into author
values(null,'기안84','기안동에서 산 84년생');
insert into author
values(null,'강풀','온라인 만화가 1세대');
insert into author
values(null,'김영하','알쓸신잡');

-- book테이블의 데이터 입력 쿼리문 9개
# 문제 이미지의 결과가 나오도록 데이터를 입력합니다.
insert into book(book_id, title, pubs, pub_date, author_id)
values(null,'우리들의 일그러진 영웅','다림','1998년 02월 22일',1);
insert into book(book_id, title, pubs, pub_date, author_id)
values(null,'삼국지','민음사','2002년 03월 01일',1);
insert into book(book_id, title, pubs, pub_date, author_id)
values(null,'토지','마로니에북스','2012년 08월 15일',2);
insert into book(book_id, title, pubs, pub_date, author_id)
values(null,'유시민의 글쓰기 틀강','생각의길','2015년 04월 01일',3);
insert into book(book_id, title, pubs, pub_date, author_id)
values(null,'패션왕','중앙북스(books)','2012년 02월 22일',4);
insert into book(book_id, title, pubs, pub_date, author_id)
values(null,'순정만화','재미주의','2011년 08월 03일', 5);
insert into book(book_id, title, pubs, pub_date, author_id)
values(null,'오직두사람','문학동네','2017년 05월 04일',6);
insert into book(book_id, title, pubs, pub_date, author_id)
values(null,'26년','재미주의','2012년 02월 04일',5);
insert into book(book_id, title, pubs, pub_date, author_id)
values (null,'자바의정석','열린책들','2015년 10월 20일',null);

select *
from book;

-- 아래의 조건에 맞는 책목록 리스트 쿼리문 1개
/*
(1)등록된 모든 책이 출력되어야 합니다.(9권)
(2)출판일은 ‘1998년 02월 02일’ 형태로 보여야 합니다. (3)정렬은 책 제목을 내림차순으로 정렬합니다. */

select pub_date,
date_format(pub_date, '%Y년%m월%일')
from book;


select *
from book b
left outer join author a
on b.author_id = a.author_id
order by title desc;


#2) book_list.jpg -- 최종결과화면을 캡쳐합니다. 
#산출물. 아래 2개의 산출물을 이름.zip 파일로 압축해서 제출합니다. 
#book_test.sql
#book_list.jp