--[��3.22] ��ѯ�������ѧϵȫ��ѧ����������
SELECT Sname
FROM     Student
WHERE  Sdept='CS'; 

--[��3.23]��ѯ����������20�����µ�ѧ�������������䡣
SELECT Sname,Sage 
FROM     Student    
WHERE  Sage < 20;

--[��3.24]��ѯ���Գɼ��в������ѧ����ѧ�š�
SELECT DISTINCT Sno
FROM  SC
WHERE Grade<60; 
