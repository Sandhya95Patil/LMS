USE [LearningManagementSystem]
GO
/****** Object:  StoredProcedure [dbo].[CandidateDocumentDetailsCRUD]    Script Date: 22-09-2020 18:52:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Sandhya Patil
-- Create date: 22-09-2020
-- Description:	CRUD operation for candidate document details 
-- =============================================
ALTER PROCEDURE [dbo].[CandidateDocumentDetailsCRUD]
@ActionType varchar(20),
@DocumentDetailsId int = null,
@CandidateId int = null,
@DocType varchar(20) = null,
@DocPath varchar(20) = null,
@Status varchar(20) = null,
@CreatorStamp varchar(20) = null,
@CreatorUser varchar(20) = null
AS
BEGIN
	--select all candidate documents details
		if @ActionType = 'select all'
			select * from CandidateDocuments

	--select 
	begin try
		if @ActionType = 'select'
		if exists (select Candidate_Id from CandidateDocuments where Candidate_Id = @CandidateId)
		begin 
			select * from CandidateDocuments where Candidate_Id = @CandidateId
		end
		else
			raiserror('Candidate Id Not Found', 16,1);
	end try
	begin catch
		select 
			ERROR_MESSAGE() as ErrorMessage;
	end catch

	--insert
	begin try
		if @ActionType = 'insert'
		if @CandidateId is null and @DocType is null and @DocPath is null and @Status is null 
		begin 
			raiserror('Please Provide Details', 16,1);
		end
		else
			insert into CandidateDocuments values(@CandidateId, @DocType, @DocPath, @Status, @CreatorStamp, @CreatorUser)
			select * from CandidateDocuments where Candidate_Id = @CandidateId
	end try
	begin catch
		select 
		ERROR_MESSAGE() as ErrorMessage
	end catch

	--update
	begin try
		if @ActionType = 'update'
		if exists (select Id from CandidateDocuments where Id = @DocumentDetailsId)
		begin
			update CandidateDocuments
				set Doc_Type = ISNULL(@DocType, Doc_Type),
					Doc_Path = ISNULL(@DocPath, Doc_Path),
					Status = ISNULL(@Status, Status)
					where Id = @DocumentDetailsId
				select * from CandidateDocuments where Id = @DocumentDetailsId
		end
		else
			raiserror('Documents Details Id Not Found', 16,1);
	end try
	begin catch
		select
			ERROR_MESSAGE() as ErrorMessage;
	end catch

	--delete
	begin try
		if @ActionType = 'delete'
		if exists (select Id from CandidateDocuments where Id = @DocumentDetailsId)
		begin
			delete from CandidateDocuments where Id = @DocumentDetailsId
		end
	    else
			raiserror('Document Details Id Not Found',16,1);
	end try
	begin catch
		select 
			ERROR_MESSAGE() as ErrorMessage
	end catch
END
