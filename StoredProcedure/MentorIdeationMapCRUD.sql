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
-- Description:	CRUD operation for MentorIdeationMap
-- =============================================
create PROCEDURE MentorIdeationMapCRUD
@ActionType varchar(20),
@MentorIdeationMapId int = null,
@ParentMentorId int = null,
@MentorId int = null,
@Status varchar(20) = null,
@CreatorStamp varchar(20) = null,
@CreatorUser varchar(20) = null
AS
BEGIN
	--select all 
	if @ActionType = 'select all'
	select * from MentorIdeationMap

	--select
	begin try
		if @ActionType = 'select'
		if exists(select Id from MentorIdeationMap where Id = @MentorIdeationMapId)
		begin
			select * from MentorIdeationMap where Id = @MentorIdeationMapId
		end
		else
			raiserror('Mentor Ideation Map Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--insert
	begin try
		if @ActionType = 'insert'
		if @ParentMentorId is not null and @MentorId is not null and @Status is not null
		begin
			insert into MentorIdeationMap values(@ParentMentorId, @MentorId, @Status, @CreatorStamp, @CreatorUser)
			select * from MentorIdeationMap where Parent_Mentor_Id = @ParentMentorId
		end
		else
			raiserror('Please Provide Details Of Mentor Ideation Map', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch

	--update
	begin try
		if @ActionType = 'update'
		if exists(select Id from MentorIdeationMap where Id = @MentorIdeationMapId)
		begin
			update MentorIdeationMap 
				set Parent_Mentor_Id = ISNULL(@ParentMentorId, @ParentMentorId),
					Mentor_Id = ISNULL(@MentorId, Mentor_Id)
				where Id = @MentorIdeationMapId
			select * from MentorIdeationMap where Id = @MentorIdeationMapId
		end
		else
			raiserror('Mentor Ideation Map Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE () as ErrorMessage;
	end catch

	--delete
	begin try
		if @ActionType = 'delete'
		if exists(select Id from MentorIdeationMap where Id = @MentorIdeationMapId)
		begin
			delete from MentorIdeationMap where Id = @MentorIdeationMapId
		end
		else
			raiserror('Mentor Ideation Map Id Not Found', 16,1);
	end try
	begin catch
		select ERROR_MESSAGE() as ErrorMessage;
	end catch
END
GO
