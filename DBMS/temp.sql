create table authors(authorid char(5) primary key,
firstname varchar(50),
surname varchar(50));

desc authors;

insert into authors values ('A1', 'Yann', 'Martel');
insert into authors values ('A2', 'Jack', 'London');
insert into authors values ('A3', 'Tonni', 'Morisson');
insert into authors values ('A4', 'Josh', 'Malerman');
insert into authors values ('A5', 'Shirley', 'Jackson');
insert into authors values ('A6', 'Michelle', 'Obama');
insert into authors values ('A7', 'Jeannette', 'Walls');

create table types(
typeid char primary key,
name_ varchar(50)
);

desc types;

insert into types values ('T1', 'Adventure');
insert into types values ('T2', 'Classic');
insert into types values ('T3', 'Horror');
insert into types values ('T4', 'Memoir');
insert into types values ('T5', 'Novel');

create table books(
bookid char primary key,
name_ varchar(50),
pagecount int,
point_ int,
authorid char,
foreign key(authorid) references authors,
typeid char,
foreign key(typeid) references types
);

desc books;

insert into books values ('B1', 'Becoming', 500, 5, 'A6', 'T4');
insert into books values ('B2', 'Beloved', 560, 3, 'A3', 'T2');
insert into books values ('B3', 'Martin Eden', 750, 2, 'A2', 'T4');
insert into books values ('B4', 'Bird box', 780, 1, 'A4', 'T3');
insert into books values ('B5', 'Life of pi', 680, 5, 'A1', 'T1');
insert into books values ('B6', 'The haunting of hill house', 480, 3, 'A5', 'T3');
insert into books values ('B7', 'The call of the wild', 720, 3, 'A2', 'T1');
insert into books values ('B8', 'The glass castle', 900, 2, 'A7', 'T4');
insert into books values ('B9', 'Self', 980, 4, 'A1', 'T5');
insert into books values ('B10', 'The bluest eye', 400, 4, 'A3', 'T5');
insert into books values ('B11', 'Afterwards', 650, 5, 'A7', 'T3');
insert into books values ('B12', 'The Scarlet Plague', 600, 1, 'A7', 'T2');
insert into books values ('B13', 'The lottery', 750, 4, 'A5', 'T3');

create table students(
studentid int primary key,
firstname varchar(50),
surname varchar(50),
birthdate date,
gender char,
class_ char(3),
point_ int 
);

desc students;

insert into students values (101, 'John', 'Smith', date '2005-03-27', 'M', 'CSE', 12);
insert into students values (102, 'Shyam', 'Sundar', date '1997-08-23', 'M', 'DS', 13);
insert into students values (103, 'Teena', 'Sundar', date '1996-01-29', 'F', 'DS', 15);
insert into students values (104, 'Ram', 'Shankar', date '1991-11-25', 'M', 'CSE', 2);
insert into students values (105, 'Priya', 'David', date '2005-08-27', 'F', 'CSE', 10);

create table borrows(
borrowid int primary key,
studentid int,
foreign key(studentid) references students,
bookid char,
foreign key(bookid) references books,
takendate date,
broughtdate date
);

desc borrows;

insert into borrows values (1001, 103, 'B1', date '2021-12-12', date '2022-01-12');
insert into borrows values (1002, 101, 'B4', date '2021-01-29', date '2021-02-27');
insert into borrows values (1003, 102, 'B6', date '2021-01-14', date '2021-02-14');
insert into borrows values (1004, 105, 'B7', date '2021-04-29', date '2021-05-29');
insert into borrows values (1005, 104, 'B12', date '2021-12-01', date '2022-01-02');
insert into borrows values (1006, 102, 'B10', date '2021-08-21', date '2021-09-21');
insert into borrows values (1007, 103, 'B10', date '2021-03-14', date '2021-04-14');
insert into borrows values (1008, 103, 'B11', date '2021-08-23', date '2021-09-23');
insert into borrows values (1009, 104, 'B5', date '2021-01-29', date '2021-02-27');
insert into borrows values (1010, 105, 'B3', date '2021-11-25', date '2021-12-26');

select * from students where surname like 'S%' order by birthdate asc;

select books.name_, books.point_, authors.firstname, authors.surname 
from books inner join authors 
on books.authorid = authors.authorid 
where point_ > 3;

select count( distinct borrows.studentid) 
from borrows
where takendate between date '2021-01-15' and date '2021-05-01';



select * from students where (class_ = 'DS' or point_ < 10);

select books.name_, authors.firstname, authors.surname, types.name_
from ((books
inner join authors on books.authorid = authors.authorid)
inner join types on books.typeid = types.typeid);