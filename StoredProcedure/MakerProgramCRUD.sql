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
-- Description:	CRUD operation for maker program
-- =============================================
CREATE PROCEDURE MakerProgramCRUD
@ActionType varchar(20),
@MakerProgramId int = null,
@ProgramName varchar(30) = null,
@ProgramType varchar(30) = null,
@ProgramLink varchar(30) = null,
@TechStackId int = null,
@TechTypeId int = null,
@IsProgramApproved bit = null,
@Description varchar(30) = null,
@Status varchar(20) = null,
@CreatorStamp varchar(20) = null,
@CreatorUser varchar(20) = null
AS
BEGIN
	--select all 
	if @ActionType = 'select all'
	select * from MakerProgram

	--select
	begin try
		if @ActionType = 'select'
		if exists(select Id from MakerProgram where Program_Name = @ProgramName)
		begin
			select * from MakerProgram where Program_Name = @ProgramName
		end
		else
			raiserror('Program Name Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--insert
	begin try
		if @ActionType = 'insert'
		if @ProgramName is not null and @ProgramType is not null and @ProgramLink is not null and @TechStackId is not null and @TechTypeId is not null and @IsProgramApproved is not null and @Description is not null and @Status is not null
		begin
			insert into MakerProgram values(@ProgramName, @ProgramType, @ProgramLink, @TechStackId, @TechTypeId, @IsProgramApproved, @Description, @Status, @CreatorStamp, @CreatorUser)
			select * from MakerProgram where Program_Name = @ProgramName
		end
		else
			raiserror('Please Provide Details Of Program', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--update
	begin try
		if @ActionType = 'update'
		if exists(select Id from MakerProgram where Id = @MakerProgramId)
		begin
			update MakerProgram 
				set Program_Name = ISNULL(@ProgramName, Program_Name),
					Program_Type = ISNULL(@ProgramType, Program_Type),
					Program_Link = ISNULL(@ProgramLink, Program_Link)
				where Id = @MakerProgramId
			select * from MakerProgram where Id = @MakerProgramId
		end
		else
			raiserror('Lab Threshold Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE () as ErrorMessage;
	end catch

	--delete
	begin try
		if @ActionType = 'delete'
		if exists(select Id from MakerProgram where Id = @MakerProgramId)
		begin
			delete from MakerProgram where Id = @MakerProgramId
		end
		else
			raiserror('Maker Program Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch
END
GO
