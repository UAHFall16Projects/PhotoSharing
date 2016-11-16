
USE [PhotoSharing]
GO

/****** Object:  StoredProcedure [photoShare].[GetUsersByUserId]    Script Date: 11/3/2016 11:44:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [photoShare].[GetUsersByUserId]
	 -- Add the parameters for the stored procedure here
        @UserId nvarchar(128) = null
        AS
        BEGIN
            -- SET NOCOUNT ON added to prevent extra result sets from
            -- interfering with SELECT statements.
            SET NOCOUNT ON;

            -- Insert statements for procedure here
        SELECT usr.*,photo.photoFileId,[file].content
        FROM photoShare.Users usr
		LEFT OUTER JOIN
		[photoShare].Photos photo ON usr.ProfilePicId = photo.PhotoID
		LEFT OUTER JOIN
		[photoShare].[photoFiles] [file] ON photo.photoFileId = [file].photoFileID
        WHERE usr.UserID = @UserId
        END
		
GO


USE [PhotoSharing]
GO

/****** Object:  StoredProcedure [photoShare].[ReadPhoto]    Script Date: 11/3/2016 11:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [photoShare].[ReadPhoto] @photoFileId int as 
SELECT Content FROM [photoShare].photoFiles 
WHERE photoFileID=@photoFileId 

GO

USE [PhotoSharing]
GO

/****** Object:  StoredProcedure [photoShare].[SavePhoto]    Script Date: 11/3/2016 11:44:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [dbo].[InsertUser] ON [dbo].[AspNetUsers] 
  AFTER INSERT
AS 
BEGIN

   IF exists (SELECT * FROM inserted) and not exists(SELECT * FROM deleted)
		BEGIN
			 --INSERT Activity
			 INSERT INTO [photoShare].[Users]
				SELECT [Id]
					  ,[FirstName]
					  ,[LastName]
					  ,[Email]
					  ,[UserName]
					  ,[PasswordHash]
					  ,GETDATE()
					  ,[DateOfBirth]
					  ,[Sex]
					  ,[PhoneNumber]
					  ,NULL
				FROM Inserted
		END
END
GO

USE [PhotoSharing]
GO

/****** Object:  Trigger [dbo].[InsertUser]    Script Date: 11/5/2016 9:07:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [photoShare].[UpdateAspNetUser] ON [photoShare].[Users]
  AFTER UPDATE
AS 
BEGIN
	IF exists(SELECT * FROM inserted) and exists (SELECT * FROM deleted)
		BEGIN
		--Update Activity	
		   UPDATE [dbo].[AspNetUsers]
		   SET
			   [AspNetUsers].[FirstName]=[insrt].[FirstName]
			  ,[AspNetUsers].[LastName]=[insrt].[LastName]
			  ,[AspNetUsers].[Email] = [insrt].[Email]
			  ,[AspNetUsers].[UserName]=[insrt].[UserName]
			  ,[AspNetUsers].[PasswordHash]=[insrt].[Password]
			  ,[AspNetUsers].[DateOfBirth]=[insrt].[DateOfBirth]
			  ,[AspNetUsers].[Sex]=[insrt].[Sex]
			  ,[AspNetUsers].[PhoneNumber]=[insrt].[Phone]
		  FROM  [dbo].[AspNetUsers] [usr]
		  INNER JOIN Inserted [insrt]
		  ON insrt.UserID = usr.Id
		END

END
GO



USE [PhotoSharing]
GO

USE [PhotoSharing]
GO

/****** Object:  StoredProcedure [photoShare].[GetUsersByUserId]    Script Date: 11/6/2016 11:05:18 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [photoShare].[GetFollowersByUserId]
        @UserId nvarchar(128) = null
        AS
        BEGIN
            -- SET NOCOUNT ON added to prevent extra result sets from
            -- interfering with SELECT statements.
            SET NOCOUNT ON;

        SELECT folwrs.*, usr.FirstName+ ' '+usr.LastName FullName, usr.ProfilePicId
		FROM photoShare.Followers folwrs
		LEFT OUTER JOIN photoShare.Users usr
		ON folwrs.UserFollowerId = usr.UserID
        WHERE folwrs.UserId = @UserId
        END
		

GO




USE [PhotoSharing]
GO

USE [PhotoSharing]
GO

/****** Object:  StoredProcedure [photoShare].[GetUsersByUserId]    Script Date: 11/6/2016 11:05:18 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [photoShare].[GetFollowingsByUserId]
        @UserId nvarchar(128) = null
        AS
        BEGIN
            -- SET NOCOUNT ON added to prevent extra result sets from
            -- interfering with SELECT statements.
            SET NOCOUNT ON;

        SELECT folwrs.*, usr.FirstName+ ' '+usr.LastName FullName, usr.ProfilePicId
		FROM photoShare.Followers folwrs
		LEFT OUTER JOIN photoShare.Users usr
		ON folwrs.UserId = usr.UserID
		WHERE folwrs.UserFollowerId = @UserId
        END
		

GO


USE [PhotoSharing]
GO

/****** Object:  StoredProcedure [photoShare].[GetPhotosByUserId]    Script Date: 11/16/2016 12:28:36 AM ******/
DROP PROCEDURE [photoShare].[GetPhotosByUserId]
GO

/****** Object:  StoredProcedure [photoShare].[GetPhotosByUserId]    Script Date: 11/16/2016 12:28:36 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [photoShare].[GetPhotosByUserId] @UserId nvarchar(128) as 
SELECT files.PhotoFileID,
files.FileName,
files.ContentType, 
Photos.Description, 
UploadedUserId, 
 CASE
    WHEN UploadedUserId = @UserId THEN CAST(1 AS BIT)
    ELSE CAST(0 AS BIT)
  END AS PhotoOwner,
  (SELECT usrName.FirstName+' '+usrName.LastName FROM photoShare.Users usrName WHERE usrName.UserID = UploadedUserId) AS OwnerName
FROM [photoShare].photoFiles files
LEFT OUTER JOIN photoShare.Photos Photos 
ON Photos.PhotoFileId = files.PhotoFileID AND (Photos.Deleted is Null OR Photos.deleted != 1)
WHERE Photos.UploadedUserId = @UserId  --Owned
OR Photos.PhotoID IN
(Select SharePhotoes.PhotoId
FROM photoShare.SharePhotoes SharePhotoes
Where SharePhotoes.UserId = @UserId
) -- Shared
OR Photos.UploadedUserId IN
(
SELECT follow.UserId 
FROM photoShare.Followers follow
WHERE follow.UserFollowerId = @UserId
) -- Followed




GO



USE [PhotoSharing]
GO

/****** Object:  StoredProcedure [photoShare].[GetFollowersByUserId]    Script Date: 11/11/2016 5:16:40 AM ******/
DROP PROCEDURE [photoShare].[GetUserLikeUserName]
GO

/****** Object:  StoredProcedure [photoShare].[GetFollowersByUserId]    Script Date: 11/11/2016 5:16:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [photoShare].[GetUserLikeUserName]
        @UserName nvarchar(256) = null,
		@UserId nvarchar(128) = null
        AS
        BEGIN
            -- SET NOCOUNT ON added to prevent extra result sets from
            -- interfering with SELECT statements.
            SET NOCOUNT ON;

        SELECT 
			usr.UserName As label,
			usr.UserName As value, 
			usr.ProfilePicId,
			usr.UserID,
			usr.FirstName +' '+ usr.LastName AS FullName
		FROM photoShare.Users usr
        WHERE usr.UserName like '%'+@UserName+'%' AND usr.UserID != @UserId
        END
		


GO





USE [PhotoSharing]
GO

/****** Object:  StoredProcedure [photoShare].[GetFollowingNotifications]    Script Date: 11/16/2016 12:17:53 AM ******/
DROP PROCEDURE [photoShare].[GetFollowingNotifications]
GO

/****** Object:  StoredProcedure [photoShare].[GetFollowingNotifications]    Script Date: 11/16/2016 12:17:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [photoShare].[GetFollowingNotifications]
		@UserId nvarchar(128) = null
        AS
        BEGIN
            -- SET NOCOUNT ON added to prevent extra result sets from
            -- interfering with SELECT statements.
            SET NOCOUNT ON;
			SELECT 
					logNotificatoin.FullName
					,logNotificatoin.NotificationCount 
			FROM
				(SELECT logger.FirstName+' '+logger.LastName AS FullName, logs.LoggerId, Count([LoggerId]) NotificationCount
				FROM [PhotoSharing].[photoShare].[Logs] logs
				INNER JOIN photoShare.Users logger
				ON logger.UserID = logs.LoggerId 
				LEFT OUTER JOIN photoShare.Users usr
				ON usr.UserId = @UserId
				WHERE logs.LogTypeId = 4 AND usr.LastLoginTime < logs.LogDate
				GROUP BY logs.LoggerId ,logger.FirstName, logger.LastName) AS logNotificatoin
				INNER JOIN photoShare.Followers follower
				ON logNotificatoin.LoggerId = follower.UserId
				WHERE follower.UserFollowerId = @UserId

        END


GO


USE [PhotoSharing]
GO

/****** Object:  StoredProcedure [photoShare].[GetSharingNotifications]    Script Date: 11/16/2016 12:18:11 AM ******/
DROP PROCEDURE [photoShare].[GetSharingNotifications]
GO

/****** Object:  StoredProcedure [photoShare].[GetSharingNotifications]    Script Date: 11/16/2016 12:18:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [photoShare].[GetSharingNotifications]
		@UserId nvarchar(128) = null
        AS
        BEGIN
            -- SET NOCOUNT ON added to prevent extra result sets from
            -- interfering with SELECT statements.
            SET NOCOUNT ON;
			SELECT	
					logger.FirstName+' '+logger.LastName AS FullName
					, Count([LoggerId]) NotificationCount
			FROM [PhotoSharing].[photoShare].[Logs] logs
				INNER JOIN photoShare.Users usr
				ON usr.UserID = logs.AffectedId AND usr.UserID = @UserId AND usr.LastLoginTime < logs.LogDate AND logs.LogTypeId = 5
				LEFT OUTER JOIN photoShare.Users logger
				ON logger.UserID = logs.LoggerId 
				GROUP BY logs.AffectedId ,logger.FirstName, logger.LastName
        END

GO















--USE [PhotoSharing]
--GO
--SET IDENTITY_INSERT [photoShare].[LogTypes] ON 

--GO
--INSERT [photoShare].[LogTypes] ([LogTypeID], [Type]) VALUES (1, N'Insert')
--GO
--INSERT [photoShare].[LogTypes] ([LogTypeID], [Type]) VALUES (2, N'Update')
--GO
--INSERT [photoShare].[LogTypes] ([LogTypeID], [Type]) VALUES (3, N'Delete')
--GO
--INSERT [photoShare].[LogTypes] ([LogTypeID], [Type]) VALUES (4, N'Upload')
--GO
--INSERT [photoShare].[LogTypes] ([LogTypeID], [Type]) VALUES (5, N'Share')
--GO
--INSERT [photoShare].[LogTypes] ([LogTypeID], [Type]) VALUES (6, N'Follow')
--GO
--INSERT [photoShare].[LogTypes] ([LogTypeID], [Type]) VALUES (7, N'UnFollow')
--GO
--INSERT [photoShare].[LogTypes] ([LogTypeID], [Type]) VALUES (8, N'Login')
--GO
--SET IDENTITY_INSERT [photoShare].[LogTypes] OFF
--GO

