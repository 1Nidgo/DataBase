create view View_Stu_1
as
select Sno,Sname,Ssex,Sage,Sdept
from Student
where Sdept='IS'

go

create view View_Stu_2
as
select Sno,Sname,Ssex,Sage,Sdept
from Student
where Sdept='IS'
with check option;

go

insert into View_Stu_1(Sno,Sname,Ssex,Sage)--��With check option: Sdept���Զ�����Null
values ('95007111','����11','F','19')

insert into View_Stu_2(Sno,Sname,Ssex,Sage,Sdept) --��With check option: ���û��Sdept�ᱨ�����ܹ�ΪSdept�Զ�����IS��
values ('950072','����','F','19','IS')

select * from Student
select * from View_Stu_1
select * from View_Stu_2