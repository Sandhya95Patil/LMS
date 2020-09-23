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
-- Description:	CRUD operation for lab threshold
-- =============================================
alter PROCEDURE LabThresholdCRUD
@ActionType varchar(10),
@LabThresholdId int = null,
@LabId int = null,
@LabCapacity int = null,
@LeadThreshold int = null,
@IdeationEnggThreshold int = null,
@BuddyEnggThreshold int = null,
@Status varchar(20) = null,
@CreatorStamp varchar(20) = null,
@CreatorUser varchar(20) = null
AS
BEGIN
	--select all 
	if @ActionType = 'select all'
	select * from LabThreshold

	--select
	begin try
		if @ActionType = 'select'
		if exists(select Lab_Id from LabThreshold where Lab_Id = @LabId)
		begin
			select * from LabThreshold where Lab_Id = @LabId
		end
		else
			raiserror('Lab Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--insert
	begin try
		if @ActionType = 'insert'
		if @LabId is not null and @LabCapacity is not null and @LeadThreshold is not null and @IdeationEnggThreshold is not null and @BuddyEnggThreshold is not null and @Status is not null
		begin
			if exists(select Id from Lab where Id = @LabId)
			begin
				insert into LabThreshold values(@LabId, @LabCapacity, @LeadThreshold, @IdeationEnggThreshold, @BuddyEnggThreshold, @Status, @CreatorStamp, @CreatorUser)
				select * from LabThreshold where Lab_Id = @LabId
			end
			else
				raiserror('Lab Id Not Found', 16,1);
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
		if exists(select Id from LabThreshold where Id = @LabThresholdId)
		begin
			update LabThreshold 
				set Lab_Capacity = ISNULL(@LabCapacity, Lab_Capacity),
					Lead_Threshold = ISNULL(@LeadThreshold, Lead_Threshold),
					Ideation_Engg_Threshold = ISNULL(@IdeationEnggThreshold, Ideation_Engg_Threshold),
					Buddy_Engg_Threshold = ISNULL(@BuddyEnggThreshold, Buddy_Engg_Threshold)
				where Id = @LabThresholdId
			select * from LabThreshold where Id = @LabThresholdId
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
		if exists(select Id from LabThreshold where Id = @LabThresholdId)
		begin
			delete from LabThreshold where Id = @LabThresholdId
		end
		else
			raiserror('Lab Threshold Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch
END
GO
