
--[��3.36]  ĳЩѧ��ѡ�޿γ̺�û�вμӿ��ԣ�������ѡ�μ�¼����û �п��Գɼ�����ѯȱ�ٳɼ���ѧ����ѧ�ź���Ӧ�Ŀγ̺š�
	  SELECT Sno,Cno
      FROM    SC
      WHERE  Grade IS NULL
--[��3.37]  �������гɼ���ѧ��ѧ�źͿγ̺š�
      SELECT Sno,Cno
      FROM     SC
      WHERE  Grade IS NOT NULL;
--[��3.38]  ��ѯ�����ϵ������20�����µ�ѧ��������
      SELECT Sname
       FROM  Student
       WHERE Sdept= 'CS' AND Sage<20;

--��д[��3.27]
--[��3.27]  ��ѯ�������ѧϵ��CS������ѧϵ��MA������Ϣϵ��IS��ѧ�����������Ա�
SELECT Sname, Ssex
FROM     Student
WHERE  Sdept IN ('CS ','MA ','IS');
--�ɸ�дΪ��
SELECT Sname, Ssex
FROM     Student
WHERE  Sdept= ' CS' OR Sdept= ' MA' OR Sdept= 'IS ';




