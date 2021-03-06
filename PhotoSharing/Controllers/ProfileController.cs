﻿using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.AspNet.Identity;
using PhotoSharing.Models;
using PhotoSharingDataModel;
using System.Threading.Tasks;

namespace PhotoSharing.Controllers
{
    [Authorize]
    public class ProfileController : Controller
    {
        private ApplicationUserManager _userManager;
        private ApplicationSignInManager _signInManager;

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

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set
            {
                _signInManager = value;
            }
        }
        // GET: Profile
        [Authorize]
        [AllowAnonymous]
        [Authorize]
        public ActionResult ProfileDetails()
        {
            var userId = User.Identity.GetUserId();
            var users = new GetUsersByUserId_Result();
            var followers = new List<GetFollowersByUserId_Result>();
            var following = new List<GetFollowingsByUserId_Result>();
            using (var photoSharing = new PhotoSharingContainer())
            {
                users = photoSharing.GetUsersByUserId(User.Identity.GetUserId()).FirstOrDefault();
                followers = photoSharing.GetFollowersByUserId(userId).ToList();
                following = photoSharing.GetFollowingsByUserId(userId).ToList();
            };
            ProfileViewModel profileVM = new ProfileViewModel();
            if (users != null)
            {
                profileVM = new ProfileViewModel(users, followers, following);
            }
            return View(profileVM);
        }

        //
        // POST: /Account/Register
        [HttpPost]
        [AllowAnonymous]
        [Authorize]
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
                        photoData.ContentType = uploadprofilePic.ContentType;
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

                        var log = new Log();
                        log.LogDate = System.DateTime.Now;
                        log.LoggerId = User.Identity.GetUserId();
                        log.LogTypeId = (int)Models.LogType.Upload;
                        log.PhotoId = savedPhoto.PhotoID;
                        log.Description = "Profile Image Uploaded";
                        photoSharing.Logs.Add(log);
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

                    var logUpdate = new Log();
                    logUpdate.LogDate = System.DateTime.Now;
                    logUpdate.LoggerId = User.Identity.GetUserId();
                    logUpdate.LogTypeId = (int)Models.LogType.Update;
                    logUpdate.LogTypeId = (int)Models.LogType.Update;
                    logUpdate.Description = "Profile Details Updated";
                    photoSharing.Logs.Add(logUpdate);
                    photoSharing.SaveChanges();

                };
            }
            // If we got this far, something failed, redisplay form
            return RedirectToAction("ProfileDetails");

        }

        [Authorize]
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

        [Authorize]
        public ActionResult ProfileEditDetails()
        {
            var users = new GetUsersByUserId_Result();

            using (var photoSharing = new PhotoSharingContainer())
            {
                users = photoSharing.GetUsersByUserId(User.Identity.GetUserId()).First();
            };

            ProfileViewModel profileVM = new ProfileViewModel(users);
            return PartialView("ProfileEditDetails", profileVM);
        }

        [Authorize]
        public ActionResult ChangePassword()
        {
            return PartialView();
        }

        //
        // POST: /Manage/ChangePassword
        [HttpPost]
        [Authorize]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ChangePassword(ChangePasswordViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var result = await UserManager.ChangePasswordAsync(User.Identity.GetUserId(), model.OldPassword, model.NewPassword);
            if (result.Succeeded)
            {
                var user = await UserManager.FindByIdAsync(User.Identity.GetUserId());
                if (user != null)
                {
                    await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                    using (var photoSharing = new PhotoSharingContainer())
                    {
                        var log = new Log();
                        log.LogDate = System.DateTime.Now;
                        log.LoggerId = User.Identity.GetUserId();
                        log.LogTypeId = (int)Models.LogType.Update;
                        log.Description = "Password Changed";
                        photoSharing.Logs.Add(log);
                        photoSharing.SaveChanges();
                    }
                }
                return RedirectToAction("ProfileDetails");
            }
            return View(model);
        }

        [Authorize]
        public ActionResult FollowUsers(FollowUserPhotoViewModel model)
        {

            return PartialView();
        }

        [Authorize]
        [HttpPost]
        public ActionResult UpdateFollowUsers(FollowUserPhotoViewModel followUserPhotoVM)
        {
            var userId = User.Identity.GetUserId();
            var sharedUsernames = followUserPhotoVM.SearchUser.Trim().ToString().Split(',');
            using (var photoSharing = new PhotoSharingContainer())
            {
                foreach (var userName in sharedUsernames.Where(qry => !string.IsNullOrEmpty(qry.Trim())).Select(qry => qry.Trim()))
                {
                    if (photoSharing.Users.Where(qry => qry.UserName == userName).Any())
                    {
                        var userToShare = photoSharing.Users.Where(qry => qry.UserName == userName).FirstOrDefault();
                        if (userToShare != null && !photoSharing.Followers.Where(qry => qry.UserFollowerId == userId && qry.UserId == userToShare.UserID).Any())
                        {
                            Follower follower = new Follower();
                            follower.UserFollowerId = User.Identity.GetUserId();
                            follower.UserId = userToShare.UserID;
                            photoSharing.Followers.Add(follower);

                            var log = new Log();
                            log.LogDate = System.DateTime.Now;
                            log.LoggerId = User.Identity.GetUserId();
                            log.LogTypeId = (int)Models.LogType.Follow;
                            log.AffectedId = userToShare.UserID;
                            log.Description = "Follow's User";
                            photoSharing.Logs.Add(log);
                        }
                    }
                }
                photoSharing.SaveChanges();
            }
            return RedirectToAction("ProfileDetails");
        }

        [Authorize]
        public ActionResult UnFollowUsers(string userId)
        {
            var userFollowerId = User.Identity.GetUserId();
            using (var photoSharing = new PhotoSharingContainer())
            {
                var follower = photoSharing.Followers.Where(qry => qry.UserFollowerId == userFollowerId && qry.UserId == userId).FirstOrDefault();
                if (follower != null)
                {
                    photoSharing.Followers.Remove(follower);
                    photoSharing.SaveChanges();

                    var log = new Log();
                    log.LogDate = System.DateTime.Now;
                    log.LoggerId = userFollowerId;
                    log.LogTypeId = (int)Models.LogType.UnFollow;
                    log.AffectedId = userId;
                    log.Description = "UnFollowed User";
                    photoSharing.Logs.Add(log);
                    photoSharing.SaveChanges();
                }
            }
            return RedirectToAction("ProfileDetails");
        }

        [Authorize]
        public ActionResult FollowNewUsers(string userId)
        {
            var userFollowerId = User.Identity.GetUserId();
            using (var photoSharing = new PhotoSharingContainer())
            {
                var savedFollower = photoSharing.Followers.Where(qry => qry.UserFollowerId == userFollowerId && qry.UserId == userId).FirstOrDefault();
                if (savedFollower == null)
                {
                    Follower follower = new Follower();
                    follower.UserFollowerId = User.Identity.GetUserId();
                    follower.UserId = userId;
                    photoSharing.Followers.Add(follower);
                    photoSharing.SaveChanges();

                    var log = new Log();
                    log.LogDate = System.DateTime.Now;
                    log.LoggerId = userFollowerId;
                    log.LogTypeId = (int)Models.LogType.Follow;
                    log.AffectedId = userId;
                    log.Description = "UnFollowed User";
                    photoSharing.Logs.Add(log);
                    photoSharing.SaveChanges();
                }
            }
            return RedirectToAction("ProfileDetails");
        }


        [Authorize]
        public JsonResult GetNotifications()
        {
            var followingNotifications = new List<GetFollowingNotifications_Result>();
            var sharingNotifications = new List<GetSharingNotifications_Result>();
            using (var photoSharing = new PhotoSharingContainer())
            {
                followingNotifications = photoSharing.GetFollowingNotifications(User.Identity.GetUserId()).ToList();
                sharingNotifications = photoSharing.GetSharingNotifications(User.Identity.GetUserId()).ToList();
            }
            var notifications = new List<string>();
            foreach (var followingNotification in followingNotifications)
            {
                notifications.Add(followingNotification.FullName + " uploaded " + followingNotification.NotificationCount+ " photos.");
            }
            foreach (var sharingNotification in sharingNotifications)
            {
                notifications.Add(sharingNotification.FullName + " shared " + sharingNotification.NotificationCount + " photo/s with you.");
            }
            return Json(notifications, JsonRequestBehavior.AllowGet);
        }
    }
}