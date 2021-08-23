using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodReviews
{
    public partial class MenuListing : System.Web.UI.Page
    {
        public List<Menu> Menulist = new List<Menu>();
        public Menu Menu = new Menu();
        protected void Page_Load(object sender, EventArgs e)
        {
            Menulist = RestaurantDB.DataAccessor.GetMenuListing();
        }
    }
}