
using System.Linq;
using PhotoSharingDataModel;

namespace PhotoSharingBLL
{
    public class PhotoData
    {

        public void StorePhotoData()
        {
            //FileStream FS = new FileStream(@"C:\\Users\\Rohit\\Pictures\\Saved Pictures\\Love.jpg", FileMode.Open, FileAccess.Read);
            //byte[] img = new byte[FS.Length];
            //FS.Read(img, 0, Convert.ToInt32(FS.Length));

            ////var users = new PhotoSharingDataModel.(FS);
            //using (var photoSharing = new PhotoSharingContainer())
            //{
            //    photoSharing.SavePhoto(img);
            //};
            //return users;
        }

        public byte[] LoadPhoto(int photoId)
        {
            var photoResult = new ReadPhoto_Result();
            using (var photoSharing = new PhotoSharingContainer())
            {
                photoResult = photoSharing.ReadPhoto(photoId).First();
            };
            return photoResult.Data;
        }
    }
}

