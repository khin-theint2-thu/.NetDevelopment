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
    public partial class Restaurants : System.Web.UI.Page
    {
        public List<Category> CategoryList = new List<Category>();
        public List<Menu> menuList = new List<Menu>();
        public static List<SubMenu> submenuList = new List<SubMenu>();
        public List<Township> TownshipList = new List<Township>();
        public List<Cuisine> CuisineList = new List<Cuisine>();
        public List<Feature> FeatureList = new List<Feature>();
        public List<RestaurantType> RestaurantTypeList = new List<RestaurantType>();
        public Menu menu = new Menu();
        public SubMenu submenu = new SubMenu();
        public Restaurant Restaurant = new Restaurant();
        public static List<Restaurant> RestaurantList = new List<Restaurant>();
        public string township = string.Empty;
        public string filter = string.Empty;
        public string sortby = string.Empty;
        public string pageURL = string.Empty;
        public string selectedCategory = string.Empty;
        public string RestaurantName = string.Empty;
        public string selectedTownship = string.Empty;
        public int editRestaurantID = 0;
        public int TotalRecordsCount = 0;
        public static int pageIndex = 0;
        public static int pageSize = 10;

        protected void Page_Load(object sender, EventArgs e)
        {
            editRestaurantID = Convert.ToInt32(Request.QueryString["RestaurantID"]);
            township = Request.QueryString["Township"];
            filter = Request.QueryString["Filter"];
            sortby = Request.QueryString["SortBy"];

            if (!IsPostBack)
            {
                int pageIndex = Request.QueryString["PgIndex"] == null ? 1 : Convert.ToInt32(Request.QueryString["PgIndex"]);

                if (editRestaurantID != 0)
                {
                    CategoryList = RestaurantDB.DataAccessor.GetAllCategories(editRestaurantID);
                    menuList = RestaurantDB.DataAccessor.GetMenuList(editRestaurantID);
                    RestaurantName = RestaurantDB.DataAccessor.GetRestaurantName(editRestaurantID);
                }

                TownshipList = RestaurantDB.DataAccessor.GetAllTownships();
                CuisineList = RestaurantDB.DataAccessor.GetAllCuisines();
                FeatureList = RestaurantDB.DataAccessor.GetAllFeatures();
                RestaurantTypeList = RestaurantDB.DataAccessor.GetAllRestaurantTypes();

                pageURL = Request.QueryString.ToString();
                RestaurantList = RestaurantDB.DataAccessor.GetRestsByCustomPagingAndTwnship(pageSize, pageIndex, filter, township ,sortby);
                TotalRecordsCount = RestaurantDB.DataAccessor.GetRestaurantTotalListCount(township);

                if (RestaurantList.Count > 0)
                {
                    pager.InnerHtml = RestaurantDB.DataAccessor.Set_Paging(pageIndex, pageSize, Convert.ToInt32(TotalRecordsCount), "activeLink page-link", pageURL, "disableLink page-link");
                }
            }
        }
        [WebMethod]
        public static void GetMenuListByCategoryID(string CategoryID)
        {
            try
            {
                submenuList = RestaurantDB.DataAccessor.GetMenuListByCategoryID(CategoryID);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void GetRestaurantsByTownship(object sender, EventArgs e)
        {
            string township = Request.Form["comboTownship"] ?? string.Empty;
            Response.Redirect("Restaurants.aspx?Township=" + township);
        }
    }
}