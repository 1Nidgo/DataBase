--[��3.25] ��ѯ������20~23�꣨����20���23�֮꣩���ѧ����������ϵ�������
SELECT Sname, Sdept, Sage
FROM     Student
WHERE   Sage BETWEEN 20 AND 23; 

--[��3.26]  ��ѯ���䲻��20~23��֮���ѧ��������ϵ�������
SELECT Sname, Sdept, Sage
FROM    Student
WHERE Sage NOT BETWEEN 20 AND 23; 
