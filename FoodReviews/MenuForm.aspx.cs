using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodReviews
{
    public partial class MenuForm : System.Web.UI.Page
    {
        public List<Category> CategoryList = new List<Category>();
        public List<Menu> MenuList = new List<Menu>();
        public Menu Menu = new Menu();
        public string restaurantName = string.Empty;
        public int editRestaurantId = 0;
        public int editMenuId = 0;
        public int menuID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            editRestaurantId = Convert.ToInt32(Request.QueryString["RestaurantID"]);

            if (!IsPostBack)
            {
                CategoryList = RestaurantDB.DataAccessor.GetAllCategories(editRestaurantId);
                MenuList = RestaurantDB.DataAccessor.GetMenuList(editRestaurantId);
                restaurantName = RestaurantDB.DataAccessor.GetRestaurantName(editRestaurantId);
            }
        }

        protected void btnAddMenuClick(object sender, EventArgs e)
        {
            string menuImage = string.Empty;

            if (editRestaurantId != 0)
            {
                if (FileUpload.HasFiles)
                {
                    menuImage = FileUpload.FileName;
                    FileUpload.SaveAs(HttpContext.Current.Server.MapPath("Images/RestaurantImages/" + menuImage));
                }
                decimal? price = string.IsNullOrEmpty(Request.Form["txtPrice"]) ? 0 : decimal.Parse(Request.Form["txtPrice"]);
                #region menuID

                if (!String.IsNullOrEmpty(Request.Form["txtMenuID"]))
                {
                    menuID = Convert.ToInt32(Request.Form["txtMenuID"]);
                }

                #endregion
                Menu menu = new Menu()
                {
                    MenuID = menuID,
                    CategoryID = Convert.ToInt32(Request.Form["comboCategoryName"]),
                    RestaurantID = editRestaurantId,
                    MenuName = Request.Form["txtMenuName"] ?? string.Empty,
                    Price = price.HasValue ? price : 0,
                    MenuImage = menuImage,
                };
                RestaurantDB.DataAccessor.CreateMenu(menu, editRestaurantId);
            }

            Response.Redirect("MenuForm.aspx?RestaurantID=" + editRestaurantId, false);
        }

        protected void btnAddCategoryClick(object sender, EventArgs e)
        {
            Category category = new Category();
            category.RestaurantID = editRestaurantId;
            category.CategoryName = Request.Form["txtCategoryName"] ?? string.Empty;

            RestaurantDB.DataAccessor.CreateCategory(category);
            Response.Redirect("MenuForm.aspx?RestaurantID=" + editRestaurantId, false);
        }

        protected void btnGoToRestaurantListing(object sender, EventArgs e)
        {
            Response.Redirect("RestaurantListing.aspx");
        }

        [WebMethod(EnableSession = true)]
        public static Menu EditMenuDetail(string MenuID)
        {
            return RestaurantDB.DataAccessor.EditMenu(MenuID);
        }

        [WebMethod(EnableSession = true)]
        public static void DeleteMenu(string[] selectedIDs)
        {
            foreach (string ID in selectedIDs)
            {
                RestaurantDB.DataAccessor.DeleteMenu(ID);
            }
        }

        [WebMethod(EnableSession = true)]
        public static void DeleteCategory(string categoryID)
        {
            RestaurantDB.DataAccessor.DeleteCategory(categoryID);
        }
    }
}