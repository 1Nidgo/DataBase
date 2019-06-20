--Edit by David @ HeBei University 2019

DROP DATABASE IF EXISTS curricula_variable_system;  

CREATE DATABASE curricula_variable_system;  

USE curricula_variable_system;

DROP TABLE IF EXISTS SC
DROP TABLE IF EXISTS Student
DROP TABLE IF EXISTS Course
DROP TABLE IF EXISTS SysUser
DROP TABLE IF EXISTS SysLog

CREATE TABLE SysUser          
 (	
 UserID NCHAR(20) PRIMARY KEY,                          
 UserPassWord NCHAR(32) ,             
 UserSchoolID NCHAR(20),
 UserMobile NCHAR(11),
 UserBirthday datetime,
 UserIdentity NCHAR(20),
 UserPhoto image
 ); 


 CREATE TABLE SysLog          
 (	
 UserID NCHAR(20) ,                          
 DateAndTime datetime,
 UserOperation NCHAR(200)
 ); 

CREATE TABLE Student          
 (	
 Sno CHAR(9) PRIMARY KEY,        /* �м�������Լ������,Sno������*/                  
 Sname CHAR(20) UNIQUE,             /* SnameȡΨһֵ*/
 Ssex CHAR(2),
 Sage SMALLINT,
 Sdept CHAR(20)
 ); 

CREATE TABLE  Course
 (	
 Cno CHAR(4) PRIMARY KEY,
 Cname CHAR(40),            
 Cpno CHAR(4),               	                      
 Ccredit SMALLINT,
 FOREIGN KEY (Cpno) REFERENCES  Course(Cno) 
 ); 

CREATE TABLE  SC
 (
 Sno CHAR(9), 
 Cno CHAR(4),  
 Grade SMALLINT,
 PRIMARY KEY (Sno,Cno),                     /* �������������Թ��ɣ�������Ϊ�������Խ��ж���*/
 FOREIGN KEY (Sno) REFERENCES Student(Sno),  /* ��������Լ��������Sno�����룬�����ձ���Student */
 FOREIGN KEY (Cno)REFERENCES Course(Cno)     /* ��������Լ�������� Cno�����룬�����ձ���Course*/
 ); 

INSERT  INTO  SysUser VALUES ('admin','123','000','13812345678',1999-1-1,'0',NULL);

INSERT  INTO  Student (Sno,Sname,Ssex,Sdept,Sage) VALUES ('201215121','����','��','CS',20);
INSERT  INTO  Student (Sno,Sname,Ssex,Sdept,Sage) VALUES ('201215122','����','Ů','CS',19);
INSERT  INTO  Student (Sno,Sname,Ssex,Sdept,Sage) VALUES ('201215123','����','Ů','MA',18);
INSERT  INTO  Student (Sno,Sname,Ssex,Sdept,Sage) VALUES ('201215125','����','��','IS',19);
INSERT  INTO  Student (Sno,Sname,Ssex,Sdept,Sage) VALUES ('201215128','�¶�','��','IS',20);

SELECT * FROM Student

INSERT  INTO Course(Cno,Cname,Cpno,Ccredit)	VALUES ('1','���ݿ�',NULL,4);
INSERT  INTO Course(Cno,Cname,Cpno,Ccredit)	VALUES ('2','��ѧ',NULL,4);
INSERT  INTO Course(Cno,Cname,Cpno,Ccredit)	VALUES ('3','��Ϣϵͳ',NULL,4);
INSERT  INTO Course(Cno,Cname,Cpno,Ccredit)	VALUES ('4','����ϵͳ',NULL,4);
INSERT  INTO Course(Cno,Cname,Cpno,Ccredit)	VALUES ('5','���ݽṹ',NULL,4);
INSERT  INTO Course(Cno,Cname,Cpno,Ccredit)	VALUES ('6','���ݴ���',NULL,4);
INSERT  INTO Course(Cno,Cname,Cpno,Ccredit)	VALUES ('7','Pascal����',NULL,4);

UPDATE Course SET Cpno = '5' WHERE Cno = '1' 
UPDATE Course SET Cpno = '1' WHERE Cno = '3' 
UPDATE Course SET Cpno = '6' WHERE Cno = '4' 
UPDATE Course SET Cpno = '7' WHERE Cno = '5' 
UPDATE Course SET Cpno = '6' WHERE Cno = '7' 

SELECT * FROM Course

INSERT  INTO SC(Sno,Cno,Grade) VALUES ('201215121 ','1',92);
INSERT  INTO SC(Sno,Cno,Grade) VALUES ('201215121 ','2',85);
INSERT  INTO SC(Sno,Cno,Grade) VALUES ('201215121 ','3',88);
INSERT  INTO SC(Sno,Cno,Grade) VALUES ('201215122 ','2',90);
INSERT  INTO SC(Sno,Cno,Grade) VALUES ('201215122 ','3',80);

SELECT * FROM SC



IF(OBJECT_ID('regist_recorder') is not null)        -- �ж���Ϊ regist_recorder �Ĵ������Ƿ����
DROP TRIGGER regist_recorder        -- ɾ��������
GO

CREATE TRIGGER regist_recorder
ON SysUser  	         
AFTER
INSERT
AS 
	declare @UserName    nchar(20)
	declare @DateTime    datetime
	declare @UserOperation nchar(200)

	select @UserName = system_user
	select @DateTime = CONVERT(datetime,GETDATE(),120) 

	declare @op varchar(10)
	select @op=case when exists(select 1 from inserted) and exists(select 1 from deleted)
                   then 'Update'
                   when exists(select 1 from inserted) and not exists(select 1 from deleted)
                   then 'Insert'
                   when not exists(select 1 from inserted) and exists(select 1 from deleted)
                   then 'Delete' end
                   
	
	select @UserOperation = @op
	

	INSERT INTO SysLog(UserID,DateAndTime,UserOperation)
	VALUES (@UserName,@DateTime,@UserOperation)

