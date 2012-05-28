using System.ComponentModel.DataAnnotations;

namespace SwetNation.Web.models
{
    public class SignInViewModel
    {
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string FirstName { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string LastName { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string Email { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string Password { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string PasswordConfirm { get; set; }
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string Gender { get; set; }        
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string Mode { get; set; }

        public SignInViewModel()
        {
            this.FirstName = string.Empty;
            this.LastName = string.Empty;
            this.Email = string.Empty;
            this.Password = string.Empty;
            this.PasswordConfirm = string.Empty;
            this.Gender = string.Empty;
            this.Mode = string.Empty;
        }
    }
}