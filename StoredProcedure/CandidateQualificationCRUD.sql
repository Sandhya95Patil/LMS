-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Sandhya Patil
-- Create date: 22-09-2020
-- Description:	CRUD operation for candidate qualification
-- =============================================
alter PROCEDURE CandidateQualificationCRUD
@ActionType varchar(10),
@CandidateQualificationId int = null,
@CandidateId int = null,
@Degree varchar(40) = null,
@DegreeVerified bit = null,
@EmployeeDeciplin varchar(40) = null,
@IsEmpDeciplineVerified bit = null,
@PassingYear int = null,
@IsPassingYearVerified bit = null,
@AggregatePer int = null,
@IsAggreVerifiedPer bit = null,
@FinalYearPer int = null,
@IsFinalYearPerVerified bit = null,
@TrainingInstitute varchar(50) = null,
@IsTrainingInstituteVerified bit = null,
@TrainingDurationMonth int = null,
@IsTrainingDurMonthVerified bit = null,
@OtherTraining varchar(30) = null,
@IsOtherTrainingVerified bit = null,
@creatorStamp varchar(30) = null,
@CreatorUser varchar(30) = null
AS
BEGIN
	--select all
		if @ActionType = 'select all'
		select * from CandidateQualification

	--select
	begin try
		if @ActionType = 'select'
		if exists (select Id from CandidateQualification where Id = @CandidateId)
		begin
			select * from CandidateQualification where Id = @CandidateId
		end
	end try
	begin catch
		select 
			ERROR_MESSAGE() as ErrorMessage;
	end catch

	--insert
	begin try
		if @ActionType = 'insert'
		if exists (select Id from FellowshipCandidate where Id = @CandidateId)
		begin
			insert into CandidateQualification values(@CandidateId, @Degree, @DegreeVerified, @EmployeeDeciplin, @IsEmpDeciplineVerified, @PassingYear, @IsPassingYearVerified, @AggregatePer, @IsAggreVerifiedPer, @FinalYearPer, @IsFinalYearPerVerified, @TrainingInstitute, @IsTrainingInstituteVerified, @TrainingDurationMonth, @IsTrainingDurMonthVerified, @OtherTraining, @IsOtherTrainingVerified, @creatorStamp, @creatorStamp)
			select * from CandidateQualification where Candidate_Id = @CandidateId
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
		if exists(select Id from CandidateQualification where Id = @CandidateQualificationId)
		begin
			update CandidateQualification
				set Degree = ISNULL(@Degree, Degree),
					Degree_Name_Verified = ISNULL(@DegreeVerified, Degree_Name_Verified),
					Employee_Deciplin = ISNULL(@EmployeeDeciplin, Employee_Deciplin),
					Is_Emp_Deciplin_Verified = ISNULL(@IsEmpDeciplineVerified, Is_Emp_Deciplin_Verified),
					Passing_Year = ISNULL(@PassingYear, Passing_Year),
					Is_Passing_Year_Verified = ISNULL(@IsPassingYearVerified, Is_Passing_Year_Verified)
					where Id = @CandidateQualificationId
					select * from CandidateQualification where Id = @CandidateQualificationId
		end
		else
			raiserror('Qualification Id Not Found', 16,1);
	end try
	begin catch 
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--delete 
	begin try
		if @ActionType = 'delete'
		if exists(select Id from CandidateQualification where Id = @CandidateQualificationId)
		begin
			delete from CandidateQualification where Id = @CandidateQualificationId
		end
		else
			raiserror('Qualification Id Not Found', 16,1);
	end try
	begin catch 
		select ERROR_MESSAGE () as ErrorMessage;
	end catch
END
GO
