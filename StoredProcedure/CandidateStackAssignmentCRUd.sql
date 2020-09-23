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
-- Create date: 23-09-2020
-- Description:	CRUD operation for candidate stack assignment
-- =============================================
CREATE PROCEDURE CandidateStackAssignmentCRUD
@ActionType varchar(10),
@StackAssignmentId int = null,
@RequirementId int = null,
@CandidateId int = null,
@AssignDate datetime = null,
@CompleteDate datetime = null,
@Status varchar(20) = null,
@CreatorStamp varchar(20) = null,
@CreatorUser varchar(20) = null
AS
BEGIN
	--select all
	if @ActionType = 'select all'
	select * from CandidateStackAssignment

	--select
	begin try
	if @ActionType = 'select'
	if exists(select Id from CandidateStackAssignment where Candidate_Id = @CandidateId)
	begin
		select * from CandidateStackAssignment where Candidate_Id = @CandidateId
	end
	else
		raiserror('Candidate Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage
	end catch

	--insert
	begin try
		if exists(select Id from FellowshipCandidate where Id = @CandidateId)
		begin
			insert into CandidateStackAssignment values(@RequirementId, @CandidateId, @AssignDate, @CompleteDate, @Status, @CreatorStamp, @CreatorUser)
			select * from CandidateStackAssignment where Candidate_Id = @CandidateId
		end
		else
			raiserror('Candidate Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--update 
	begin try
		if @ActionType = 'update'
		if exists(select Id from CandidateStackAssignment where Id = @StackAssignmentId)
		begin
			update CandidateStackAssignment 
				set Status = ISNULL(@Status, Status)
				where Id = @StackAssignmentId
			select * from CandidateStackAssignment where Id = @StackAssignmentId
		end
		else
			raiserror('Candidate Stack Assignment Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--delete 
	begin try
		if @ActionType = 'delete'
		if exists(select Id from CandidateStackAssignment where Id = @StackAssignmentId)
		begin
			delete from CandidateStackAssignment where Id = @StackAssignmentId
		end
		else
			raiserror('Candidate Stack Assignment Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch
END
GO
