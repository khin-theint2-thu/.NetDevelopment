using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodReviews
{
    public partial class UserListing : System.Web.UI.Page
    {
        public List<User> UserList = new List<User>();
        public User user = new User();

        protected void Page_Load(object sender, EventArgs e)
        {
            UserList = RestaurantDB.DataAccessor.GetUserList();
        }

        [WebMethod(EnableSession = true)]
        public static void DeleteUser(int userID)
        {
            RestaurantDB.DataAccessor.DeleteUser(userID);
        }
    }
}