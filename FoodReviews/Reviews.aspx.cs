using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace FoodReviews
{
    public partial class Reviews : System.Web.UI.Page
    {
        public List<RestaurantReview> ReviewList = new List<RestaurantReview>();
        public Restaurant Restaurant = new Restaurant();
        public RestaurantReview Review = new RestaurantReview();
        public string[] UserInfo = new string[4];
        public int editRestaurantID = 0;
        public int TotalRecordsCount = 0;
        public int pageIndex = 1;
        public int pageSize = 5;

        protected void Page_Load(object sender, EventArgs e)
        {
            editRestaurantID = Convert.ToInt32(Request.QueryString["RestaurantID"]);

            HttpCookie reqCookies = Request.Cookies["UserInfo"];

            if (reqCookies != null)
            {
                string[] splitString = reqCookies.Value.Split(',');
                UserInfo = splitString;
            }
            if (!this.IsPostBack)
            {
                ReviewList = RestaurantDB.DataAccessor.GetReviewsByCustomPaging(pageSize, pageIndex, editRestaurantID);
            }
            Restaurant = RestaurantDB.DataAccessor.GetRestaurantDetail(editRestaurantID);
        }

        protected void btnPostClick(object sender, EventArgs e)
        {
            try
            {
                RestaurantReview review = new RestaurantReview()
                {
                    RestaurantID = editRestaurantID,
                    Title = Request.Form["txtTitle"] ?? string.Empty,
                    Review = Request.Form["txtReview"] ?? string.Empty,
                    FoodRating = Request.Form["txtFoodRating"] ?? string.Empty,
                    ServiceRating = Request.Form["txtServiceRating"] ?? string.Empty,
                    CleanlinessRating = Request.Form["txtCleanlinessRating"] ?? string.Empty,
                    OverallRating = Request.Form["txtOverallRating"] ?? string.Empty,
                    CreatedUserID = Convert.ToInt32(UserInfo[0]),
                    CreatedDate = DateTime.Now,
                };
                RestaurantDB.DataAccessor.CreateReview(review);
                Response.Redirect("Reviews.aspx?RestaurantID=" + editRestaurantID, false);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}