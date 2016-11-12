using System.ComponentModel.DataAnnotations;
using PhotoSharingDataModel;
using System.Collections.Generic;
using System.Web.Mvc;

namespace PhotoSharing.Models
{
    public class UserViewModel
    {
    }

    public class ProfileViewModel
    {
        public ProfileViewModel()
        { }
        public ProfileViewModel(GetUsersByUserId_Result user, List<GetFollowersByUserId_Result> followers = null, List<GetFollowingsByUserId_Result> following = null)
        {
            FirstName = user.FirstName;
            LastName = user.LastName;
            UserName = user.UserName;
            Password = user.Password;
            Sex = user.Sex;
            Phone = user.Phone;
            ProfilePicId = user.ProfilePicId;
            ImageData = user.content;
            _followers = followers;
            _followings = following;
        }


        [Required]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [Display(Name = "Name")]
        public string FullName { get { return FirstName + " " + LastName; } }

        [Display(Name = "Username")]
        public string UserName { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Display(Name = "Sex")]
        public string Sex { get; set; }

        [Display(Name = "Phone")]
        public string Phone { get; set; }

        [Display(Name = "ProfilePicId")]
        public int? ProfilePicId { get; set; }

        [Display(Name = "Picture")]
        public byte[] ImageData { get; set; }


        private List<GetFollowersByUserId_Result> _followers;

        private List<GetFollowingsByUserId_Result> _followings;


        [Display(Name = "Follower")]
        public List<GetFollowersByUserId_Result> Followers
        {
            get
            {
                if (_followers == null)
                    return new List<GetFollowersByUserId_Result>();
                else
                    return _followers;
            }
        }

        [Display(Name = "Follower")]
        public List<GetFollowingsByUserId_Result> Followering
        {
            get
            {
                if (_followings == null)
                    return new List<GetFollowingsByUserId_Result>();
                else
                    return _followings;
            }
        }

        [Display(Name = "Following")]
        public int FollowingCount
        {
            get
            {
                if (_followings == null)
                    return 0;
                else
                    return _followings.Count;
            }
        }

        [Display(Name = "Followers")]
        public int FollowersCount
        {
            get
            {
                if (_followings == null)
                    return 0;
                else
                    return _followers.Count;
            }
        }
    }

    public class UserPhotoViewModel
    {
        public UserPhotoViewModel()
        {

        }
        public UserPhotoViewModel(List<GetPhotosByUserId_Result> savedPhotos, string userId)
        {
            FillPhotosByUserId_Result(savedPhotos);
            UserId = userId;
        }

        public void FillPhotosByUserId_Result(List<GetPhotosByUserId_Result> savedPhotos)
        {
            PhotosByUserId_Result = new List<GetPhotosByUserId_Result>();
            PhotosByUserId_Result = savedPhotos;
        }

        [Display(Name = "Photos")]
        public List<GetPhotosByUserId_Result> PhotosByUserId_Result
        { get; set; }

        [Display(Name = "UserId")]
        public string UserId
        { get; set; }

    }

    public class UploadUserPhotoViewModel
    {
        [Display(Name = "Description")]
        public string Description { get; set; }

        [Display(Name = "Picture")]
        public byte[] ImageData { get; set; }
    }

    public class ShareUserPhotoViewModel
    {
        [Display(Name = "Share With")]
        public string SearchUser { get; set; }

        [Display(Name = "Picture")]
        public int SharedPhotoId { get; set; }
    }

    public class FollowUserPhotoViewModel
    {
        [Display(Name = "Search User")]
        public string SearchUser { get; set; }


    }

}