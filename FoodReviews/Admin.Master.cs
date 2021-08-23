using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodReviews
{
    public partial class Admin : System.Web.UI.MasterPage
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
    }
}