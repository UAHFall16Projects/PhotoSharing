//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Photo
    {
        public int PhotoID { get; set; }
        public string Description { get; set; }
        public string GeoTag { get; set; }
        public string Name { get; set; }
        public Nullable<int> TotalLikes { get; set; }
        public string UploadedUserId { get; set; }
        public int PhotoFileId { get; set; }
    }
}
