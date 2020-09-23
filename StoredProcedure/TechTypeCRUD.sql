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
-- Description:	CRUD operation for tech type
-- =============================================
CREATE PROCEDURE TechTypeCRUD
@ActionType varchar(10),
@TechTypeId int = null,
@TypeName varchar(30) = null,
@CurStatus varchar(20) = null,
@CreatorStamp varchar(20) = null,
@CreatorUser varchar(20) = null
AS
BEGIN
		--select all 
	if @ActionType = 'select all'
	select * from TechType

	--select
	begin try
		if @ActionType = 'select'
		if exists(select Id from TechType where Id = @TechTypeId)
		begin
			select * from TechType where Id = @TechTypeId
		end
		else
			raiserror('Tech Type Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--insert
	begin try
		if @ActionType = 'insert'
		if @TypeName is not null and @CurStatus is not null
		begin
			insert into TechType values(@TypeName, @CurStatus, @CreatorStamp, @CreatorUser)
			select * from TechType where Type_Name = @TypeName
		end
		else
			raiserror('Please Provide Details Of Tech Type', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--update
	begin try
		if @ActionType = 'update'
		if exists(select Id from TechType where Id = @TechTypeId)
		begin
			update TechType 
				set Type_Name = ISNULL(@TypeName, Type_Name),
					Cur_Status = ISNULL(@CurStatus, Cur_Status)
				where Id = @TechTypeId
			select * from TechType where Id = @TechTypeId
		end
		else
			raiserror('Mentor Tech Type Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE () as ErrorMessage;
	end catch

	--delete
	begin try
		if @ActionType = 'delete'
		if exists(select Id from TechStack where Id = @TechTypeId)
		begin
			delete from TechType where Id = @TechTypeId
		end
		else
			raiserror('Tech Type Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch
END
GO
