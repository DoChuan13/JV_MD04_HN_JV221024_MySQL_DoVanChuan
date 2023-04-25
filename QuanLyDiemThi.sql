# 1. Create Database and Tables
create database if not exists QUANLYDIEMTHI;

use QUANLYDIEMTHI;

create table if not exists QUANLYDIEMTHI.STUDENT
(
    studentId   varchar(4) primary key not null,
    studentName varchar(100)           not null,
    birthday    date                   not null,
    gender      bit(1)                 not null,
    address     text                   not null,
    phoneNumber varchar(45) unique
);

create table if not exists QUANLYDIEMTHI.SUBJECT
(
    subjectId   varchar(4) primary key not null,
    subjectName varchar(45)            not null,
    priority    int(11)                not null
);

create table if not exists QUANLYDIEMTHI.MARK
(
    subjectId varchar(4) not null,
    studentId varchar(4) not null,
    point     int(11)    not null,
    primary key (subjectId, studentId),
    constraint fk_Mark_subjectId foreign key (subjectId) references SUBJECT (subjectId),
    constraint fk_Mark_studentId foreign key (studentId) references STUDENT (studentId)
);

alter table QUANLYDIEMTHI.MARK
    modify column point float not null;


# 2. CRUD
# 2.1 Insert Values
insert into `STUDENT` (studentId, studentName, birthday, gender, address, phoneNumber)
values ('S001', 'Nguyễn Thế Anh', '1999/1/11', 1, 'Hà Nội', '984678082'),
       ('S002', 'Đặng Bảo Trậm', '1998/12/22', 0, 'Lào Cai', '904982654'),
       ('S003', 'Trần Hà Phương', '2000/5/5', 0, 'Nghệ An', '947645363'),
       ('S004', 'Đỗ Tiến Mạnh', '1999/3/26', 1, 'Hà Nội', '983665353'),
       ('S005', 'Phạm Duy Nhất', '1998/10/4', 1, 'Tuyên Quang', '987242678'),
       ('S006', 'Mai Văn Thái', '2002/6/22', 1, 'Nam Định', '982654268'),
       ('S007', 'Giang Gia Hân', '1996/11/10', 0, 'Phú Thọ', '982364753'),
       ('S008', 'Nguyễn Ngọc Bảo My', '1999/1/22', 0, 'Hà Nam', '927867453'),
       ('S009', 'Nguyễn Tiến Đạt', '1998/8/7', 1, 'Tuyên Quang', '989274673'),
       ('S010', 'Nguyễn Thiều Quang', '2000/9/18', 1, 'Hà Nội', '984378291');

insert into `SUBJECT` (subjectId, subjectName, priority)
values ('MH01', 'Toán', 2),
       ('MH02', 'Vật Lý', 2),
       ('MH03', 'Hoá Học', 1),
       ('MH04', 'Ngữ Văn', 1),
       ('MH05', 'Tiếng Anh', 2);

insert into `MARK` (subjectId, studentId, point)
values ('MH01', 'S001', 8.5),
       ('MH02', 'S001', 7),
       ('MH03', 'S001', 9),
       ('MH04', 'S001', 9),
       ('MH05', 'S001', 5),

       ('MH01', 'S002', 9),
       ('MH02', 'S002', 8),
       ('MH03', 'S002', 6.5),
       ('MH04', 'S002', 8),
       ('MH05', 'S002', 6),

       ('MH01', 'S003', 7.5),
       ('MH02', 'S003', 6.5),
       ('MH03', 'S003', 8),
       ('MH04', 'S003', 7),
       ('MH05', 'S003', 7),

       ('MH01', 'S004', 6),
       ('MH02', 'S004', 7),
       ('MH03', 'S004', 5),
       ('MH04', 'S004', 6.5),
       ('MH05', 'S004', 8),

       ('MH01', 'S005', 5.5),
       ('MH02', 'S005', 8),
       ('MH03', 'S005', 7.5),
       ('MH04', 'S005', 8.5),
       ('MH05', 'S005', 9),

       ('MH01', 'S006', 8),
       ('MH02', 'S006', 10),
       ('MH03', 'S006', 9),
       ('MH04', 'S006', 7.5),
       ('MH05', 'S006', 6.5),

       ('MH01', 'S007', 9.5),
       ('MH02', 'S007', 9),
       ('MH03', 'S007', 6),
       ('MH04', 'S007', 9),
       ('MH05', 'S007', 4),

       ('MH01', 'S008', 10),
       ('MH02', 'S008', 8.5),
       ('MH03', 'S008', 8.5),
       ('MH04', 'S008', 6),
       ('MH05', 'S008', 9.5),

       ('MH01', 'S009', 7.5),
       ('MH02', 'S009', 7),
       ('MH03', 'S009', 9),
       ('MH04', 'S009', 5),
       ('MH05', 'S009', 10),

       ('MH01', 'S010', 6.5),
       ('MH02', 'S010', 8),
       ('MH03', 'S010', 5.5),
       ('MH04', 'S010', 4),
       ('MH05', 'S010', 7);

# 2.2 Update Value
update QUANLYDIEMTHI.STUDENT
set studentName = 'Đỗ Đức Mạnh'
where studentId = 'S004';

update QUANLYDIEMTHI.SUBJECT
set subjectName = 'Ngoại Ngữ',
    priority    = 1
where subjectId = 'MH05';

update QUANLYDIEMTHI.MARK
set point = 8.5
where studentId = 'S009'
  and subjectId = 'MH01';

update QUANLYDIEMTHI.MARK
set point = 7
where studentId = 'S009'
  and subjectId = 'MH02';

update QUANLYDIEMTHI.MARK
set point = 5.5
where studentId = 'S009'
  and subjectId = 'MH03';

update QUANLYDIEMTHI.MARK
set point = 6
where studentId = 'S009'
  and subjectId = 'MH04';

update QUANLYDIEMTHI.MARK
set point = 9
where studentId = 'S009'
  and subjectId = 'MH05';

# 2.3 Delete Value Student
delete
from QUANLYDIEMTHI.MARK
where studentID = 'S010';

delete
from QUANLYDIEMTHI.STUDENT
where studentId = 'S010';

# 3. Data Query
# 3.1 Show Student List
select *
from QUANLYDIEMTHI.STUDENT;

# 3.2 Show Subject List - 1
select subjectId, subjectName
from SUBJECT
where priority = 1;

# 3.3 Show Student Info
select studentId, studentName, (year(now()) - year(birthday)) as age, if(gender = 1, 'Nam', 'Nữ') as gender, address
from STUDENT;

# 3.4 Show Student with Subject and Point (Math)
select ST.studentName, S.subjectName, M.point
from STUDENT ST
         join QUANLYDIEMTHI.MARK M on ST.studentId = M.studentId
         join QUANLYDIEMTHI.SUBJECT S on M.subjectId = S.subjectId
where S.subjectName = 'Toán'
order by M.point desc;

# 3.5 Show Gender and Count
select if(gender = 1, 'Nam', 'Nữ') as gender, count(*) as count
from STUDENT
group by gender;

# 3.6 Average Point
select ST.studentId as studentID, ST.studentName as studentName, sum(M.point) as Total, avg(M.point) as Avegare
from STUDENT ST
         join QUANLYDIEMTHI.MARK M on ST.studentId = M.studentId
group by ST.studentId;

# 4
# 4.1 STUDENT_VIEW
create view STUDENT_VIEW as
select studentId, studentName, if(gender = 1, 'Nam', 'Nữ') as gender, address
from STUDENT;

select *
from STUDENT_VIEW;

# 4.2 AVERAGE_MARK_VIEW
create view AVERAGE_MARK_VIEW as
select ST.studentId as studentID, ST.studentName as studentName, avg(M.point) as Avegare
from STUDENT ST
         join QUANLYDIEMTHI.MARK M on ST.studentId = M.studentId
group by ST.studentId;

select *
from AVERAGE_MARK_VIEW;

# 4.3 Add INDEX
alter table STUDENT
    add index idx_phoneNumber (phoneNumber);

# 4.4 PROC_INSERTSTUDENT
delimiter
//
-- Create the Procedure called 'PROC_INSERTSTUDENT()'"
create procedure PROC_INSERTSTUDENT(
    in studentId varchar(4), studentName varchar(100), birthday date, gender bit(1), address text,
    phoneNumber varchar(45)
)
begin
    -- Content for Procedure 'PROC_INSERTSTUDENT()' in here
    insert into STUDENT
    values (studentId, studentName, birthday, gender, address, phoneNumber);
end;
//
delimiter ;

