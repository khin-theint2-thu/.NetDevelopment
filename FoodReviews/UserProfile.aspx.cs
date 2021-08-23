using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodReviews
{
    public partial class UserProfile : System.Web.UI.Page
    {
        public string[] UserInfo = new string[4];

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie reqCookies = Request.Cookies["UserInfo"];

            if (reqCookies != null)
            {
                string[] splitString = reqCookies.Value.Split(',');
                UserInfo = splitString;
            }
        }

        protected void btnSaveUserInfoClick(object sender, EventArgs e)
        {
            int UserID = Convert.ToInt32(UserInfo[0]);
            string selectedpfimage = string.Empty;
            if (ProfileImage.HasFiles)
            {
                {
                    selectedpfimage = ProfileImage.FileName;
                };
                ProfileImage.SaveAs(HttpContext.Current.Server.MapPath("Images/UserImages/" + ProfileImage.FileName));
                RestaurantDB.DataAccessor.UpdateUserProfileImage(UserID, selectedpfimage);
            }
            Response.Redirect("Index.aspx");
        }
    }
}