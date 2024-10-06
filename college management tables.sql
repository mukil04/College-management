CREATE TABLE student (    
	stu_id INT PRIMARY KEY,
    stu_name VARCHAR(30),
	stu_dob DATE,
    stu_blood varchar(15),
	stu_gender varchar(10),
	stu_type varchar(15),
	dep_id int,
	tea_id int,
	stu_ph_no varchar(30) , 
	stu_address varchar(15),
	stu_email VARCHAR(30) 
     
);
alter table student change stu_ph_no stu_ph_no varchar(30);

CREATE TABLE department (
     dep_id INT PRIMARY KEY,
     dep_name varchar(30),
     dep_block_name varchar(30),
     stu_id INt,
	 foreign key (stu_id ) references student (stu_id)
     
	
);


CREATE TABLE hod (
     hod_id int primary key,
     hod_name varchar(15),
	 dep_id int,
     hod_qul varchar(15),
     hod_ph_no int,
     hod_email varchar(30), 
     foreign key (dep_id) references department (dep_id)
);  
alter table hod change hod_ph_no hod_ph_no varchar(50); 


CREATE TABLE teacher (
     tea_id  INT UNIQUE,
	 dep_id int, 
     tea_name varchar(30),
     tea_ph_no varchar(30) ,
     tea_qul varchar(30),
     foreign key (dep_id) references department (dep_id)     
);


CREATE TABLE addtence (
	 stu_id int,
     stu_addtence varchar(10),
     add_per varchar(10),
     add_otty VARCHAR(15),
     foreign key (stu_id) references student (stu_id)     
);


create table fees_details (
     stu_id int,
     tution_fees decimal(10,2),
     bus_fees decimal(10,2),
     sem_fees decimal(10,2),
     dep_id int,
     due_fees varchar(15),
     paid_fees int,
     pending_fees int,
     foreign key (stu_id) references student(stu_id),
     foreign key (dep_id) references department(dep_id)
   
);

