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
    
    public partial class Log
    {
        public int LogID { get; set; }
        public Nullable<System.DateTime> LogDate { get; set; }
        public string LoggerId { get; set; }
        public Nullable<int> PhotoId { get; set; }
        public string AffectedId { get; set; }
        public Nullable<int> LogTypeId { get; set; }
    }
}
