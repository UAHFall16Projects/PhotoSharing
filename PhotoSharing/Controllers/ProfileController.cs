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
            ProfileViewModel profileVM = new ProfileViewModel(usr.GetUserByID());
            return View(profileVM);
        }
    }
}