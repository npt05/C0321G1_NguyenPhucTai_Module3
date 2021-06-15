USE QuanLySinhVien;

select * from subject where Credit = (select max(Credit) from subject);

select subject.*
from subject
join Mark on mark.Sub_id = subject.Sub_id
where Mark = (select max(Mark) from Mark);
 
select Student.*,Mark,avg(Mark)
from Student
join Mark on Mark.Student_Id = Student.Student_Id
group by Student.Student_Id
order by Mark desc;