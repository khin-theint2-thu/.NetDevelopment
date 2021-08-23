using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodReviews
{
    public partial class RestaurantForm : System.Web.UI.Page
    {
        public List<Restaurant> RestaurantList = new List<Restaurant>();
        public List<Township> TownshipList = new List<Township>();
        public List<RestaurantType> RestaurantTypeList = new List<RestaurantType>();
        public List<Cuisine> CuisineList = new List<Cuisine>();
        public List<Feature> FeatureList = new List<Feature>();
        public Restaurant Restaurant = new Restaurant();
        public string selectedTownship = "Myaynikone";
        public string selectedRestaurantType = "Fast Food";
        public string selectedCuisine = "Burmese";
        public string selectedFeature = "Free Wifi";
        public int editRestaurantId = 0;
        public int categoryId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            editRestaurantId =Convert.ToInt32(Request.QueryString["RestaurantID"]);

            if (!IsPostBack)
            {
                if (editRestaurantId != 0)
                {
                    Restaurant = RestaurantDB.DataAccessor.GetRestaurantDetail(editRestaurantId);
                    selectedTownship = Restaurant.Township;
                    selectedRestaurantType = Restaurant.RestaurantType;
                    selectedCuisine = Restaurant.Cuisine;
                    selectedFeature = Restaurant.RestaurantFeature;
                }
                TownshipList = RestaurantDB.DataAccessor.GetAllTownships();
                RestaurantTypeList = RestaurantDB.DataAccessor.GetAllRestaurantTypes();
                CuisineList = RestaurantDB.DataAccessor.GetAllCuisines();
                FeatureList = RestaurantDB.DataAccessor.GetAllFeatures();
            };
        }

        protected void btnSaveClick(object sender, EventArgs e)
        {
            string transactionstatus = string.Empty;
            int restaurantId = 0;

            try
            {
                #region Images
                string images = string.Empty;
                int count = 0;
                RestaurantImage image = new RestaurantImage();
                if (FilesUpload.HasFiles)
                {
                    foreach (HttpPostedFile uploadeFile in FilesUpload.PostedFiles)
                    {
                        if (uploadeFile.ContentLength > 0)
                        {
                            uploadeFile.SaveAs(HttpContext.Current.Server.MapPath("Images/RestaurantImages/" + uploadeFile.FileName));
                            if (String.IsNullOrEmpty(images))
                                images = FilesUpload.PostedFiles[count].FileName;
                            else
                                images = images + ',' + FilesUpload.PostedFiles[count].FileName;
                        }
                        count++;
                    }
                }
                #endregion
                #region restaurantID
                if (editRestaurantId != 0)
                {
                    restaurantId = editRestaurantId;
                }

                #endregion
                #region Restaurant
                Restaurant restaurant = new Restaurant()
                {
                    RestaurantID = restaurantId,
                    Name = Request.Form["txtRestaurantName"] ?? string.Empty,
                    Location = Request.Form["txtLocation"] ?? string.Empty,
                    Township = Request.Form["comboTownship"] ?? string.Empty,
                    RestaurantFeature = Request.Form["chkRestFeature"] ?? string.Empty,
                    Cuisine = Request.Form["chkCuisine"] ?? string.Empty,
                    PriceRangeFrom = string.IsNullOrEmpty(Request.Form["txtFrom"]) ? (int?)null : Convert.ToInt32(Request.Form["txtFrom"]),
                    PriceRangeTo = string.IsNullOrEmpty(Request.Form["txtTo"]) ? (int?)null : Convert.ToInt32(Request.Form["txtTo"]),
                    RestaurantType = Request.Form["chkRestType"] ?? string.Empty,
                    OpenHour = string.IsNullOrEmpty(Request.Form["txtOpenHour"]) ? (DateTime?)null : Convert.ToDateTime(Request.Form["txtOpenHour"]),
                    CloseHour = string.IsNullOrEmpty(Request.Form["txtCloseHour"]) ? (DateTime?)null : Convert.ToDateTime(Request.Form["txtCloseHour"]),
                    Tel = Request.Form["txtTel"] ?? string.Empty,
                    Website = Request.Form["txtWebsite"] ?? string.Empty,
                    CreatedDate = DateTime.Now,
                    LastUpdatedDate = DateTime.Now
                };

                #endregion
                RestaurantDB.DataAccessor.CreateRestaurant(restaurant, images);
                Response.Redirect("RestaurantListing.aspx", false);
            }
            catch (Exception ex)
            {
                RestaurantDB.DataAccessor.ErrorLogString(ex);
            }
        }

        protected void btnCancelClick(object sender, EventArgs e)
        {
            Response.Redirect("RestaurantListing.aspx");
        }
    }
}