using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodReviews
{
    public partial class Dashboard : System.Web.UI.Page
    {
        public int RestaurantListCount = 0;
        public int UserListCount = 0;
        public string[] UserInfo = new string[4];

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie reqCookies = Request.Cookies["UserInfo"];

            if (reqCookies != null)
            {
                string[] splitString = reqCookies.Value.Split(',');
                UserInfo = splitString;
            }

            if (!this.IsPostBack)
            {
                RestaurantListCount = RestaurantDB.DataAccessor.GetRestaurantListCount();
                UserListCount = RestaurantDB.DataAccessor.GetUserListCount();
            }
        }
    }
}