using Business = PhotoSharingBLL;
using System.ComponentModel.DataAnnotations;
using PhotoSharingDataModel;

namespace PhotoSharing.Models
{
    public class UserViewModel
    {
    }

    public class ProfileViewModel
    {
        public ProfileViewModel(GetUsersByUserId_Result user)
        {
            FirstName = user.FirstName;
            LastName = user.LastName;
            UserName = user.UserName;
            Password = user.Password;
            Sex = user.Sex;
            Phone = user.Phone;
            ProfilePicId = user.ProfilePicId;
        }
        

        [Required]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [Display(Name = "User Name")]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [Display(Name = "Sex")]
        public string Sex { get; set; }

        [Display(Name = "Phone")]
        public int Phone { get; set; }

        [Display(Name = "ProfilePicId")]
        public int? ProfilePicId { get; set; }

    }
}