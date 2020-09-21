create table LabThreshold
(
Id int identity(1,1) primary key,
Lab_Id int foreign key references Lab(Id),
Lab_Capacity int,
Lead_Threshold int,
Ideation_Engg_Threshold int,
Buddy_Engg_Threshold int,
Status varchar(20),
Creator_Stamp varchar(20),
Creator_User varchar(20)
)