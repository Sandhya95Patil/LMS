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
-- Description:	CRUD operation for Company
-- =============================================
CREATE PROCEDURE CompanyCRUD
@ActionType varchar(10),
@CompanyId int = null,
@Name varchar(30) = null,
@Address varchar(40) = null,
@Location varchar(20) = null,
@Status varchar(10) = null,
@CreatorStamp varchar(20) = null,
@CreatorUser varchar(20) = null
AS
BEGIN
	--select all
	if @ActionType = 'select all'
		select * from Company 

	--select
	begin try
		if exists(select Id from Company where Id = @CompanyId)
		begin
			select * from Company where Id = @CompanyId
		end
		else
			raiserror('Company Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage
	end catch

	--insert
	begin try
		if @ActionType = 'insert'
		if @Name is null and @Address is null and @Location is null and @Status is null and @CreatorStamp is null and @CreatorUser is null
		begin
			insert into Company values(@Name, @Address, @Location, @Status, @CreatorStamp, @CreatorUser)
			select * from Company where Name = @Name
		end
		else
			raiserror('Please Provide Details Of Company', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	begin try
		if @ActionType = 'update'
		if exists (select Id from Company where Id = @CompanyId)
		begin
			update Company 
				set Address = ISNULL(@Address, Address),
					Location = ISNULL(@Location, Location)
					where Id = @CompanyId
			select * from Company where Id = @CompanyId
		end
		else
			raiserror('Company Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE () as ErrorMessage;
	end catch

	begin try
		if @ActionType = 'delete'
		if exists (select Id from Company where Id = @CompanyId)
		begin
			delete from Company where Id = @CompanyId
		end
		else
			raiserror('Company Id Not Found', 16,1);
	end try
	begin catch
		select
			ERROR_MESSAGE() as ErrorMessage;
	end catch
END
GO
