USE [LearningManagementSystem]
GO
/****** Object:  StoredProcedure [dbo].[CandidateBankDetailsCRUD]    Script Date: 22-09-2020 18:42:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Sandhya Patil
-- Create date: 21-09-2020
-- Description:	CRUD operation for bank deatils of fellowship candidate
-- =============================================
ALTER PROCEDURE [dbo].[CandidateBankDetailsCRUD]
@ActionType varchar(10),
@BankDetailsId int = null,
@CandidateId int = null,
@Name varchar(30) = null,
@AccountNo varchar(50) = null,
@IsAccountNoVerified bit = null,
@IFSCCode varchar(30) = null,
@IsIFSCCodeVerified bit = null,
@PanNo varchar(30) = null,
@IsPanNoVerified bit = null,
@AdharNo varchar(50) = null,
@IsAdharNoVerified bit = null,
@CreatorStamp varchar(30) = null,
@CreatorUser varchar(30) = null
AS
BEGIN
	--select all candidates bank details
	if @ActionType = 'select all'
	select * from CandidateBankDetails 

	--select particular candidate bank details
	begin try
		if @ActionType = 'select'
		if exists(select Candidate_Id from CandidateBankDetails where Candidate_Id = @CandidateId)
		begin
			select * from CandidateBankDetails where Candidate_Id = @CandidateId
		end
		else 
			raiserror('Candidate Id Not Found',16,1);
	end try
	begin catch
		select
		ERROR_MESSAGE() as ErrorMessage;
	end catch

	--insert
	begin try
		if @ActionType = 'insert'
		if @CandidateId is null and @Name is null and @AccountNo is null and @IFSCCode is null and (@PanNo is null or @AdharNo is null)
		begin
			raiserror('Please Provide Bank Details', 16,1);
		end
		else
		if exists (select Id from FellowshipCandidate where Id = @CandidateId)
		begin
			insert into CandidateBankDetails values(@CandidateId, @Name, @AccountNo, @IsAccountNoVerified, @IFSCCode, @IsIFSCCodeVerified, @PanNo, @IsPanNoVerified, @AdharNo, @IsAdharNoVerified, @CreatorStamp, @CreatorUser)
			select * from CandidateBankDetails where Candidate_Id=@CandidateId
		end
		else
			raiserror('Candidate Id Not Found', 16,1);
	end try
	begin catch
		select
			ERROR_MESSAGE() as ErrorMessage;
	end catch

	--update
	begin try
		if @ActionType = 'update'
		if exists(select Id from CandidateBankDetails where Id = @BankDetailsId)
		begin
			update CandidateBankDetails
			set Name = ISNULL(@Name, Name),
				Account_No = ISNULL(@AccountNo, Account_No),
				Is_Account_No_Verified = ISNULL(@IsAccountNoVerified, Is_Account_No_Verified),
				IFSC_Code = ISNULL(@IFSCCode, IFSC_Code),
				Is_IFSC_Code_Verified = ISNULL(@IsIFSCCodeVerified, Is_IFSC_Code_Verified),
				Pan_No = ISNULL(@PanNo, Pan_No),
				Is_Pan_No_Verified = ISNULL(@IsPanNoVerified, Is_Pan_No_Verified),
				Adhar_No = ISNULL (@AdharNo, @IsAdharNoVerified),
				Is_Adhar_No_Verified = ISNULL(@IsAdharNoVerified, Is_Adhar_No_Verified)
				select * from CandidateBankDetails where Id = @BankDetailsId
		end
		else
			raiserror('Bank Details Id Not Found', 16, 1);
	end try
	begin catch 
		select 
			ERROR_MESSAGE() as ErrorMessage;
	end catch

	--delete 
	begin try
		if exists(select Id from CandidateBankDetails where Id = @BankDetailsId)
		begin
			delete from CandidateBankDetails where Id = @BankDetailsId
		end
		else
			raiserror('Bank Details Id Not Found', 16,1);
	end try
	begin catch
	end catch
END
