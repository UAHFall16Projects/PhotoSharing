using System;
using PhotoSharingDataModel;
using System.Linq;
using System.Collections.Generic;

namespace PhotoSharingBLL
{
    public class User
    {
        public PhotoSharingDataModel.GetUsersByUserId_Result GetUserByID()
        {
            var users = new PhotoSharingDataModel.GetUsersByUserId_Result();
            using (var photoSharing = new PhotoSharingContainer())
            {
                users = photoSharing.GetUsersByUserId(1).First();
            };
            return users;
        }
    }
}
