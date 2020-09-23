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
-- Description:	CRUD operation for tech stack
-- =============================================
alter PROCEDURE TechStackCRUD
@ActionType varchar(20),
@TechStackId int = null,
@TechName varchar(30) = null,
@ImagePath varchar(30) = null,
@FrameworkCurStatus varchar(10) = null,
@CreatorStamp varchar(20) = null,
@CreatorUser varchar(20) = null
AS
BEGIN
	--select all 
	if @ActionType = 'select all'
	select * from TechStack

	--select
	begin try
		if @ActionType = 'select'
		if exists(select Id from TechStack where Id = @TechStackId)
		begin
			select * from TechStack where Id = @TechStackId
		end
		else
			raiserror('Tech Stack Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--insert
	begin try
		if @ActionType = 'insert'
		if @TechName is not null and @ImagePath is not null and @FrameworkCurStatus is not null
		begin
			insert into TechStack values(@TechName, @ImagePath, @FrameworkCurStatus, @CreatorStamp, @CreatorUser)
			select * from TechStack where Tech_Name = @TechName
		end
		else
			raiserror('Please Provide Details Of Tech Stack', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--update
	begin try
		if @ActionType = 'update'
		if exists(select Id from TechStack where Id = @TechStackId)
		begin
			update TechStack 
				set Tech_Name = ISNULL(@TechName, Tech_Name),
					Image_Path = ISNULL(@ImagePath, Image_Path),
					Framework_Cur_Status = isnull(@FrameworkCurStatus, Framework_Cur_Status)
				where Id = @TechStackId
			select * from TechStack where Id = @TechStackId
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
		if exists(select Id from TechStack where Id = @TechStackId)
		begin
			delete from TechStack where Id = @TechStackId
		end
		else
			raiserror('Tech Stack Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch
END
GO
