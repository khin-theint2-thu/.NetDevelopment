using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodReviews
{
    public partial class LogIn : System.Web.UI.Page
    {
        public static string userRole = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            userRole = Request.QueryString["UserRole"];
        }

        [WebMethod]
        public static void CreateAccount(string Name, string Password, string Email)
        {
            User user = new User()
            {
                UserName = Name,
                Password = Password,
                Email = Email,
                UserRole = userRole,
                UserImage= "Gravatar.jpg"
            };

            RestaurantDB.DataAccessor.CreateAccount(user);
        }

        [WebMethod]
        public static User AccountLogIn(string Name, string Password)
        {
            string message = string.Empty;
            User user = RestaurantDB.DataAccessor.IsAccountExist(Name);
            return user;
        }
    }
}