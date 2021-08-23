using FoodReviews.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodReviews
{
    public partial class UserForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddUserClick(object sender, EventArgs e)
        {
            UserImage userimage = new UserImage();
            User user = new User();
            user.UserName = Request.Form["txtUserName"] ?? string.Empty;
            user.Password = Request.Form["txtPassword"] ?? string.Empty;
            user.Email = Request.Form["txtEmail"] ?? string.Empty;
            user.UserRole = Request.Form["rdoUserRole"] ?? string.Empty;

            if (FileUpload.HasFiles)
            {
                {
                    user.UserImage = FileUpload.FileName;
                };
                FileUpload.SaveAs(HttpContext.Current.Server.MapPath("Images/UserImages/" + FileUpload.FileName));
            }else
            {
                user.UserImage = "Gravata.jpg";
            }
            RestaurantDB.DataAccessor.CreateAccount(user);

            Response.Redirect("UserListing.aspx");
        }

        protected void btnCancelClick(object sender, EventArgs e)
        {
            Response.Redirect("UserListing.aspx");
        }
    }
}