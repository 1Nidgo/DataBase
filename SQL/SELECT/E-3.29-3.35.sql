--[��3.29]  ��ѯѧ��Ϊ201215121��ѧ������ϸ�����
      SELECT *    
     FROM  Student  
     WHERE  Sno LIKE '201215121';

--�ȼ��ڣ� 
       SELECT  * 
      FROM  Student 
      WHERE Sno = ' 201215121 ';

--[��3.30]  ��ѯ��������ѧ����������ѧ�ź��Ա�
       SELECT Sname, Sno, Ssex
      FROM Student
      WHERE  Sname LIKE '��%';

--[��3.31]  ��ѯ��"ŷ��"��ȫ��Ϊ�������ֵ�ѧ����������
       SELECT Sname
      FROM   Student
      WHERE  Sname LIKE 'ŷ��_ _';
--��ע�����ݿ��ַ���ΪASCIIʱ��һ��������Ҫ����_
--      ���ݿ��ַ���Ϊ GBK ʱ��һ��������Ҫһ��_

--[��3.32]  ��ѯ�����е�2����Ϊ"��"�ֵ�ѧ����������ѧ�š�
      SELECT Sname,Sno
      FROM     Student
      WHERE  Sname LIKE '_ _��%';

--[��3.33]  ��ѯ���в�������ѧ��������ѧ�ź��Ա�
      SELECT Sname, Sno, Ssex
      FROM     Student
      WHERE  Sname NOT LIKE '��%';
	  --[��3.34]  ��ѯDB_Design�γ̵Ŀγ̺ź�ѧ�֡�
      SELECT Cno,Ccredit
      FROM     Course
      WHERE  Cname LIKE 'DB\_Design' ESCAPE '\' ;
--[��3.35]  ��ѯ��"DB_"��ͷ���ҵ�����3���ַ�Ϊ i�Ŀγ̵���ϸ�����
      SELECT  *
      FROM    Course
      WHERE  Cname LIKE  'DB\_%i__' ESCAPE '\' ;
	
	--ESCAPE '��' ��ʾ�� �ܡ� Ϊ�����ַ�