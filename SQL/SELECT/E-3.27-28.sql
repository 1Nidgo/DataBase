--[��3.27]��ѯ�������ѧϵ��CS������ѧϵ��MA������Ϣϵ��IS��ѧ�����������Ա�
SELECT Sname, Ssex
FROM  Student
WHERE Sdept IN ('CS','MA','IS');

--[��3.28]��ѯ�Ȳ��Ǽ������ѧϵ����ѧϵ��Ҳ������Ϣϵ��ѧ�����������Ա�
SELECT Sname, Ssex
FROM Student
WHERE Sdept NOT IN ('IS','MA','CS');