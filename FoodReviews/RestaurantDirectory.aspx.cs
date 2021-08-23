using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodReviews
{
    public partial class RestaurantDirectory : System.Web.UI.Page
    {
        public List<RestaurantReview> ReviewList = new List<RestaurantReview>();
        public List<Category> CategoryList = new List<Category>();
        public RestaurantReview Review = new RestaurantReview();
        public Restaurant Restaurant = new Restaurant();
        public static int editRestaurantID = 0;
        public static int totalreviewcount = 0;
        public int pageIndex = 1;
        public int pageSize = 5;


        protected void Page_Load(object sender, EventArgs e)
        {
            editRestaurantID = Convert.ToInt32(Request.QueryString["RestaurantID"]);

            if (!this.IsPostBack)
            {
                if (editRestaurantID != 0)
                {
                    int pageIndex = Request.QueryString["PgIndex"] == null ? 1 : Convert.ToInt32(Request.QueryString["PgIndex"]);
                    ReviewList = RestaurantDB.DataAccessor.GetReviewsByCustomPaging(pageSize, pageIndex, editRestaurantID);
                    totalreviewcount = RestaurantDB.DataAccessor.GetReviewListCount(editRestaurantID);

                    if (totalreviewcount > 0)
                    {
                        pager.InnerHtml = RestaurantDB.DataAccessor.Set_Paging(pageIndex, pageSize, Convert.ToInt32(totalreviewcount), "activeLink page-link", "RestaurantDirectory.aspx?RestaurantID="+editRestaurantID, "disableLink page-link");
                    }
                    CategoryList = RestaurantDB.DataAccessor.GetAllCategories(editRestaurantID);
                }
            }
            Restaurant = RestaurantDB.DataAccessor.GetRestaurantDetail(editRestaurantID);
        }
    }
}