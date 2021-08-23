using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodReviews
{
    public partial class RestaurantViewForm : System.Web.UI.Page
    {
        public Restaurant Restaurant = new Restaurant();
        public int editRestaurantID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            editRestaurantID = Convert.ToInt32(Request.QueryString["RestaurantID"]);

            if (editRestaurantID != 0)
            {
                Restaurant = RestaurantDB.DataAccessor.GetRestaurantDetail(editRestaurantID);
            }
        }

        protected void btnEditClick(object sender, EventArgs e)
        {
            Response.Redirect("RestaurantForm.aspx?RestaurantID=" + editRestaurantID);
        }

        protected void btnCancelClick(object sender, EventArgs e)
        {
            Response.Redirect("RestaurantListing.aspx");
        }
    }
}