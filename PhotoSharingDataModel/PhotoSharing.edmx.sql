
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/01/2016 17:22:59
-- Generated from EDMX file: C:\Users\Rohit\Documents\GitHub\PhotoSharing\PhotoSharingDataModel\PhotoSharing.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
IF SCHEMA_ID(N'photoShare') IS NULL EXECUTE(N'CREATE SCHEMA [photoShare]');
GO



-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[photoShare].[FK_UserFollower]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Followers] DROP CONSTRAINT [FK_UserFollower];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserFollower1]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Followers] DROP CONSTRAINT [FK_UserFollower1];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserUserGroup]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[UserGroups] DROP CONSTRAINT [FK_UserUserGroup];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserGroupGroup]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[UserGroups] DROP CONSTRAINT [FK_UserGroupGroup];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserGroupOwner]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Groups] DROP CONSTRAINT [FK_UserGroupOwner];
GO
IF OBJECT_ID(N'[photoShare].[FK_AlbumUser]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Albums] DROP CONSTRAINT [FK_AlbumUser];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserTagInformation]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[TagInformations] DROP CONSTRAINT [FK_UserTagInformation];
GO
IF OBJECT_ID(N'[photoShare].[FK_PhotoTagInformation]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[TagInformations] DROP CONSTRAINT [FK_PhotoTagInformation];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserNotification]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Notifications] DROP CONSTRAINT [FK_UserNotification];
GO
IF OBJECT_ID(N'[photoShare].[FK_LogNotification]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Notifications] DROP CONSTRAINT [FK_LogNotification];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserLog]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Logs] DROP CONSTRAINT [FK_UserLog];
GO
IF OBJECT_ID(N'[photoShare].[FK_LogPhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Logs] DROP CONSTRAINT [FK_LogPhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_AlbumPhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Albums] DROP CONSTRAINT [FK_AlbumPhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_PhotoAlbumPhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[PhotoAlbums] DROP CONSTRAINT [FK_PhotoAlbumPhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_AlbumPhotoAlbum]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[PhotoAlbums] DROP CONSTRAINT [FK_AlbumPhotoAlbum];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserPhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Users] DROP CONSTRAINT [FK_UserPhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserPhoto1]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Photos1] DROP CONSTRAINT [FK_UserPhoto1];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserShareUserPhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[SharePhotoes] DROP CONSTRAINT [FK_UserShareUserPhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_ShareUserPhotoPhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[SharePhotoes] DROP CONSTRAINT [FK_ShareUserPhotoPhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserComment]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Comments] DROP CONSTRAINT [FK_UserComment];
GO
IF OBJECT_ID(N'[photoShare].[FK_CommentPhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Comments] DROP CONSTRAINT [FK_CommentPhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserLike]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Likes] DROP CONSTRAINT [FK_UserLike];
GO
IF OBJECT_ID(N'[photoShare].[FK_LikePhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Likes] DROP CONSTRAINT [FK_LikePhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_GroupSharePhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[SharePhotoes] DROP CONSTRAINT [FK_GroupSharePhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_AlbumShareWith]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[ShareWith] DROP CONSTRAINT [FK_AlbumShareWith];
GO
IF OBJECT_ID(N'[photoShare].[FK_ShareWithPhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Photos1] DROP CONSTRAINT [FK_ShareWithPhoto];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[photoShare].[Users]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[Users];
GO
IF OBJECT_ID(N'[photoShare].[Photos1]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[Photos1];
GO
IF OBJECT_ID(N'[photoShare].[Albums]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[Albums];
GO
IF OBJECT_ID(N'[photoShare].[Groups]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[Groups];
GO
IF OBJECT_ID(N'[photoShare].[Logs]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[Logs];
GO
IF OBJECT_ID(N'[photoShare].[TagInformations]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[TagInformations];
GO
IF OBJECT_ID(N'[photoShare].[Followers]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[Followers];
GO
IF OBJECT_ID(N'[photoShare].[UserGroups]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[UserGroups];
GO
IF OBJECT_ID(N'[photoShare].[Notifications]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[Notifications];
GO
IF OBJECT_ID(N'[photoShare].[PhotoAlbums]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[PhotoAlbums];
GO
IF OBJECT_ID(N'[photoShare].[SharePhotoes]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[SharePhotoes];
GO
IF OBJECT_ID(N'[photoShare].[Comments]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[Comments];
GO
IF OBJECT_ID(N'[photoShare].[Likes]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[Likes];
GO
IF OBJECT_ID(N'[photoShare].[ShareWith]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[ShareWith];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE [photoShare].[Users] (
    [UserID] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [UserName] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NULL,
    [LastLoginTime] datetime  NULL,
    [DateOfBirth] datetime  NULL,
    [Sex] nvarchar(max)  NOT NULL,
    [Phone] int  NOT NULL,
    [ProfilePicId] int  NOT NULL
);
GO

-- Creating table 'Photos1'
CREATE TABLE [photoShare].[Photos1] (
    [PhotoID] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NULL,
    [GeoTag] nvarchar(max)  NULL,
    [Name] nvarchar(max)  NULL,
    [TotalLikes] int  NULL,
    [UploadedUserId] int  NOT NULL,
    [SharedWithId] int  NOT NULL
);
GO

-- Creating table 'Albums'
CREATE TABLE [photoShare].[Albums] (
    [AlbumID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NULL,
    [OwnerId] int  NOT NULL,
    [CoverPicId] int  NOT NULL
);
GO

-- Creating table 'Groups'
CREATE TABLE [photoShare].[Groups] (
    [GroupID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NULL,
    [OwnerId] int  NOT NULL
);
GO

-- Creating table 'Logs'
CREATE TABLE [photoShare].[Logs] (
    [LogID] int IDENTITY(1,1) NOT NULL,
    [Date] datetime  NULL,
    [LoggerId] int  NOT NULL,
    [PhotoId] int  NOT NULL
);
GO

-- Creating table 'TagInformations'
CREATE TABLE [photoShare].[TagInformations] (
    [TagInformationID] int IDENTITY(1,1) NOT NULL,
    [UserUserID] int  NOT NULL,
    [PhotoId] int  NOT NULL
);
GO

-- Creating table 'Followers'
CREATE TABLE [photoShare].[Followers] (
    [FollowerID] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [UserFollowerId] int  NOT NULL
);
GO

-- Creating table 'UserGroups'
CREATE TABLE [photoShare].[UserGroups] (
    [UserGroupID] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [GroupId] int  NOT NULL
);
GO

-- Creating table 'Notifications'
CREATE TABLE [photoShare].[Notifications] (
    [NotificationID] int IDENTITY(1,1) NOT NULL,
    [UserID] int  NOT NULL,
    [LogLogID] int  NOT NULL
);
GO

-- Creating table 'PhotoAlbums'
CREATE TABLE [photoShare].[PhotoAlbums] (
    [PhotoAlbumID] int IDENTITY(1,1) NOT NULL,
    [PhotoId] int  NOT NULL,
    [AlbumId] int  NOT NULL
);
GO

-- Creating table 'SharePhotoes'
CREATE TABLE [photoShare].[SharePhotoes] (
    [ShareUserPhotoID] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NULL,
    [GroupId] int  NULL,
    [PhotoId] int  NULL,
    [AlbumId] int  NULL,
    [GroupSharePhoto_SharePhoto_GroupID] int  NULL
);
GO

-- Creating table 'Comments'
CREATE TABLE [photoShare].[Comments] (
    [CommentID] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [PhotoId] int  NOT NULL
);
GO

-- Creating table 'Likes'
CREATE TABLE [photoShare].[Likes] (
    [LikeID] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [PhotoId] int  NOT NULL
);
GO

-- Creating table 'ShareWith'
CREATE TABLE [photoShare].[ShareWith] (
    [SharerWithId] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [AlbumShareWith_ShareWith_AlbumID] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [UserID] in table 'Users'
ALTER TABLE [photoShare].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserID] ASC);
GO

-- Creating primary key on [PhotoID] in table 'Photos1'
ALTER TABLE [photoShare].[Photos1]
ADD CONSTRAINT [PK_Photos1]
    PRIMARY KEY CLUSTERED ([PhotoID] ASC);
GO

-- Creating primary key on [AlbumID] in table 'Albums'
ALTER TABLE [photoShare].[Albums]
ADD CONSTRAINT [PK_Albums]
    PRIMARY KEY CLUSTERED ([AlbumID] ASC);
GO

-- Creating primary key on [GroupID] in table 'Groups'
ALTER TABLE [photoShare].[Groups]
ADD CONSTRAINT [PK_Groups]
    PRIMARY KEY CLUSTERED ([GroupID] ASC);
GO

-- Creating primary key on [LogID] in table 'Logs'
ALTER TABLE [photoShare].[Logs]
ADD CONSTRAINT [PK_Logs]
    PRIMARY KEY CLUSTERED ([LogID] ASC);
GO

-- Creating primary key on [TagInformationID] in table 'TagInformations'
ALTER TABLE [photoShare].[TagInformations]
ADD CONSTRAINT [PK_TagInformations]
    PRIMARY KEY CLUSTERED ([TagInformationID] ASC);
GO

-- Creating primary key on [FollowerID] in table 'Followers'
ALTER TABLE [photoShare].[Followers]
ADD CONSTRAINT [PK_Followers]
    PRIMARY KEY CLUSTERED ([FollowerID] ASC);
GO

-- Creating primary key on [UserGroupID] in table 'UserGroups'
ALTER TABLE [photoShare].[UserGroups]
ADD CONSTRAINT [PK_UserGroups]
    PRIMARY KEY CLUSTERED ([UserGroupID] ASC);
GO

-- Creating primary key on [NotificationID] in table 'Notifications'
ALTER TABLE [photoShare].[Notifications]
ADD CONSTRAINT [PK_Notifications]
    PRIMARY KEY CLUSTERED ([NotificationID] ASC);
GO

-- Creating primary key on [PhotoAlbumID] in table 'PhotoAlbums'
ALTER TABLE [photoShare].[PhotoAlbums]
ADD CONSTRAINT [PK_PhotoAlbums]
    PRIMARY KEY CLUSTERED ([PhotoAlbumID] ASC);
GO

-- Creating primary key on [ShareUserPhotoID] in table 'SharePhotoes'
ALTER TABLE [photoShare].[SharePhotoes]
ADD CONSTRAINT [PK_SharePhotoes]
    PRIMARY KEY CLUSTERED ([ShareUserPhotoID] ASC);
GO

-- Creating primary key on [CommentID] in table 'Comments'
ALTER TABLE [photoShare].[Comments]
ADD CONSTRAINT [PK_Comments]
    PRIMARY KEY CLUSTERED ([CommentID] ASC);
GO

-- Creating primary key on [LikeID] in table 'Likes'
ALTER TABLE [photoShare].[Likes]
ADD CONSTRAINT [PK_Likes]
    PRIMARY KEY CLUSTERED ([LikeID] ASC);
GO

-- Creating primary key on [SharerWithId] in table 'ShareWith'
ALTER TABLE [photoShare].[ShareWith]
ADD CONSTRAINT [PK_ShareWith]
    PRIMARY KEY CLUSTERED ([SharerWithId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'Followers'
ALTER TABLE [photoShare].[Followers]
ADD CONSTRAINT [FK_UserFollower]
    FOREIGN KEY ([UserId])
    REFERENCES [photoShare].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserFollower'
CREATE INDEX [IX_FK_UserFollower]
ON [photoShare].[Followers]
    ([UserId]);
GO

-- Creating foreign key on [UserFollowerId] in table 'Followers'
ALTER TABLE [photoShare].[Followers]
ADD CONSTRAINT [FK_UserFollower1]
    FOREIGN KEY ([UserFollowerId])
    REFERENCES [photoShare].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserFollower1'
CREATE INDEX [IX_FK_UserFollower1]
ON [photoShare].[Followers]
    ([UserFollowerId]);
GO

-- Creating foreign key on [UserId] in table 'UserGroups'
ALTER TABLE [photoShare].[UserGroups]
ADD CONSTRAINT [FK_UserUserGroup]
    FOREIGN KEY ([UserId])
    REFERENCES [photoShare].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserUserGroup'
CREATE INDEX [IX_FK_UserUserGroup]
ON [photoShare].[UserGroups]
    ([UserId]);
GO

-- Creating foreign key on [GroupId] in table 'UserGroups'
ALTER TABLE [photoShare].[UserGroups]
ADD CONSTRAINT [FK_UserGroupGroup]
    FOREIGN KEY ([GroupId])
    REFERENCES [photoShare].[Groups]
        ([GroupID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserGroupGroup'
CREATE INDEX [IX_FK_UserGroupGroup]
ON [photoShare].[UserGroups]
    ([GroupId]);
GO

-- Creating foreign key on [OwnerId] in table 'Groups'
ALTER TABLE [photoShare].[Groups]
ADD CONSTRAINT [FK_UserGroupOwner]
    FOREIGN KEY ([OwnerId])
    REFERENCES [photoShare].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserGroupOwner'
CREATE INDEX [IX_FK_UserGroupOwner]
ON [photoShare].[Groups]
    ([OwnerId]);
GO

-- Creating foreign key on [OwnerId] in table 'Albums'
ALTER TABLE [photoShare].[Albums]
ADD CONSTRAINT [FK_AlbumUser]
    FOREIGN KEY ([OwnerId])
    REFERENCES [photoShare].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AlbumUser'
CREATE INDEX [IX_FK_AlbumUser]
ON [photoShare].[Albums]
    ([OwnerId]);
GO

-- Creating foreign key on [UserUserID] in table 'TagInformations'
ALTER TABLE [photoShare].[TagInformations]
ADD CONSTRAINT [FK_UserTagInformation]
    FOREIGN KEY ([UserUserID])
    REFERENCES [photoShare].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserTagInformation'
CREATE INDEX [IX_FK_UserTagInformation]
ON [photoShare].[TagInformations]
    ([UserUserID]);
GO

-- Creating foreign key on [PhotoId] in table 'TagInformations'
ALTER TABLE [photoShare].[TagInformations]
ADD CONSTRAINT [FK_PhotoTagInformation]
    FOREIGN KEY ([PhotoId])
    REFERENCES [photoShare].[Photos1]
        ([PhotoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PhotoTagInformation'
CREATE INDEX [IX_FK_PhotoTagInformation]
ON [photoShare].[TagInformations]
    ([PhotoId]);
GO

-- Creating foreign key on [UserID] in table 'Notifications'
ALTER TABLE [photoShare].[Notifications]
ADD CONSTRAINT [FK_UserNotification]
    FOREIGN KEY ([UserID])
    REFERENCES [photoShare].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserNotification'
CREATE INDEX [IX_FK_UserNotification]
ON [photoShare].[Notifications]
    ([UserID]);
GO

-- Creating foreign key on [LogLogID] in table 'Notifications'
ALTER TABLE [photoShare].[Notifications]
ADD CONSTRAINT [FK_LogNotification]
    FOREIGN KEY ([LogLogID])
    REFERENCES [photoShare].[Logs]
        ([LogID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LogNotification'
CREATE INDEX [IX_FK_LogNotification]
ON [photoShare].[Notifications]
    ([LogLogID]);
GO

-- Creating foreign key on [LoggerId] in table 'Logs'
ALTER TABLE [photoShare].[Logs]
ADD CONSTRAINT [FK_UserLog]
    FOREIGN KEY ([LoggerId])
    REFERENCES [photoShare].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserLog'
CREATE INDEX [IX_FK_UserLog]
ON [photoShare].[Logs]
    ([LoggerId]);
GO

-- Creating foreign key on [PhotoId] in table 'Logs'
ALTER TABLE [photoShare].[Logs]
ADD CONSTRAINT [FK_LogPhoto]
    FOREIGN KEY ([PhotoId])
    REFERENCES [photoShare].[Photos1]
        ([PhotoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LogPhoto'
CREATE INDEX [IX_FK_LogPhoto]
ON [photoShare].[Logs]
    ([PhotoId]);
GO

-- Creating foreign key on [CoverPicId] in table 'Albums'
ALTER TABLE [photoShare].[Albums]
ADD CONSTRAINT [FK_AlbumPhoto]
    FOREIGN KEY ([CoverPicId])
    REFERENCES [photoShare].[Photos1]
        ([PhotoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AlbumPhoto'
CREATE INDEX [IX_FK_AlbumPhoto]
ON [photoShare].[Albums]
    ([CoverPicId]);
GO

-- Creating foreign key on [PhotoId] in table 'PhotoAlbums'
ALTER TABLE [photoShare].[PhotoAlbums]
ADD CONSTRAINT [FK_PhotoAlbumPhoto]
    FOREIGN KEY ([PhotoId])
    REFERENCES [photoShare].[Photos1]
        ([PhotoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PhotoAlbumPhoto'
CREATE INDEX [IX_FK_PhotoAlbumPhoto]
ON [photoShare].[PhotoAlbums]
    ([PhotoId]);
GO

-- Creating foreign key on [AlbumId] in table 'PhotoAlbums'
ALTER TABLE [photoShare].[PhotoAlbums]
ADD CONSTRAINT [FK_AlbumPhotoAlbum]
    FOREIGN KEY ([AlbumId])
    REFERENCES [photoShare].[Albums]
        ([AlbumID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AlbumPhotoAlbum'
CREATE INDEX [IX_FK_AlbumPhotoAlbum]
ON [photoShare].[PhotoAlbums]
    ([AlbumId]);
GO

-- Creating foreign key on [ProfilePicId] in table 'Users'
ALTER TABLE [photoShare].[Users]
ADD CONSTRAINT [FK_UserPhoto]
    FOREIGN KEY ([ProfilePicId])
    REFERENCES [photoShare].[Photos1]
        ([PhotoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserPhoto'
CREATE INDEX [IX_FK_UserPhoto]
ON [photoShare].[Users]
    ([ProfilePicId]);
GO

-- Creating foreign key on [UploadedUserId] in table 'Photos1'
ALTER TABLE [photoShare].[Photos1]
ADD CONSTRAINT [FK_UserPhoto1]
    FOREIGN KEY ([UploadedUserId])
    REFERENCES [photoShare].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserPhoto1'
CREATE INDEX [IX_FK_UserPhoto1]
ON [photoShare].[Photos1]
    ([UploadedUserId]);
GO

-- Creating foreign key on [UserId] in table 'SharePhotoes'
ALTER TABLE [photoShare].[SharePhotoes]
ADD CONSTRAINT [FK_UserShareUserPhoto]
    FOREIGN KEY ([UserId])
    REFERENCES [photoShare].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserShareUserPhoto'
CREATE INDEX [IX_FK_UserShareUserPhoto]
ON [photoShare].[SharePhotoes]
    ([UserId]);
GO

-- Creating foreign key on [PhotoId] in table 'SharePhotoes'
ALTER TABLE [photoShare].[SharePhotoes]
ADD CONSTRAINT [FK_ShareUserPhotoPhoto]
    FOREIGN KEY ([PhotoId])
    REFERENCES [photoShare].[Photos1]
        ([PhotoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ShareUserPhotoPhoto'
CREATE INDEX [IX_FK_ShareUserPhotoPhoto]
ON [photoShare].[SharePhotoes]
    ([PhotoId]);
GO

-- Creating foreign key on [UserId] in table 'Comments'
ALTER TABLE [photoShare].[Comments]
ADD CONSTRAINT [FK_UserComment]
    FOREIGN KEY ([UserId])
    REFERENCES [photoShare].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserComment'
CREATE INDEX [IX_FK_UserComment]
ON [photoShare].[Comments]
    ([UserId]);
GO

-- Creating foreign key on [PhotoId] in table 'Comments'
ALTER TABLE [photoShare].[Comments]
ADD CONSTRAINT [FK_CommentPhoto]
    FOREIGN KEY ([PhotoId])
    REFERENCES [photoShare].[Photos1]
        ([PhotoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CommentPhoto'
CREATE INDEX [IX_FK_CommentPhoto]
ON [photoShare].[Comments]
    ([PhotoId]);
GO

-- Creating foreign key on [UserId] in table 'Likes'
ALTER TABLE [photoShare].[Likes]
ADD CONSTRAINT [FK_UserLike]
    FOREIGN KEY ([UserId])
    REFERENCES [photoShare].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserLike'
CREATE INDEX [IX_FK_UserLike]
ON [photoShare].[Likes]
    ([UserId]);
GO

-- Creating foreign key on [PhotoId] in table 'Likes'
ALTER TABLE [photoShare].[Likes]
ADD CONSTRAINT [FK_LikePhoto]
    FOREIGN KEY ([PhotoId])
    REFERENCES [photoShare].[Photos1]
        ([PhotoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LikePhoto'
CREATE INDEX [IX_FK_LikePhoto]
ON [photoShare].[Likes]
    ([PhotoId]);
GO

-- Creating foreign key on [GroupSharePhoto_SharePhoto_GroupID] in table 'SharePhotoes'
ALTER TABLE [photoShare].[SharePhotoes]
ADD CONSTRAINT [FK_GroupSharePhoto]
    FOREIGN KEY ([GroupSharePhoto_SharePhoto_GroupID])
    REFERENCES [photoShare].[Groups]
        ([GroupID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_GroupSharePhoto'
CREATE INDEX [IX_FK_GroupSharePhoto]
ON [photoShare].[SharePhotoes]
    ([GroupSharePhoto_SharePhoto_GroupID]);
GO

-- Creating foreign key on [AlbumShareWith_ShareWith_AlbumID] in table 'ShareWith'
ALTER TABLE [photoShare].[ShareWith]
ADD CONSTRAINT [FK_AlbumShareWith]
    FOREIGN KEY ([AlbumShareWith_ShareWith_AlbumID])
    REFERENCES [photoShare].[Albums]
        ([AlbumID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AlbumShareWith'
CREATE INDEX [IX_FK_AlbumShareWith]
ON [photoShare].[ShareWith]
    ([AlbumShareWith_ShareWith_AlbumID]);
GO

-- Creating foreign key on [SharedWithId] in table 'Photos1'
ALTER TABLE [photoShare].[Photos1]
ADD CONSTRAINT [FK_ShareWithPhoto]
    FOREIGN KEY ([SharedWithId])
    REFERENCES [photoShare].[ShareWith]
        ([SharerWithId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ShareWithPhoto'
CREATE INDEX [IX_FK_ShareWithPhoto]
ON [photoShare].[Photos1]
    ([SharedWithId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------