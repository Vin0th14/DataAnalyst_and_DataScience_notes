create database stored_procedure;
use stored_procedure;

CREATE TABLE patients(
   patient_id INTEGER  NOT NULL PRIMARY KEY 
  ,name       VARCHAR(6) NOT NULL
  ,age        INTEGER  NOT NULL
  ,gender     VARCHAR(6) NOT NULL
  ,address    VARCHAR(12) NOT NULL
  ,disease    VARCHAR(13) NOT NULL
  ,doctor_id  INTEGER  NOT NULL
);
INSERT INTO patients(patient_id,name,age,gender,address,disease,doctor_id) VALUES (1,'reema',23,'female','althan,Surat','fever',21);
INSERT INTO patients(patient_id,name,age,gender,address,disease,doctor_id) VALUES (2,'kusum',50,'female','vadodara','heart failure',22);
INSERT INTO patients(patient_id,name,age,gender,address,disease,doctor_id) VALUES (3,'carlin',43,'male','vapi','infection',23);
INSERT INTO patients(patient_id,name,age,gender,address,disease,doctor_id) VALUES (4,'rahul',26,'male','navsari','cancer',21);
INSERT INTO patients(patient_id,name,age,gender,address,disease,doctor_id) VALUES (6,'hansha',55,'female','vapi','diabetes',22);

CREATE TABLE doctor(
   doctor_id INTEGER  NOT NULL PRIMARY KEY 
  ,name      VARCHAR(7) NOT NULL
  ,age       INTEGER  NOT NULL
  ,gender    VARCHAR(6) NOT NULL
  ,address   VARCHAR(7) NOT NULL
);
INSERT INTO doctor(doctor_id,name,age,gender,address) VALUES (21,'asif',55,'male','baruch');
INSERT INTO doctor(doctor_id,name,age,gender,address) VALUES (22,'dhawal',40,'male','Surat');
INSERT INTO doctor(doctor_id,name,age,gender,address) VALUES (23,'krishna',39,'female','Surat');
INSERT INTO doctor(doctor_id,name,age,gender,address) VALUES (24,'lissa',35,'female','Navsari');
INSERT INTO doctor(doctor_id,name,age,gender,address) VALUES (25,'leeba',34,'female','baruch');
INSERT INTO doctor(doctor_id,name,age,gender,address) VALUES (26,'vini',33,'female','Surat');
INSERT INTO doctor(doctor_id,name,age,gender,address) VALUES (27,'Dhiren',32,'male','Navsari');

CREATE TABLE laboratory(
   lan_no     INTEGER  NOT NULL PRIMARY KEY 
  ,patient_id INTEGER  NOT NULL
  ,doctor_id  INTEGER  NOT NULL
  ,date       DATE  NOT NULL
  ,amount     INTEGER  NOT NULL
);
INSERT INTO laboratory(lan_no,patient_id,doctor_id,date,amount) VALUES (10,1,21,'2000/2/2',4000);
INSERT INTO laboratory(lan_no,patient_id,doctor_id,date,amount) VALUES (20,2,21,'2001/9/9',300);
INSERT INTO laboratory(lan_no,patient_id,doctor_id,date,amount) VALUES (30,3,22,'2001/3/3',600);
INSERT INTO laboratory(lan_no,patient_id,doctor_id,date,amount) VALUES (40,1,23,'2002/6/2',800);
INSERT INTO laboratory(lan_no,patient_id,doctor_id,date,amount) VALUES (50,4,21,'2003/7/5',900);
INSERT INTO laboratory(lan_no,patient_id,doctor_id,date,amount) VALUES (60,2,25,'2004/4/10',550);
INSERT INTO laboratory(lan_no,patient_id,doctor_id,date,amount) VALUES (70,4,22,'2005/4/3',900);

CREATE TABLE bills(
   bill_no     INTEGER  NOT NULL PRIMARY KEY 
  ,patient_id  INTEGER  NOT NULL
  ,doctor_id   INTEGER  NOT NULL
  ,room_charge INTEGER 
  ,no_of_days  INTEGER  NOT NULL
);
INSERT INTO bills(bill_no,patient_id,doctor_id,room_charge,no_of_days) VALUES (5005,1,340,500,4);
INSERT INTO bills(bill_no,patient_id,doctor_id,room_charge,no_of_days) VALUES (5006,2,600,480,8);
INSERT INTO bills(bill_no,patient_id,doctor_id,room_charge,no_of_days) VALUES (5008,3,800,340,3);
INSERT INTO bills(bill_no,patient_id,doctor_id,room_charge,no_of_days) VALUES (5009,4,780,890,6);
INSERT INTO bills(bill_no,patient_id,doctor_id,room_charge,no_of_days) VALUES (5010,3,400,NULL,1);
INSERT INTO bills(bill_no,patient_id,doctor_id,room_charge,no_of_days) VALUES (5011,1,200,300,1);
INSERT INTO bills(bill_no,patient_id,doctor_id,room_charge,no_of_days) VALUES (5012,2,600,110,2);
INSERT INTO bills(bill_no,patient_id,doctor_id,room_charge,no_of_days) VALUES (5013,3,330,210,1);
INSERT INTO bills(bill_no,patient_id,doctor_id,room_charge,no_of_days) VALUES (5014,1,230,340,2);

select * from patients;
select * from laboratory;
select * from doctor;
select * from bills;

/*=====================================================================================================================================================*/
/*------------------------------------------------------------------------------------------------------------------------------------------------*/
/* Syntax = 
DELIMITER &&
CREATE PROCEDURE procedure_name ([IN | OUT | INOUT] parameter_name
datatype (parameter datatype)) ]
BEGIN
Declaration_section
Executable_section
END &&
DELIMITER ; */

/* IN - accept the parameter as input 
 OUT - pass the parameter as output 
INOUT - combo of in and out and performs stored procedure before out
CALL procedure_name(parameters) - to call stored procedure */

/* IN parameter ---------------------------------------------------------------------------------------------------------------------------*/
DELIMITER &&  
CREATE PROCEDURE females() 
BEGIN  
    SELECT name,gender FROM patients WHERE gender = 'female';  
END &&  
DELIMITER ;  

call females();


DELIMITER &&  
CREATE PROCEDURE in_parameter_1(in n int) 
BEGIN  
    SELECT * FROM doctor order by age desc,name limit n;  
END &&  
DELIMITER ;  

call in_parameter_1(3);

DELIMITER &&  
CREATE PROCEDURE add_patient
(
	 in patient_id1 int,
	 in name1  varchar(20),
	 in age1 int,
	 in gender1 varchar(10),
	 in address1 varchar(20),
	 in disease1 varchar(20),
	 in doctor_id1 int
)	
BEGIN 	
insert into patients(patient_id,name,age,gender,address,disease,doctor_id) values(patient_id1,name1,age1,gender1,address1,disease1,doctor_id1);
END &&  
DELIMITER ; 

call add_patient(8,'rekha',56,'Female','Surat','Cancer',23);
select * from patients;

/* OUT parameter --------------------------------------------------------------------------------------------------------------------------*/
DELIMITER &&  
CREATE PROCEDURE out_parameter1(out max_charge int) 
BEGIN  
    SELECT max(room_charge) from bills;  
END &&  
DELIMITER ;  

call out_parameter1(@M);
/* @m is temprovary variable */

/* INOUT parameter -------------------------------------------------------------------------------------------------------------*/
DELIMITER &&  
CREATE PROCEDURE inout_parameter1(inout var1 int) 
BEGIN  
    SELECT amount into var1 from laboratory where lan_no=var1;  
END &&  
DELIMITER ;  

set @M=20;
call inout_parameter1(@M);
select @M;

/*  drop procedure proc_name; - it will delete the stored procedure */