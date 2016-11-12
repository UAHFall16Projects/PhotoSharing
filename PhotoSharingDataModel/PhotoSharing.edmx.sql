
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/11/2016 19:58:55
-- Generated from EDMX file: C:\Users\Rohit\Documents\GitHub\PhotoSharing\PhotoSharingDataModel\PhotoSharing.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [PhotoSharing];
GO
IF SCHEMA_ID(N'photoShare') IS NULL EXECUTE(N'CREATE SCHEMA [photoShare]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[photoShare].[FK_AlbumPhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Albums] DROP CONSTRAINT [FK_AlbumPhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_AlbumPhotoAlbum]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[PhotoAlbums] DROP CONSTRAINT [FK_AlbumPhotoAlbum];
GO
IF OBJECT_ID(N'[photoShare].[FK_AlbumUser]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Albums] DROP CONSTRAINT [FK_AlbumUser];
GO
IF OBJECT_ID(N'[photoShare].[FK_CommentPhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Comments] DROP CONSTRAINT [FK_CommentPhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_GroupSharePhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[SharePhotoes] DROP CONSTRAINT [FK_GroupSharePhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_LikePhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Likes] DROP CONSTRAINT [FK_LikePhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_LogPhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Logs] DROP CONSTRAINT [FK_LogPhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_PhotoAlbumPhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[PhotoAlbums] DROP CONSTRAINT [FK_PhotoAlbumPhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_PhotoDataPhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Photos] DROP CONSTRAINT [FK_PhotoDataPhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_PhotoTagInformation]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[TagInformations] DROP CONSTRAINT [FK_PhotoTagInformation];
GO
IF OBJECT_ID(N'[photoShare].[FK_ShareUserPhotoPhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[SharePhotoes] DROP CONSTRAINT [FK_ShareUserPhotoPhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserComment]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Comments] DROP CONSTRAINT [FK_UserComment];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserFollower]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Followers] DROP CONSTRAINT [FK_UserFollower];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserFollower1]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Followers] DROP CONSTRAINT [FK_UserFollower1];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserGroupGroup]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[UserGroups] DROP CONSTRAINT [FK_UserGroupGroup];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserGroupOwner]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Groups] DROP CONSTRAINT [FK_UserGroupOwner];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserLike]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Likes] DROP CONSTRAINT [FK_UserLike];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserLog]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Logs] DROP CONSTRAINT [FK_UserLog];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserPhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Users] DROP CONSTRAINT [FK_UserPhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserPhoto1]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Photos] DROP CONSTRAINT [FK_UserPhoto1];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserShareUserPhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[SharePhotoes] DROP CONSTRAINT [FK_UserShareUserPhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserTagInformation]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[TagInformations] DROP CONSTRAINT [FK_UserTagInformation];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserUserGroup]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[UserGroups] DROP CONSTRAINT [FK_UserUserGroup];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[photoShare].[Albums]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[Albums];
GO
IF OBJECT_ID(N'[photoShare].[Comments]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[Comments];
GO
IF OBJECT_ID(N'[photoShare].[Followers]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[Followers];
GO
IF OBJECT_ID(N'[photoShare].[Groups]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[Groups];
GO
IF OBJECT_ID(N'[photoShare].[Likes]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[Likes];
GO
IF OBJECT_ID(N'[photoShare].[Logs]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[Logs];
GO
IF OBJECT_ID(N'[photoShare].[PhotoAlbums]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[PhotoAlbums];
GO
IF OBJECT_ID(N'[photoShare].[PhotoFiles]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[PhotoFiles];
GO
IF OBJECT_ID(N'[photoShare].[Photos]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[Photos];
GO
IF OBJECT_ID(N'[photoShare].[SharePhotoes]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[SharePhotoes];
GO
IF OBJECT_ID(N'[photoShare].[TagInformations]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[TagInformations];
GO
IF OBJECT_ID(N'[photoShare].[UserGroups]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[UserGroups];
GO
IF OBJECT_ID(N'[photoShare].[Users]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[Users];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE [photoShare].[Users] (
    [UserID] nvarchar(128)  NOT NULL,
    [FirstName] nvarchar(max)  NULL,
    [LastName] nvarchar(max)  NULL,
    [Email] nvarchar(256)  NOT NULL,
    [UserName] nvarchar(256)  NULL,
    [Password] nvarchar(max)  NULL,
    [LastLoginTime] datetime  NULL,
    [DateOfBirth] datetime  NULL,
    [Sex] varchar(1)  NULL,
    [Phone] nvarchar(max)  NULL,
    [ProfilePicId] int  NULL
);
GO

-- Creating table 'Photos'
CREATE TABLE [photoShare].[Photos] (
    [PhotoID] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NULL,
    [GeoTag] nvarchar(max)  NULL,
    [Name] nvarchar(max)  NULL,
    [TotalLikes] int  NULL,
    [UploadedUserId] nvarchar(128)  NOT NULL,
    [PhotoFileId] int  NOT NULL,
    [Deleted] bit  NULL
);
GO

-- Creating table 'Albums'
CREATE TABLE [photoShare].[Albums] (
    [AlbumID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NULL,
    [OwnerId] nvarchar(128)  NOT NULL,
    [CoverPicId] int  NOT NULL
);
GO

-- Creating table 'Groups'
CREATE TABLE [photoShare].[Groups] (
    [GroupID] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NULL,
    [OwnerId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'TagInformations'
CREATE TABLE [photoShare].[TagInformations] (
    [TagInformationID] int IDENTITY(1,1) NOT NULL,
    [UserUserID] nvarchar(128)  NOT NULL,
    [PhotoId] int  NOT NULL
);
GO

-- Creating table 'Followers'
CREATE TABLE [photoShare].[Followers] (
    [FollowerID] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [UserFollowerId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'UserGroups'
CREATE TABLE [photoShare].[UserGroups] (
    [UserGroupID] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [GroupId] int  NOT NULL
);
GO

-- Creating table 'LogTypes'
CREATE TABLE [photoShare].[LogTypes] (
    [LogTypeID] int IDENTITY(1,1) NOT NULL,
    [Type] nvarchar(256)  NOT NULL
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
    [SharePhotoID] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NULL,
    [GroupId] int  NULL,
    [PhotoId] int  NULL,
    [AlbumId] int  NULL,
    [GroupSharePhoto_SharePhoto_GroupID] int  NULL
);
GO

-- Creating table 'Comments'
CREATE TABLE [photoShare].[Comments] (
    [CommentID] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [PhotoId] int  NOT NULL
);
GO

-- Creating table 'Likes'
CREATE TABLE [photoShare].[Likes] (
    [LikeID] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [PhotoId] int  NOT NULL
);
GO

-- Creating table 'PhotoFiles'
CREATE TABLE [photoShare].[PhotoFiles] (
    [PhotoFileID] int IDENTITY(1,1) NOT NULL,
    [FileName] nvarchar(255)  NULL,
    [ContentType] nvarchar(100)  NULL,
    [Content] varbinary(max)  NOT NULL
);
GO

-- Creating table 'Logs'
CREATE TABLE [photoShare].[Logs] (
    [LogID] int IDENTITY(1,1) NOT NULL,
    [LogDate] datetime  NULL,
    [LoggerId] nvarchar(128)  NULL,
    [PhotoId] int  NULL,
    [AffectedId] nvarchar(128)  NULL,
    [LogTypeId] int  NULL
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

-- Creating primary key on [PhotoID] in table 'Photos'
ALTER TABLE [photoShare].[Photos]
ADD CONSTRAINT [PK_Photos]
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

-- Creating primary key on [LogTypeID] in table 'LogTypes'
ALTER TABLE [photoShare].[LogTypes]
ADD CONSTRAINT [PK_LogTypes]
    PRIMARY KEY CLUSTERED ([LogTypeID] ASC);
GO

-- Creating primary key on [PhotoAlbumID] in table 'PhotoAlbums'
ALTER TABLE [photoShare].[PhotoAlbums]
ADD CONSTRAINT [PK_PhotoAlbums]
    PRIMARY KEY CLUSTERED ([PhotoAlbumID] ASC);
GO

-- Creating primary key on [SharePhotoID] in table 'SharePhotoes'
ALTER TABLE [photoShare].[SharePhotoes]
ADD CONSTRAINT [PK_SharePhotoes]
    PRIMARY KEY CLUSTERED ([SharePhotoID] ASC);
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

-- Creating primary key on [PhotoFileID] in table 'PhotoFiles'
ALTER TABLE [photoShare].[PhotoFiles]
ADD CONSTRAINT [PK_PhotoFiles]
    PRIMARY KEY CLUSTERED ([PhotoFileID] ASC);
GO

-- Creating primary key on [LogID] in table 'Logs'
ALTER TABLE [photoShare].[Logs]
ADD CONSTRAINT [PK_Logs]
    PRIMARY KEY CLUSTERED ([LogID] ASC);
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
    REFERENCES [photoShare].[Photos]
        ([PhotoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PhotoTagInformation'
CREATE INDEX [IX_FK_PhotoTagInformation]
ON [photoShare].[TagInformations]
    ([PhotoId]);
GO

-- Creating foreign key on [CoverPicId] in table 'Albums'
ALTER TABLE [photoShare].[Albums]
ADD CONSTRAINT [FK_AlbumPhoto]
    FOREIGN KEY ([CoverPicId])
    REFERENCES [photoShare].[Photos]
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
    REFERENCES [photoShare].[Photos]
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
    REFERENCES [photoShare].[Photos]
        ([PhotoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserPhoto'
CREATE INDEX [IX_FK_UserPhoto]
ON [photoShare].[Users]
    ([ProfilePicId]);
GO

-- Creating foreign key on [UploadedUserId] in table 'Photos'
ALTER TABLE [photoShare].[Photos]
ADD CONSTRAINT [FK_UserPhoto1]
    FOREIGN KEY ([UploadedUserId])
    REFERENCES [photoShare].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserPhoto1'
CREATE INDEX [IX_FK_UserPhoto1]
ON [photoShare].[Photos]
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
    REFERENCES [photoShare].[Photos]
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
    REFERENCES [photoShare].[Photos]
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
    REFERENCES [photoShare].[Photos]
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

-- Creating foreign key on [PhotoFileId] in table 'Photos'
ALTER TABLE [photoShare].[Photos]
ADD CONSTRAINT [FK_PhotoDataPhoto]
    FOREIGN KEY ([PhotoFileId])
    REFERENCES [photoShare].[PhotoFiles]
        ([PhotoFileID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PhotoDataPhoto'
CREATE INDEX [IX_FK_PhotoDataPhoto]
ON [photoShare].[Photos]
    ([PhotoFileId]);
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
    REFERENCES [photoShare].[Photos]
        ([PhotoID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LogPhoto'
CREATE INDEX [IX_FK_LogPhoto]
ON [photoShare].[Logs]
    ([PhotoId]);
GO

-- Creating foreign key on [LogTypeId] in table 'Logs'
ALTER TABLE [photoShare].[Logs]
ADD CONSTRAINT [FK_LogTypeLog]
    FOREIGN KEY ([LogTypeId])
    REFERENCES [photoShare].[LogTypes]
        ([LogTypeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LogTypeLog'
CREATE INDEX [IX_FK_LogTypeLog]
ON [photoShare].[Logs]
    ([LogTypeId]);
GO

-- Creating foreign key on [AffectedId] in table 'Logs'
ALTER TABLE [photoShare].[Logs]
ADD CONSTRAINT [FK_UserLog1]
    FOREIGN KEY ([AffectedId])
    REFERENCES [photoShare].[Users]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserLog1'
CREATE INDEX [IX_FK_UserLog1]
ON [photoShare].[Logs]
    ([AffectedId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------