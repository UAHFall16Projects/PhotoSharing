using Microsoft.AspNet.Identity;
using PhotoSharing.Models;
using PhotoSharingDataModel;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PhotoSharing.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        [Authorize]
        public ActionResult Index()
        {
            return View();
        }

        [Authorize]
        public ActionResult UserPhotos()
        {
            UserPhotoViewModel userPhotoVM = new UserPhotoViewModel();
            using (var photoSharing = new PhotoSharingContainer())
            {
                List<GetPhotosByUserId_Result> userPhotos = photoSharing.GetPhotosByUserId(User.Identity.GetUserId()).ToList();
                userPhotoVM = new UserPhotoViewModel(userPhotos, User.Identity.GetUserId());
            }

            return PartialView(userPhotoVM);
        }

        [Authorize]
        public ActionResult UploadPhoto()
        {
            UploadUserPhotoViewModel photoVM = new UploadUserPhotoViewModel();
            return PartialView(photoVM);
        }

        [HttpPost]
        [Authorize]
        public ActionResult UploadUserPhoto(UploadUserPhotoViewModel photoVM, HttpPostedFileBase uploadUserPhoto)
        {
            if (uploadUserPhoto != null && uploadUserPhoto.ContentLength > 0)
            {
                using (var photoSharing = new PhotoSharingContainer())
                {
                    //Profile Image has been uploaded
                    //Photo Data object stored to DB
                    PhotoFile photoData = new PhotoFile();
                    photoData.Content = new byte[uploadUserPhoto.ContentLength];
                    photoData.ContentType = uploadUserPhoto.ContentType;
                    uploadUserPhoto.InputStream.Read(photoData.Content, 0, uploadUserPhoto.ContentLength);
                    var savedPhotoFile = photoSharing.PhotoFiles.Add(photoData);
                    photoSharing.SaveChanges();

                    
                    //Photo object stored to DB
                    Photo photo = new Photo();
                    photo.Name = uploadUserPhoto.FileName;
                    if (photoVM.Description != null)
                        photo.Description = photoVM.Description;
                    photo.UploadedUserId = User.Identity.GetUserId();
                    photo.PhotoFileId = savedPhotoFile.PhotoFileID;
                    var savedPhoto = photoSharing.Photos.Add(photo);
                    photoSharing.SaveChanges();

                    var log = new Log();
                    log.LogDate = System.DateTime.Now;
                    log.LoggerId = User.Identity.GetUserId();
                    log.LogTypeId = (int)Models.LogType.Upload;
                    log.PhotoId = savedPhotoFile.PhotoFileID;
                    log.Description = "User Uploaded Photo";
                    photoSharing.Logs.Add(log);
                    photoSharing.SaveChanges();

                }
            }
            return RedirectToAction("Index");
        }

        [Authorize]
        [HttpPost]
        public ActionResult DeletePhoto(int photoId)
        {
            using (var photoSharing = new PhotoSharingContainer())
            {
                var storedPhoto = photoSharing.Photos.Where(qry => qry.PhotoID == photoId).FirstOrDefault();
                storedPhoto.Deleted = true;
                photoSharing.SaveChanges();

                var log = new Log();
                log.LogDate = System.DateTime.Now;
                log.LoggerId = User.Identity.GetUserId();
                log.LogTypeId = (int)Models.LogType.Delete;
                log.PhotoId = photoId;
                log.Description = "User Deleted Photo";
                photoSharing.Logs.Add(log);
                photoSharing.SaveChanges();
            }
            return RedirectToAction("UserPhotos");
        }

        [Authorize]
        public ActionResult SharePhoto(int sharePhotoId)
        {
            ShareUserPhotoViewModel shareUserPhotoVM = new ShareUserPhotoViewModel();
            shareUserPhotoVM.SharedPhotoId = sharePhotoId;
            return PartialView(shareUserPhotoVM);
        }

        [HttpPost]
        [Authorize]
        public ActionResult SharePhoto(ShareUserPhotoViewModel sharephotoVM)
        {
            var sharedUsernames = sharephotoVM.SearchUser.Trim().ToString().Split(',');
            using (var photoSharing = new PhotoSharingContainer())
            {
                foreach (var userName in sharedUsernames.Where(qry => !string.IsNullOrEmpty(qry.Trim())).Select(qry => qry.Trim()))
                {
                    var userToShare = photoSharing.Users.Where(qry => qry.UserName == userName).FirstOrDefault();
                    if (userToShare != null)
                    {
                        SharePhoto sharePhoto = new SharePhoto();
                        sharePhoto.PhotoId = sharephotoVM.SharedPhotoId;
                        sharePhoto.UserId = userToShare.UserID;
                        photoSharing.SharePhotoes.Add(sharePhoto);


                        var log = new Log();
                        log.LogDate = System.DateTime.Now;
                        log.LoggerId = User.Identity.GetUserId();
                        log.LogTypeId = (int)Models.LogType.Share;
                        log.PhotoId = sharephotoVM.SharedPhotoId;
                        log.AffectedId = userToShare.UserID;
                        log.Description = "User Shared Photo";
                        photoSharing.Logs.Add(log);
                        photoSharing.SaveChanges();
                    }
                }
                photoSharing.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        [Authorize]
        public JsonResult GetUsers(string username)
        {
            var foundUsers = new List<GetUserLikeUserName_Result>();
            using (var photoSharing = new PhotoSharingContainer())
            {
                foundUsers = photoSharing.GetUserLikeUserName(username,User.Identity.GetUserId()).ToList();
            }
            return Json(foundUsers, JsonRequestBehavior.AllowGet);
        }
    }

}
