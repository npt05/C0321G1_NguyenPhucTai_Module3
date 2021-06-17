USE QuanLySinhVien;

select * from subject where credit = (select max(credit) from subject);

select subject.*
from subject
join mark on mark.sub_id = subject.sub_id
where mark = (select max(mark) from mark);
 
select student.*,mark,avg(mark)
from student
join mark on mark.student_Id = student.student_Id
group by student.student_Id
order by mark desc;