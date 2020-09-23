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
-- Description:	CRUD operation for mentor
-- =============================================
alter PROCEDURE MentorCRUD
@ActionType varchar(20),
@MentorId int = null,
@Name varchar(30) = null,
@MentorType varchar(20) = null,
@LabId int = null,
@Status varchar(20) = null,
@CreatorStamp varchar(20) = null,
@CreatorUser varchar(20) = null
AS
BEGIN
	--select all 
	if @ActionType = 'select all'
	select * from Mentor

	--select
	begin try
		if @ActionType = 'select'
		if exists(select Id from Mentor where Id = @MentorId)
		begin
			select * from Mentor where Id = @MentorId
		end
		else
			raiserror('Mentor Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--insert
	begin try
		if @ActionType = 'insert'
		if @Name is not null and @MentorType is not null and @LabId is not null and @Status is not null
		begin
			insert into Mentor values(@Name, @MentorType, @LabId, @Status, @CreatorStamp, @CreatorUser)
			select * from Mentor where Id = @MentorId
		end
		else
			raiserror('Please Provide Details Of Mentor', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--update
	begin try
		if @ActionType = 'update'
		if exists(select Id from Mentor where Id = @MentorId)
		begin
			update Mentor 
				set Name = ISNULL(@Name, Name),
					Mentor_Type = ISNULL(@MentorType, Mentor_Type),
					Lab_Id = ISNULL(@LabId, Lab_Id)
				where Id = @MentorId
			select * from Mentor where Id = @MentorId
		end
		else
			raiserror('Mentor Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE () as ErrorMessage;
	end catch

	--delete
	begin try
		if @ActionType = 'delete'
		if exists(select Id from Mentor where Id = @MentorId)
		begin
			delete from Mentor where Id = @MentorId
		end
		else
			raiserror('Mentor Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch
END
GO
