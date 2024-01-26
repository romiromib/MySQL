-- author 테이블
create table author(
					author_id   int   		auto_increment  primary key,
                    author_name varchar(100) 				not null,
                    author_desc varchar(500)
);
-- book 테이블
create table book(
					book_id    int          auto_increment primary key,
                    title      varchar(100)  not null,
                    pubs       varchar(100),
                    pub_date   datetime,
                    author_id  int,
                    constraint book_fk foreign key (author_id)
                    references author(author_id)
);
alter table book modify book_id int auto_increment primary key;-- ??????/???

-- author 데이터 입력
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

-- book 데이터 입력
insert into book
values(null,'우리들의 일그러진 영웅','다림','1998-02-22',1);
insert into book
values(2,'삼국지','민음사','2002-03-01',1);
insert into book
values(null,'토지','마로니에북스','2012-08-15',2);
insert into book
values(null,'유시민의 글쓰기 틀강','생각의길','2015-04-01',3);
insert into book
values(null,'패션왕','중앙북스(books)','2012-02-22',4);
insert into book
values(null,'순정만화','재미주의','2011-08-03', 5);
insert into book
values(null,'오직두사람','문학동네','2017-05-04',6);
insert into book
values(null,'26년','재미주의','2012-02-04',5);

delete from book
where book_id = 8;

drop table author;
drop table book;

select*
from book;