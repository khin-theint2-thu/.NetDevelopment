using FoodReviews.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodReviews
{
    public partial class BlogContentForm : System.Web.UI.Page
    {
        public int UserID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            UserID = Convert.ToInt32(Request.QueryString["UserID"]);
        }

        protected void btnPostClick(object sender, EventArgs e)
        {
            Post post = new Post();
            post.PostTitle = Request.Form["txtPostTitle"] ?? string.Empty;
            post.PostContent = Request.Form["txtPostContent"].Replace("\r\n","<br/>") ?? string.Empty;
            post.PostType = Request.Form["rdoPostType"] ?? string.Empty;

            if (PostImage.HasFiles)
            {
                {
                    post.PostImage = PostImage.FileName;
                };
                PostImage.SaveAs(HttpContext.Current.Server.MapPath("Images/ContentImages/" + PostImage.FileName));
            }else
            {
                post.PostImage = string.Empty;
            }

            post.PostedBy = UserID;
            post.PostedDate = DateTime.Now;
            RestaurantDB.DataAccessor.CreatePost(post);
            Response.Redirect("Posts.aspx");
        }

        protected void btnCancelClick(object sender, EventArgs e)
        {
            Response.Redirect("Posts.aspx");
        }
    }
}