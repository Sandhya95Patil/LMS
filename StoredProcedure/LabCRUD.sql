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
-- Description:	CRUD operation for lab
-- =============================================
alter PROCEDURE LabCRUD
@ActionType varchar(20),
@LabId int = null,
@Name varchar(20) = null,
@Location varchar(20) = null,
@Address varchar(30) = null,
@Status varchar(20) = null,
@CreatorStamp varchar(20) = null,
@CreatorUser varchar(20) = null
AS
BEGIN
	--select all
	if @ActionType = 'select all'
		select * from Lab

	--select
	begin try
		if @ActionType = 'select'
			if exists(select Id from Lab where Id = @LabId)
			begin
				select * from Lab where Id = @LabId
			end
			else
				raiserror('Lab Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage
	end catch

	--insert
	begin try
		if @ActionType = 'insert'
		if @Name is not null and @Location is not null and @Address is not null and @Status is not null  
		begin
			insert into Lab values (@Name, @Location, @Address, @Status, @CreatorStamp, @CreatorUser)
			select * from Lab where Name = @Name
		end 
		else
			raiserror('Please Provide Details', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--update 
	begin try
		if @ActionType = 'update'
		if exists(select Id from Lab where Id = @LabId)
		begin
			update Lab
				set Name = ISNULL(@Name, Name),
					Location = ISNULL(@Location, Location),
					Address = ISNULL(@Address, Address),
					Status = ISNULL(@Status, Status)
				where Id = @LabId
		end
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--delete
	begin try
		if @ActionType = 'delete'
		if exists(select Id from Lab where Id = @LabId)
		begin
			delete from Lab where Id = @LabId
		end
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch
END
GO
