﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PhotoSharingDataModel
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class PhotoSharingContainer : DbContext
    {
        public PhotoSharingContainer()
            : base("name=PhotoSharingContainer")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Photo> Photos { get; set; }
        public virtual DbSet<Follower> Followers { get; set; }
        public virtual DbSet<LogType> LogTypes { get; set; }
        public virtual DbSet<SharePhoto> SharePhotoes { get; set; }
        public virtual DbSet<PhotoFile> PhotoFiles { get; set; }
        public virtual DbSet<Log> Logs { get; set; }
    
        public virtual ObjectResult<GetFollowersByUserId_Result> GetFollowersByUserId(string userId)
        {
            var userIdParameter = userId != null ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetFollowersByUserId_Result>("GetFollowersByUserId", userIdParameter);
        }
    
        public virtual ObjectResult<GetFollowingNotifications_Result> GetFollowingNotifications(string userId)
        {
            var userIdParameter = userId != null ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetFollowingNotifications_Result>("GetFollowingNotifications", userIdParameter);
        }
    
        public virtual ObjectResult<GetFollowingsByUserId_Result> GetFollowingsByUserId(string userId)
        {
            var userIdParameter = userId != null ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetFollowingsByUserId_Result>("GetFollowingsByUserId", userIdParameter);
        }
    
        public virtual ObjectResult<GetPhotosByUserId_Result> GetPhotosByUserId(string userId)
        {
            var userIdParameter = userId != null ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetPhotosByUserId_Result>("GetPhotosByUserId", userIdParameter);
        }
    
        public virtual ObjectResult<GetSharingNotifications_Result> GetSharingNotifications(string userId)
        {
            var userIdParameter = userId != null ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetSharingNotifications_Result>("GetSharingNotifications", userIdParameter);
        }
    
        public virtual ObjectResult<GetUserLikeUserName_Result> GetUserLikeUserName(string userName, string userId)
        {
            var userNameParameter = userName != null ?
                new ObjectParameter("UserName", userName) :
                new ObjectParameter("UserName", typeof(string));
    
            var userIdParameter = userId != null ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetUserLikeUserName_Result>("GetUserLikeUserName", userNameParameter, userIdParameter);
        }
    
        public virtual ObjectResult<GetUsersByUserId_Result> GetUsersByUserId(string userId)
        {
            var userIdParameter = userId != null ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetUsersByUserId_Result>("GetUsersByUserId", userIdParameter);
        }
    
        public virtual ObjectResult<ReadPhoto_Result> ReadPhoto(Nullable<int> photoFileId)
        {
            var photoFileIdParameter = photoFileId.HasValue ?
                new ObjectParameter("photoFileId", photoFileId) :
                new ObjectParameter("photoFileId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<ReadPhoto_Result>("ReadPhoto", photoFileIdParameter);
        }
    }
}
