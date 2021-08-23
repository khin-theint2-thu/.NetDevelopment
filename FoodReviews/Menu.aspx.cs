using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodReviews
{
    public partial class Menu1 : System.Web.UI.Page
    {
        public List<Category> CategoryList = new List<Category>();
        public List<Menu> MenuList = new List<Menu>();
        public List<Township> TownshipList = new List<Township>();
        public List<Restaurant> RestaurantList = new List<Restaurant>();
        public Restaurant Restaurant = new Restaurant();
        public RestaurantImage Image = new RestaurantImage();
        public Menu Menu = new Menu();
        public SubMenu Submenu = new SubMenu();
        public string selectedCategory = string.Empty;
        public string categoryId = "All";
        public string restaurantName = string.Empty;
        public int editRestaurantId = 0;
        public int totalMenuCount = 0;
        public int totalRecordsCount = 0;
        public int pageIndex = 0;
        public int pageSize = 5;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                editRestaurantId = Convert.ToInt32(Request.QueryString["RestaurantID"]);
                int pageIndex = Request.QueryString["PgIndex"] == null ? 1 : Convert.ToInt32(Request.QueryString["PgIndex"]);
                if (editRestaurantId != 0)
                {
                    CategoryList = RestaurantDB.DataAccessor.GetAllCategories(editRestaurantId);
                    if(Request.QueryString["CategoryID"] != null)
                    {
                        categoryId = Request.QueryString["CategoryID"];
                    }
                    MenuList = RestaurantDB.DataAccessor.GetMenuByCategoryCustomPaging(pageSize, pageIndex, categoryId, editRestaurantId);
                    totalRecordsCount = RestaurantDB.DataAccessor.GetMenuTotalListCount(categoryId,editRestaurantId);
                    totalMenuCount = RestaurantDB.DataAccessor.GetMenuListCount(editRestaurantId);

                    if (MenuList.Count > 0)
                    {
                        pager.InnerHtml = RestaurantDB.DataAccessor.Set_Paging(pageIndex, pageSize, Convert.ToInt32(totalRecordsCount), "activeLink page-link", "Menu.aspx?RestaurantID="+editRestaurantId+"&CategoryID=" + categoryId, "disableLink page-link");
                    }

                    restaurantName = RestaurantDB.DataAccessor.GetRestaurantName(editRestaurantId);
                    TownshipList = RestaurantDB.DataAccessor.GetAllTownships();
                    Restaurant = RestaurantDB.DataAccessor.GetRestaurantDetail(editRestaurantId);
                }
                RestaurantList = RestaurantDB.DataAccessor.GetRestaurantList();
            }
        }
    }
}