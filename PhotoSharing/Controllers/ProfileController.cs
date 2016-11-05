using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Business = PhotoSharingBLL;
using PhotoSharing.Models;

namespace PhotoSharing.Controllers
{
    public class ProfileController : Controller
    {
        // GET: Profile
        [AllowAnonymous]
        public ActionResult ProfileDetails()
        {
            Business.User usr = new Business.User();
            ProfileViewModel profileVM = new ProfileViewModel(usr.GetUserByID("b2b0656b-3fd6-4553-a84b-b707b9138d90"));
            Business.PhotoData photoData = new Business.PhotoData();
            photoData.StorePhotoData();
            return View(profileVM);
        }

        //
        // POST: /Account/Register
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult UpdateProfileDetails(ProfileViewModel model)
        {
            if (ModelState.IsValid)
            {
                //var user = new ApplicationUser { UserName = model.Email, Email = model.Email, FirstName = "", LastName = "", Sex = "", PhoneNumber = "", };
                //var result = await UserManager.CreateAsync(user, model.Password);
                //if (result.Succeeded)
                //{
                //    await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);

                //    // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                //    // Send an email with this link
                //    // string code = await UserManager.GenerateEmailConfirmationTokenAsync(user.Id);
                //    // var callbackUrl = Url.Action("ConfirmEmail", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);
                //    // await UserManager.SendEmailAsync(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>");

                //    return RedirectToAction("ProfileDetails", "Profile");
                //}
                //AddErrors(result);
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        public ActionResult RetrievePhoto(int profilePicId)
        {
            Business.PhotoData photoData = new Business.PhotoData();
            byte[] photo = photoData.LoadPhoto(profilePicId);
            if (photo != null)
            {
                return File(photo, "image/jpg");
            }
            else
            {
                return null;
            }
        }
    }
}