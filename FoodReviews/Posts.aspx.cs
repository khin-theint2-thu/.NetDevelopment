using FoodReviews.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodReviews
{
    public partial class Posts : System.Web.UI.Page
    {
        public List<TopPost> TopPostList = new List<TopPost>();
        public List<NewPost> NewPostList = new List<NewPost>();
        public List<RecentPost> RecentPostList = new List<RecentPost>();
        public List<OldPost> OldPostList = new List<OldPost>();
        public string postType = "Foods";
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
                if (Request.QueryString["PostType"] != null)
                {
                    postType = Request.QueryString["PostType"].ToString();
                }
                GetPosts(postType);
            }
        }

        protected void btnRedirectCick(object sender, EventArgs e)
        {
            Response.Redirect("BlogContentForm.aspx?UserID=" + UserInfo[0]);
        }

        private void GetPosts(string selectedpostType)
        {
            TopPostList = RestaurantDB.DataAccessor.GetTopPosts(selectedpostType);
            NewPostList = RestaurantDB.DataAccessor.GetNewPosts(selectedpostType);
            RecentPostList = RestaurantDB.DataAccessor.GetRecentPosts(selectedpostType);
            OldPostList = RestaurantDB.DataAccessor.GetOldPosts(selectedpostType);
        }
    }
}