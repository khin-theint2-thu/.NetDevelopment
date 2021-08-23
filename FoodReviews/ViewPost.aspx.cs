using FoodReviews.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodReviews
{
    public partial class ViewPost : System.Web.UI.Page
    {
        public Post post = new Post();
        public int postId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            postId = Convert.ToInt32(Request.QueryString["PostId"]);
            post = RestaurantDB.DataAccessor.GetPostDetails(postId);
        }
    }
}