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
-- Description:	CRUD operation for Mentor Tech Stack
-- =============================================
CREATE PROCEDURE MentorTechStackCRUD
@ActionType varchar(20),
@MentorTechStackId int = null,
@MentorId int = null,
@TechStackId int = null,
@Status varchar(20) = null,
@CreatorStamp varchar(20) = null,
@CreatorUser varchar(20) = null,
@DateTime datetime = null
AS
BEGIN
	--select all 
	if @ActionType = 'select all'
	select * from MentorTechStack

	--select
	begin try
		if @ActionType = 'select'
		if exists(select Id from MentorTechStack where Id = @MentorTechStackId)
		begin
			select * from MentorTechStack where Id = @MentorTechStackId
		end
		else
			raiserror('Mentor Tech Stack Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--insert
	begin try
		if @ActionType = 'insert'
		if @MentorId is not null and @TechStackId is not null and @Status is not null
		begin
			insert into MentorTechStack values(@MentorId, @TechStackId, @Status, @CreatorStamp, @CreatorUser, @DateTime)
			select * from MentorTechStack where Mentor_Id = @MentorId
		end
		else
			raiserror('Please Provide Details Of Mentor Tech Stack Map', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--update
	begin try
		if @ActionType = 'update'
		if exists(select Id from MentorTechStack where Id = @MentorTechStackId)
		begin
			update MentorTechStack 
				set Mentor_Id = ISNULL(@MentorId, Mentor_Id),
					Tech_Stack_Id = ISNULL(@MentorTechStackId, Tech_Stack_Id),
					Status = isnull(@Status, Status)
				where Id = @MentorTechStackId
			select * from MentorTechStack where Id = @MentorTechStackId
		end
		else
			raiserror('Mentor Tech Stack Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE () as ErrorMessage;
	end catch

	--delete
	begin try
		if @ActionType = 'delete'
		if exists(select Id from MentorTechStack where Id = @MentorTechStackId)
		begin
			delete from MentorTechStack where Id = @MentorTechStackId
		end
		else
			raiserror('Mentor Tech Stack Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch
END
GO
