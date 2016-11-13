
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/12/2016 19:40:27
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

IF OBJECT_ID(N'[photoShare].[FK_LogPhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Logs] DROP CONSTRAINT [FK_LogPhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_LogTypeLog]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Logs] DROP CONSTRAINT [FK_LogTypeLog];
GO
IF OBJECT_ID(N'[photoShare].[FK_PhotoDataPhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Photos] DROP CONSTRAINT [FK_PhotoDataPhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_ShareUserPhotoPhoto]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[SharePhotoes] DROP CONSTRAINT [FK_ShareUserPhotoPhoto];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserFollower]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Followers] DROP CONSTRAINT [FK_UserFollower];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserFollower1]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Followers] DROP CONSTRAINT [FK_UserFollower1];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserLog]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Logs] DROP CONSTRAINT [FK_UserLog];
GO
IF OBJECT_ID(N'[photoShare].[FK_UserLog1]', 'F') IS NOT NULL
    ALTER TABLE [photoShare].[Logs] DROP CONSTRAINT [FK_UserLog1];
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

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[photoShare].[Followers]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[Followers];
GO
IF OBJECT_ID(N'[photoShare].[Logs]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[Logs];
GO
IF OBJECT_ID(N'[photoShare].[LogTypes]', 'U') IS NOT NULL
    DROP TABLE [photoShare].[LogTypes];
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

-- Creating table 'Followers'
CREATE TABLE [photoShare].[Followers] (
    [FollowerID] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NOT NULL,
    [UserFollowerId] nvarchar(128)  NOT NULL
);
GO

-- Creating table 'LogTypes'
CREATE TABLE [photoShare].[LogTypes] (
    [LogTypeID] int IDENTITY(1,1) NOT NULL,
    [Type] nvarchar(256)  NOT NULL
);
GO

-- Creating table 'SharePhotoes'
CREATE TABLE [photoShare].[SharePhotoes] (
    [SharePhotoID] int IDENTITY(1,1) NOT NULL,
    [UserId] nvarchar(128)  NULL,
    [GroupId] int  NULL,
    [PhotoId] int  NULL,
    [AlbumId] int  NULL
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
    [LogTypeId] int  NULL,
    [Description] nvarchar(max)  NULL
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

-- Creating primary key on [FollowerID] in table 'Followers'
ALTER TABLE [photoShare].[Followers]
ADD CONSTRAINT [PK_Followers]
    PRIMARY KEY CLUSTERED ([FollowerID] ASC);
GO

-- Creating primary key on [LogTypeID] in table 'LogTypes'
ALTER TABLE [photoShare].[LogTypes]
ADD CONSTRAINT [PK_LogTypes]
    PRIMARY KEY CLUSTERED ([LogTypeID] ASC);
GO

-- Creating primary key on [SharePhotoID] in table 'SharePhotoes'
ALTER TABLE [photoShare].[SharePhotoes]
ADD CONSTRAINT [PK_SharePhotoes]
    PRIMARY KEY CLUSTERED ([SharePhotoID] ASC);
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