USE [LearningManagementSystem]
GO
/****** Object:  StoredProcedure [dbo].[FellowshipCandidateCRUD]    Script Date: 22-09-2020 18:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sandhya Patil
-- Create date: 20-09-2020
-- Description:	CRUD operation for fellowship candidate
-- =============================================
ALTER PROCEDURE [dbo].[FellowshipCandidateCRUD]
@ActionType varchar(10),
@CandidateId int =null,
@FirstName varchar(30)=null,
@MiddleName varchar(30)=null,
@LastName varchar(30)=null,
@Email varchar(50)=null,
@HiredCity varchar(30)=null,
@HiredDate datetime=null,
@HiredLab varchar(30)=null,
@Degree varchar(30)=null,
@Mobile_No varchar(50)=null,
@PermanentPincode int=null,
@Attitude varchar(30)=null,
@CommunicationRemark varchar(30)=null,
@KnowledgeRemark varchar(40)=null,
@AggregateRemark varchar(40)=null,
@CreatorStamp varchar(30)=null,
@CreatorUser varchar(30)=null,
@BirthDate datetime=null,
@Is_Bitrth_Date_Verified bit=null,
@ParentName varchar(30)=null,
@ParentOccupation varchar(30)=null,
@ParentMobileNo varchar(30)=null,
@ParentAnnualSalary bigint=null,
@LocalAddress varchar(50)=null,
@PermanentAddress varchar(50)=null,
@PhotoPath varchar(30)=null,
@JoiningDate datetime=null,
@CandidateStatus varchar(30)=null,
@PersonalInfo varchar(30)=null,
@BankInfo varchar(30)=null,
@EducationalInfo varchar(30)=null,
@DocumentStatus varchar(20)=null,
@Remark varchar(30)=null
AS
BEGIN
	--select all
	begin try 
		if @ActionType = 'select all'
		select * from FellowshipCandidate
	end try 
	begin catch
		select ERROR_MESSAGE() as ErrorMessage
	end catch

	--select
	begin try
	if @ActionType = 'select'
		if exists (select Id from FellowshipCandidate where Id = @CandidateId)
		begin
			select * from FellowshipCandidate where Id = @CandidateId
		end
		else
			raiserror('Candidate Not Present Of Given Id', 16,1);
	end try
	begin catch 
		select
		   ERROR_MESSAGE() AS ErrorMessage;  
	end catch

	--insert
	begin try
	if @ActionType = 'insert'
	begin 
	    if @FirstName is null and @MiddleName is null and @LastName is null and  @Email is null  
		begin
			raiserror('Please Provide Details', 16,1);
		end
		else
			if not exists(select Email from FellowshipCandidate where Email = @Email)
			begin
				insert into FellowshipCandidate values(@FirstName, @MiddleName, @LastName, @Email, @HiredCity, @HiredDate, @HiredLab, @Degree, @Mobile_No, @PermanentPincode, @Attitude, @CommunicationRemark, @KnowledgeRemark, @AggregateRemark, @CreatorStamp, @CreatorUser, @BirthDate, @Is_Bitrth_Date_Verified, @ParentName, @ParentOccupation, @ParentMobileNo, @ParentAnnualSalary, @LocalAddress, @PermanentAddress, @PhotoPath, @JoiningDate, @CandidateStatus, @PersonalInfo, @BankInfo, @EducationalInfo, @DocumentStatus, @Remark)
				select * from FellowshipCandidate where Email = @Email
			end
			else
				raiserror('EmailId Already Exists', 16,1);
	end
	end try
	begin catch
		select
            ERROR_MESSAGE() AS ErrorMessage;  
	end catch

	--update
	begin try
	if @ActionType = 'update'
		if exists(select Id from FellowshipCandidate where Id=@CandidateId)
		begin
			update FellowshipCandidate
				set FirstName=isnull(@FirstName, FirstName),
				MiddleName=ISNULL(@MiddleName, MiddleName),
				LastName = isnull(@LastName, LastName),
				Email=ISNULL(@Email, Email),
				Hired_City=ISNULL(@HiredCity, Hired_City),
				Hired_Date=ISNULL(@HiredDate, Hired_Date),
				Hired_Lab=ISNULL(@HiredLab, Hired_Lab),
				Degree=ISNULL(@Degree, Degree),
				Mobile_No=ISNULL(@Mobile_No, Mobile_No)
				where Id = @CandidateId
				
			select * from FellowshipCandidate where Id =@CandidateId
		end
		else
			raiserror('Candidate Id Not Found', 16,1);
	end try
	begin catch 
			select 
				ERROR_MESSAGE() as ErrorMessage;
	end catch

	--delete
	begin try
	if @ActionType = 'delete'
		if exists (select Id from FellowshipCandidate where Id = @CandidateId)
		begin
			delete from FellowshipCandidate where Id = @CandidateId
		end
		else
			raiserror('Candidate Id Not Found', 16,1);
	end try
	begin catch
		select
			ERROR_MESSAGE() as ErrorMessage;
	end catch
END
