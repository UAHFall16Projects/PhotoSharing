using PhotoSharingDataModel;
using System.Linq;

namespace PhotoSharingBLL
{
    public class User
    {
        
        public void SaveUserProfileDetails(PhotoSharingDataModel.User user)
        {
            using (var photoSharing = new PhotoSharingContainer())
            {
                var savedUser = photoSharing.Users.First(usr => usr.UserID == user.UserID);
                savedUser.UserName = user.UserName;
                savedUser.Email = user.UserName;
                savedUser.FirstName = user.FirstName;
                savedUser.LastName = user.LastName;
                savedUser.Sex = user.Sex;
                savedUser.Phone = user.Phone;
                photoSharing.SaveChanges();
            };
        }

        public void SaveUserProfileDetails(PhotoSharingDataModel.GetUsersByUserId_Result user)
        {
            using (var photoSharing = new PhotoSharingContainer())
            {
                //if
                //var savedUser = photoSharing.Users.First(usr => usr.UserID == user.UserID);
                //savedUser.UserName = user.UserName;
                //savedUser.Email = user.UserName;
                //savedUser.FirstName = user.FirstName;
                //savedUser.LastName = user.LastName;
                //savedUser.Sex = user.Sex;
                //savedUser.Phone = user.Phone;
                //photoSharing.SaveChanges();
            };
        }
    }
}
