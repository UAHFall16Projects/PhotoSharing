using Microsoft.AspNet.Identity;
using PhotoSharing.Models;
using PhotoSharingDataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace PhotoSharing.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult UserPhotos()
        {
            UserPhotoViewModel userPhotoVM = new UserPhotoViewModel();
            using (var photoSharing = new PhotoSharingContainer())
            {
                List<GetPhotosByUserId_Result> userPhotos = photoSharing.GetPhotosByUserId(User.Identity.GetUserId()).ToList();
                userPhotoVM = new UserPhotoViewModel(userPhotos);
            }

            return PartialView(userPhotoVM);
        }

    }

}
