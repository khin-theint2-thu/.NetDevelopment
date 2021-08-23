using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodReviews
{
    public partial class RestaurantListing1 : System.Web.UI.Page
    {
        public List<Restaurant> restaurantList = new List<Restaurant>();
        public Restaurant Restaurant = new Restaurant();

        protected void Page_Load(object sender, EventArgs e)
        {
            restaurantList = RestaurantDB.DataAccessor.GetRestaurantList();
        }

        [WebMethod(EnableSession = true)]
        public static void DeleteRestaurant(string[] selectedIDs)
        {
            foreach (string ID in selectedIDs)
            {
                RestaurantDB.DataAccessor.DeleteRestaurant(ID);
            }
        }
    }
}