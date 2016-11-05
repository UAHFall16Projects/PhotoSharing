using PhotoSharingDataModel;
using System.Linq;

namespace PhotoSharingBLL
{
    public class User
    {
        public GetUsersByUserId_Result GetUserByID(string userId)

        {
            var users = new GetUsersByUserId_Result();
            using (var photoSharing = new PhotoSharingContainer())
            {
                users = photoSharing.GetUsersByUserId(userId).First();
            };
            return users;
        }
    }
}
