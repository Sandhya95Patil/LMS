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
-- Description:	CRUD operation for CompanyRequirements
-- =============================================
alter PROCEDURE CompanyRequirementsCRUD
@ActionType varchar(10),
@CompanyRequirementId int = null,
@CompanyId int = null,
@RequestedMonth varchar(20) = null,
@City varchar(20) = null,
@IsDocVerified bit = null,
@RequirementDocPath varchar(40) = null,
@NoOfEngg int = null,
@TechStackId int = null,
@TechTypeId int = null,
@MakerProgramId int = null,
@LeadId int = null,
@IdeationEnggId int = null,
@BuddyEnggId int = null,
@SpecialRemark varchar(30) = null,
@Status varchar(30) = null, 
@CreatorStmap varchar(20) = null,
@CreatorUser varchar(20) = null
AS
BEGIN
	--select all
		if @ActionType = 'select all'
		select * from CompanyRequirements 

	--select
	begin try
		if @ActionType = 'select'
		if exists(select Id from CompanyRequirements where Id = @CompanyRequirementId)
		begin
			select * from CompanyRequirements where Id = @CompanyRequirementId
		end
		else
			raiserror('Company Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--insert
	begin try
		if @ActionType = 'insert'
		if @CompanyId is null and @RequestedMonth is null and @City is null and @IsDocVerified is null and @RequirementDocPath is null and @NoOfEngg is null and @TechStackId is null and @TechTypeId is null and @MakerProgramId is null and @LeadId is null and @IdeationEnggId is null and @BuddyEnggId is null and @SpecialRemark is null
		begin
			insert into CompanyRequirements values(@CompanyId, @RequestedMonth, @City, @IsDocVerified, @RequirementDocPath, @NoOfEngg, @TechStackId, @TechTypeId, @MakerProgramId, @LeadId, @IdeationEnggId, @BuddyEnggId, @SpecialRemark, @Status, @CreatorStmap, @CreatorUser)
			select * from CompanyRequirements where Company_Id = @CompanyId
		end
		else
			raiserror('Please Provide All Details', 16, 1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--update 
	begin try
		if @ActionType = 'update'
		if exists(select Id from CompanyRequirements where Id = @CompanyRequirementId)
		begin
			update CompanyRequirements
				set Requested_Month = ISNULL(@RequestedMonth, Requested_Month),
					Requirement_Doc_Path = ISNULL(@RequirementDocPath, Requirement_Doc_Path),
					No_Of_Engg = ISNULL(@NoOfEngg, No_Of_Engg)
				select * from CompanyRequirements where Id = @CompanyRequirementId
		end
		else
			raiserror('Company Requiremet Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--delete 
	begin try
		if @ActionType = 'delete'
		if exists(select Id from CompanyRequirements where Id = @CompanyRequirementId)
		begin
			delete from CompanyRequirements where Id = @CompanyRequirementId
		end
		else
			raiserror('Company Requirement Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch
END
GO
