create table UserDetails
(
Id int Identity(1,1) primary key,
FirstName varchar(30),
LastName varchar(30),
Email varchar(50),
Password varchar(40),
Contact_No varchar(40),
Verified bit,
Creator_Stamp varchar(30),
Creator_User varchar(30)
);