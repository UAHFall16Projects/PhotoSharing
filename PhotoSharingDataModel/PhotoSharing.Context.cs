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
        public virtual DbSet<Photo> Photos1 { get; set; }
        public virtual DbSet<Album> Albums { get; set; }
        public virtual DbSet<Group> Groups { get; set; }
        public virtual DbSet<Log> Logs { get; set; }
        public virtual DbSet<TagInformation> TagInformations { get; set; }
        public virtual DbSet<Follower> Followers { get; set; }
        public virtual DbSet<UserGroup> UserGroups { get; set; }
        public virtual DbSet<Notification> Notifications { get; set; }
        public virtual DbSet<PhotoAlbum> PhotoAlbums { get; set; }
        public virtual DbSet<SharePhoto> SharePhotoes { get; set; }
        public virtual DbSet<Comment> Comments { get; set; }
        public virtual DbSet<Like> Likes { get; set; }
        public virtual DbSet<ShareWith> ShareWith { get; set; }
    }
}
