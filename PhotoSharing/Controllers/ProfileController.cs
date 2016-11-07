using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.AspNet.Identity;
using PhotoSharing.Models;
using PhotoSharingDataModel;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.Entity;
using System.IO;
using System.Drawing;

namespace PhotoSharing.Controllers
{
    public class ProfileController : Controller
    {
        private ApplicationUserManager _userManager;

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }


        // GET: Profile
        [AllowAnonymous]
        public ActionResult ProfileDetails()
        {
            var userId = User.Identity.GetUserId();
            var users = new GetUsersByUserId_Result();
            var followers = new List<GetFollowersByUserId_Result>();
            var following = new List<GetFollowingsByUserId_Result>();
            using (var photoSharing = new PhotoSharingContainer())
            {
                users = photoSharing.GetUsersByUserId(User.Identity.GetUserId()).First();
                followers = photoSharing.GetFollowersByUserId(userId).ToList();
                following = photoSharing.GetFollowingsByUserId(userId).ToList();

            };
            ProfileViewModel profileVM = new ProfileViewModel(users, followers, following);
            return View(profileVM);
        }

        //
        // POST: /Account/Register
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult UpdateProfileDetails(ProfileViewModel model, HttpPostedFileBase uploadprofilePic)
        {
            string userId = User.Identity.GetUserId();
            if (ModelState.IsValid)
            {
                using (var photoSharing = new PhotoSharingContainer())
                {
                    var savedUser = photoSharing.Users.First(usr => usr.UserID == userId);
                    if (uploadprofilePic != null && uploadprofilePic.ContentLength > 0)
                    { //Profile Image has been uploaded
                        //Photo Data object stored to DB
                        PhotoFile photoData = new PhotoFile();
                        photoData.Content = new byte[uploadprofilePic.ContentLength];
                        uploadprofilePic.InputStream.Read(photoData.Content, 0, uploadprofilePic.ContentLength);
                        var savedPhotoFile = photoSharing.PhotoFiles.Add(photoData);
                        photoSharing.SaveChanges();

                        //Photo object stored to DB
                        Photo photo = new Photo();
                        photo.Name = uploadprofilePic.FileName;
                        photo.UploadedUserId = User.Identity.GetUserId();
                        photo.PhotoFileId = savedPhotoFile.PhotoFileID;
                        var savedPhoto = photoSharing.Photos.Add(photo);
                        photoSharing.SaveChanges();
                        savedUser.ProfilePicId = savedPhoto.PhotoID;
                    }

                    savedUser.UserName = model.UserName;
                    savedUser.Email = model.UserName;
                    savedUser.FirstName = model.FirstName;
                    savedUser.LastName = model.LastName;
                    savedUser.Sex = model.Sex;
                    savedUser.Phone = model.Phone;
                    photoSharing.SaveChanges();
                };
            }
            // If we got this far, something failed, redisplay form
            return RedirectToAction("ProfileDetails");
            
        }

        public ActionResult RetrievePhoto(int profilePicId)
        {
            var photoResult = new ReadPhoto_Result();
            using (var photoSharing = new PhotoSharingContainer())
            {
                photoResult = photoSharing.ReadPhoto(profilePicId).First();
            };
            byte[] photo = photoResult.Content;
            if (photo != null)
            {
                return File(photo, "image/jpg");
            }
            else
            {
                return null;
            }
        }

        public ActionResult ProfileEditDetails()
        {
            var users = new GetUsersByUserId_Result();

            using (var photoSharing = new PhotoSharingContainer())
            {
                users = photoSharing.GetUsersByUserId(User.Identity.GetUserId()).First();
            };

            ProfileViewModel profileVM = new ProfileViewModel(users);
            return PartialView("ProfileEditDetails",profileVM);
        }


    }
}