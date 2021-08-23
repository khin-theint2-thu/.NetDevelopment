using FoodReviews.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace FoodReviews.RestaurantDB
{
    public class DataAccessor
    {
        public static string foodreviewsdbconnection = ConfigurationManager.ConnectionStrings["ConnMain"].ToString();
        public static string ErrLogfile = ConfigurationManager.AppSettings["ErrLogFilePath"];

        public static List<Restaurant> GetRestaurantList()
        {
            List<Restaurant> RestaurantList = new List<Restaurant>();
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_GetAllRestaurants", sqlconnection);

            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlconnection;

                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    Restaurant restaurant = new Restaurant();
                    if (!string.IsNullOrEmpty(sqlDataReader["RestaurantID"].ToString()))
                    {
                        restaurant.RestaurantID = (int)sqlDataReader["RestaurantID"];
                    }

                    restaurant.Name = (sqlDataReader["Name"] != null) ? sqlDataReader["Name"].ToString() : String.Empty;
                    restaurant.Location = (sqlDataReader["Location"] != null) ? sqlDataReader["Location"].ToString() : String.Empty;
                    restaurant.Township = (sqlDataReader["Township"] != null) ? sqlDataReader["Township"].ToString() : String.Empty;
                    restaurant.RestaurantFeature = (sqlDataReader["Features"] != null) ? sqlDataReader["Features"].ToString() : String.Empty;
                    restaurant.RestaurantType = (sqlDataReader["RestaurantType"] != null) ? sqlDataReader["RestaurantType"].ToString() : String.Empty;
                    restaurant.Cuisine = (sqlDataReader["Cuisine"] != null) ? sqlDataReader["Cuisine"].ToString() : String.Empty;
                    if (sqlDataReader["PriceRangeFrom"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["PriceRangeFrom"].ToString()))
                        {
                            restaurant.PriceRangeFrom = Convert.ToDecimal(sqlDataReader["PriceRangeFrom"].ToString());
                        }
                    }
                    if (sqlDataReader["PriceRangeTo"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["PriceRangeTo"].ToString()))
                        {
                            restaurant.PriceRangeTo = Convert.ToDecimal(sqlDataReader["PriceRangeTo"].ToString());
                        }
                    }
                    if (sqlDataReader["OpenHour"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["OpenHour"].ToString()))
                        {
                            restaurant.OpenHour = System.DateTime.Now.Add(TimeSpan.Parse(sqlDataReader["OpenHour"].ToString()));
                        }
                    }
                    if (sqlDataReader["CloseHour"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["CloseHour"].ToString()))
                        {
                            restaurant.CloseHour = System.DateTime.Now.Add(TimeSpan.Parse(sqlDataReader["CloseHour"].ToString()));
                        }
                    }
                    restaurant.Tel = (sqlDataReader["Tel"] != null) ? sqlDataReader["Tel"].ToString() : String.Empty;
                    restaurant.Website = (sqlDataReader["Website"] != null) ? sqlDataReader["Website"].ToString() : String.Empty;
                    restaurant.UploadFile = (sqlDataReader["UploadFile"] != null) ? sqlDataReader["UploadFile"].ToString() : String.Empty;
                    restaurant.TotalMenuCount = (sqlDataReader["TotalMenuCount"] != null) ? sqlDataReader["TotalMenuCount"].ToString() : String.Empty;
                    RestaurantList.Add(restaurant);
                }

                return RestaurantList;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                sqlconnection.Close();
            }
        }
        
        public static List<Township>  GetAllTownships()
        {
            List<Township> TownshipList = new List<Township>();
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_GetAllTownships", sqlconnection);
            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlconnection;

                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    Township township = new Township();
                    township.Name = (sqlDataReader["Township"] != null) ? sqlDataReader["Township"].ToString() : String.Empty;
                    township.TotalRestaurantCount = (sqlDataReader["TotalRestaurantCount"] != null) ? sqlDataReader["TotalRestaurantCount"].ToString() : String.Empty;
                    TownshipList.Add(township);
                }

            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return TownshipList;
        }

        public static List<Cuisine> GetAllCuisines()
        {
            List<Cuisine> cuisineList = new List<Cuisine>();
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_GetAllCuisines", sqlconnection);
            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlconnection;

                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    Cuisine cuisine = new Cuisine();
                    if (sqlDataReader["Id"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["Id"].ToString()))
                        {
                            cuisine.Id = Convert.ToInt32(sqlDataReader["Id"]);
                        }
                    }
                    cuisine.Name = (sqlDataReader["Name"] != null) ? sqlDataReader["Name"].ToString() : String.Empty;
                    cuisine.Image = (sqlDataReader["Image"] != null) ? sqlDataReader["Image"].ToString() : String.Empty;
                    cuisineList.Add(cuisine);
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return cuisineList;
        }

        public static List<Feature> GetAllFeatures()
        {
            List<Feature> featureList = new List<Feature>();
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_GetAllFeatures", sqlconnection);
            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlconnection;

                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    Feature feature = new Feature();
                    if (sqlDataReader["Id"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["Id"].ToString()))
                        {
                            feature.Id = Convert.ToInt32(sqlDataReader["Id"]);
                        }
                    }
                    feature.Name = (sqlDataReader["Name"] != null) ? sqlDataReader["Name"].ToString() : String.Empty;
                    feature.TotalRestaurantCount = (sqlDataReader["TotalRestaurantCount"] != null) ? sqlDataReader["TotalRestaurantCount"].ToString() : String.Empty;
                    featureList.Add(feature);
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return featureList;
        }

        public static List<RestaurantType> GetAllRestaurantTypes()
        {
            List<RestaurantType> RtTypeList = new List<RestaurantType>();
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_GetAllRestaurantTypes", sqlconnection);
            string Township = string.Empty;
            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlconnection;

                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    RestaurantType restaurantType = new RestaurantType();
                    restaurantType.Name = (sqlDataReader["Name"] != null) ? sqlDataReader["Name"].ToString() : String.Empty;
                    restaurantType.TotalRestaurantCount = (sqlDataReader["TotalRestaurantCount"] != null) ? sqlDataReader["TotalRestaurantCount"].ToString() : String.Empty;
                    RtTypeList.Add(restaurantType);
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return RtTypeList;
        }

        public static List<Category> GetAllCategories(int restaurantId)
        {
            List<Category> CategoryList = new List<Category>();
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_GetAllCategories", sqlconnection);
            string Township = string.Empty;
            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlconnection;

                cmd.Parameters.AddWithValue("@RestaurantID", restaurantId);

                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    Category category = new Category();
                    if (!string.IsNullOrEmpty(sqlDataReader["CategoryID"].ToString()))
                    {
                        category.CategoryID = (int)sqlDataReader["CategoryID"];
                    }
                    category.CategoryName = (sqlDataReader["CategoryName"] != null) ? sqlDataReader["CategoryName"].ToString() : String.Empty;
                    category.TotalMenuCount = (sqlDataReader["TotalMenuCount"] != null) ? sqlDataReader["TotalMenuCount"].ToString() : String.Empty;
                    CategoryList.Add(category);
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return CategoryList;
        }

        public static List<Menu> GetMenuList(int editRestaurantId)
        {
            List<Menu> MenuList = new List<Menu>();
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_GetAllMenuList", sqlconnection);
            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlconnection;
                cmd.Parameters.Add("@RestaurantID", SqlDbType.Int, 100).Value = editRestaurantId;
                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    Menu menu = new Menu();
                    if (!string.IsNullOrEmpty(sqlDataReader["MenuID"].ToString()))
                    {
                        menu.MenuID = (int)sqlDataReader["MenuID"];
                    }
                    if (!string.IsNullOrEmpty(sqlDataReader["CategoryID"].ToString()))
                    {
                        menu.CategoryID = (int)sqlDataReader["CategoryID"];
                    }
                    menu.CategoryName = (sqlDataReader["CategoryName"] != null) ? sqlDataReader["CategoryName"].ToString() : String.Empty;
                    menu.MenuName = (sqlDataReader["MenuName"] != null) ? sqlDataReader["MenuName"].ToString() : String.Empty;
                    if (sqlDataReader["Price"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["Price"].ToString()))
                        {
                            menu.Price = Convert.ToDecimal(sqlDataReader["Price"]);
                        }
                    }
                    menu.MenuImage = (sqlDataReader["MenuImage"] != null) ? sqlDataReader["MenuImage"].ToString() : String.Empty;
                    MenuList.Add(menu);
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return MenuList;
        }

        public static List<SubMenu> GetMenuListByCategoryID(string categoryId)
        {
            List<SubMenu> MenuList = new List<SubMenu>();
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_GetAllMenuListByCategory", sqlconnection);
            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlconnection;
                cmd.Parameters.Add("@CategoryID", SqlDbType.NVarChar, 100).Value = categoryId;
                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    SubMenu submenu = new SubMenu();
                    submenu.MenuID = (sqlDataReader["MenuID"] != null) ? sqlDataReader["MenuID"].ToString() : String.Empty;
                    submenu.CategoryID = (sqlDataReader["CategoryID"] != null) ? sqlDataReader["CategoryID"].ToString() : String.Empty;
                    submenu.CategoryName = (sqlDataReader["CategoryName"] != null) ? sqlDataReader["CategoryName"].ToString() : String.Empty;
                    submenu.MenuName = (sqlDataReader["MenuName"] != null) ? sqlDataReader["MenuName"].ToString() : String.Empty;
                    if (sqlDataReader["Price"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["Price"].ToString()))
                        {
                            submenu.Price = Convert.ToDecimal(sqlDataReader["Price"]);
                        }
                    }
                    submenu.Images = (sqlDataReader["Images"] != null) ? sqlDataReader["Images"].ToString() : String.Empty;
                    MenuList.Add(submenu);
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return MenuList;
        }

        public static List<Restaurant> GetRestaurantsByCustomPaging(int pageSize, int pageIndex)
        {
            List<Restaurant> RestaurantList = new List<Restaurant>();
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_GetRestaurantsByCustomPaging", sqlconnection);
            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlconnection;

                cmd.Parameters.Add("@PageSize", SqlDbType.Int).Value = pageSize;
                cmd.Parameters.Add("@PageIndex", SqlDbType.Int).Value = pageIndex;

                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    Restaurant restaurant = new Restaurant();
                    if (!string.IsNullOrEmpty(sqlDataReader["RestaurantID"].ToString()))
                    {
                        restaurant.RestaurantID = (int)sqlDataReader["RestaurantID"];
                    }
                    restaurant.RowNum = (sqlDataReader["RowNum"] != null) ? sqlDataReader["RowNum"].ToString() : String.Empty;
                    restaurant.Name = (sqlDataReader["Name"] != null) ? sqlDataReader["Name"].ToString() : String.Empty;
                    restaurant.Location = (sqlDataReader["Location"] != null) ? sqlDataReader["Location"].ToString() : String.Empty;
                    restaurant.Township = (sqlDataReader["Township"] != null) ? sqlDataReader["Township"].ToString() : String.Empty;
                    if (sqlDataReader["PriceRangeFrom"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["PriceRangeFrom"].ToString()))
                        {
                            restaurant.PriceRangeFrom = Convert.ToDecimal(sqlDataReader["PriceRangeFrom"].ToString());
                        }
                    }
                    if (sqlDataReader["PriceRangeTo"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["PriceRangeTo"].ToString()))
                        {
                            restaurant.PriceRangeTo = Convert.ToDecimal(sqlDataReader["PriceRangeTo"].ToString());
                        }
                    }
                    restaurant.RestaurantType = (sqlDataReader["RestaurantType"] != null) ? sqlDataReader["RestaurantType"].ToString() : String.Empty;
                    restaurant.RestaurantFeature = (sqlDataReader["Features"] != null) ? sqlDataReader["Features"].ToString() : String.Empty;
                    restaurant.Cuisine = (sqlDataReader["Cuisine"] != null) ? sqlDataReader["Cuisine"].ToString() : String.Empty;
                    if (sqlDataReader["OpenHour"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["OpenHour"].ToString()))
                        {
                            restaurant.OpenHour = System.DateTime.Now.Add(TimeSpan.Parse(sqlDataReader["OpenHour"].ToString()));
                        }
                    }
                    if (sqlDataReader["CloseHour"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["CloseHour"].ToString()))
                        {
                            restaurant.CloseHour = System.DateTime.Now.Add(TimeSpan.Parse(sqlDataReader["CloseHour"].ToString()));
                        }
                    }
                    restaurant.Tel = (sqlDataReader["Tel"] != null) ? sqlDataReader["Tel"].ToString() : String.Empty;
                    restaurant.Website = (sqlDataReader["Website"] != null) ? sqlDataReader["Website"].ToString() : String.Empty;
                    restaurant.UploadFile = (sqlDataReader["UploadFile"] != null) ? sqlDataReader["UploadFile"].ToString() : String.Empty;
                    restaurant.TotalReviews = (sqlDataReader["TotalReviews"] != null) ? sqlDataReader["TotalReviews"].ToString() : String.Empty;
                    restaurant.OverallRating = (sqlDataReader["OverallRating"] != null) ? sqlDataReader["OverallRating"].ToString() : String.Empty;
                    RestaurantList.Add(restaurant);
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return RestaurantList;
        }

        public static List<RestaurantReview> GetReviewsByCustomPaging(int pageSize, int pageIndex,int restaurantId)
        {
            List<RestaurantReview> ReviewList = new List<RestaurantReview>();
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_GetReviewsByCustomPaging", sqlconnection);

            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlconnection;

                cmd.Parameters.Add("@PageSize", SqlDbType.Int).Value = pageSize;
                cmd.Parameters.Add("@PageIndex", SqlDbType.Int).Value = pageIndex;
                cmd.Parameters.Add("@RestaurantID", SqlDbType.Int).Value = restaurantId;

                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    RestaurantReview review = new RestaurantReview();
                    review.Review = (sqlDataReader["Review"] != null) ? sqlDataReader["Review"].ToString() : String.Empty;
                    review.Title = (sqlDataReader["Title"] != null) ? sqlDataReader["Title"].ToString() : String.Empty;
                    review.OverallRating = (sqlDataReader["OverallRating"] != null) ? sqlDataReader["OverallRating"].ToString() : String.Empty;
                    review.CreatedUserName = (sqlDataReader["CreatedUserName"] != null) ? sqlDataReader["CreatedUserName"].ToString() : String.Empty;
                    review.CreatedUserProfile = (sqlDataReader["CreatedUserProfile"] != null) ? sqlDataReader["CreatedUserProfile"].ToString() : String.Empty;
                    if (sqlDataReader["CreatedDate"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["CreatedDate"].ToString()))
                        {
                            review.CreatedDate = Convert.ToDateTime(sqlDataReader["CreatedDate"]);
                        }
                    }
                    ReviewList.Add(review);
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return ReviewList;
        }

        public static List<Restaurant> GetRestsByCustomPagingAndTwnship(int pageSize, int pageIndex,string filter, string township,string sortby)
        {
            List<Restaurant> RestaurantList = new List<Restaurant>();
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_GetRestsByCustomPagingAndTwnship", sqlconnection);
            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlconnection;

                cmd.Parameters.Add("@PageSize", SqlDbType.Int).Value = pageSize;
                cmd.Parameters.Add("@PageIndex", SqlDbType.Int).Value = pageIndex;
                cmd.Parameters.Add("@Township", SqlDbType.NVarChar).Value = township;
                cmd.Parameters.Add("@Filter", SqlDbType.NVarChar).Value = filter;
                cmd.Parameters.Add("@SortBy", SqlDbType.NVarChar).Value = sortby;

                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    Restaurant restaurant = new Restaurant();
                    if (!string.IsNullOrEmpty(sqlDataReader["RestaurantID"].ToString()))
                    {
                        restaurant.RestaurantID = (int)sqlDataReader["RestaurantID"];

                    }
                    restaurant.RowNum = (sqlDataReader["RowNum"] != null) ? sqlDataReader["RowNum"].ToString() : String.Empty;
                    restaurant.Name = (sqlDataReader["Name"] != null) ? sqlDataReader["Name"].ToString() : String.Empty;
                    restaurant.Location = (sqlDataReader["Location"] != null) ? sqlDataReader["Location"].ToString() : String.Empty;
                    restaurant.Township = (sqlDataReader["Township"] != null) ? sqlDataReader["Township"].ToString() : String.Empty;
                    if (sqlDataReader["PriceRangeFrom"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["PriceRangeFrom"].ToString()))
                        {
                            restaurant.PriceRangeFrom = Convert.ToDecimal(sqlDataReader["PriceRangeFrom"].ToString());
                        }
                    }
                    if (sqlDataReader["PriceRangeTo"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["PriceRangeTo"].ToString()))
                        {
                            restaurant.PriceRangeTo = Convert.ToDecimal(sqlDataReader["PriceRangeTo"].ToString());
                        }
                    }
                    restaurant.RestaurantType = (sqlDataReader["RestaurantType"] != null) ? sqlDataReader["RestaurantType"].ToString() : String.Empty;
                    if (sqlDataReader["OpenHour"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["OpenHour"].ToString()))
                        {
                            restaurant.OpenHour = System.DateTime.Now.Add(TimeSpan.Parse(sqlDataReader["OpenHour"].ToString()));
                        }
                    }
                    if (sqlDataReader["CloseHour"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["CloseHour"].ToString()))
                        {
                            restaurant.CloseHour = System.DateTime.Now.Add(TimeSpan.Parse(sqlDataReader["CloseHour"].ToString()));
                        }
                    }
                    restaurant.Tel = (sqlDataReader["Tel"] != null) ? sqlDataReader["Tel"].ToString() : String.Empty;
                    restaurant.Website = (sqlDataReader["Website"] != null) ? sqlDataReader["Website"].ToString() : String.Empty;
                    restaurant.UploadFile = (sqlDataReader["UploadFile"] != null) ? sqlDataReader["UploadFile"].ToString() : String.Empty;
                    restaurant.TotalReviews = (sqlDataReader["TotalReviews"] != null) ? sqlDataReader["TotalReviews"].ToString() : String.Empty;
                    restaurant.OverallRating = (sqlDataReader["OverallRating"] != null) ? sqlDataReader["OverallRating"].ToString() : String.Empty;
                    RestaurantList.Add(restaurant);
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return RestaurantList;
        }

        public static List<Menu> GetMenuByCategoryCustomPaging(int pageSize, int pageIndex, string categoryId, int restaurantId)
        {
            List<Menu> menuList = new List<Menu>();

            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);

            try
            {
                string cmdText = "SELECT * FROM(SELECT ROW_NUMBER() OVER (ORDER BY RestaurantID  DESC) AS RowNum,MenuID,RestaurantID,";
                cmdText += "(SELECT CategoryName FROM tblCategory WHERE tblCategory.CategoryID = tblMenu.CategoryID) AS CategoryName,CategoryID,MenuName,Price,MenuImage ";
                cmdText += "FROM tblMenu ";
                if (categoryId.ToLower() != "all") cmdText += "WHERE CategoryID = @CategoryID ";
                cmdText += ") Menu WHERE Menu.RowNum BETWEEN (@PageSize*(@PageIndex-1))+1 AND (@PageSize*(@PageIndex-1))+@PageSize ";
                cmdText += "AND Menu.RestaurantID = @RestaurantID ";

                SqlCommand cmd = new SqlCommand(cmdText, sqlconnection);

                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@RestaurantID", restaurantId);
                cmd.Parameters.AddWithValue("@PageSize", pageSize);
                cmd.Parameters.AddWithValue("@PageIndex", pageIndex);

                if (categoryId.ToLower() != "all")
                    cmd.Parameters.AddWithValue("@CategoryID", categoryId);

                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    Menu menu = new Menu();
                    if (!string.IsNullOrEmpty(sqlDataReader["MenuID"].ToString()))
                    {
                        menu.MenuID = (int)sqlDataReader["MenuID"];
                    }
                    if (!string.IsNullOrEmpty(sqlDataReader["CategoryID"].ToString()))
                    {
                        menu.CategoryID = (int)sqlDataReader["CategoryID"];
                    }
                    menu.CategoryName = (sqlDataReader["CategoryName"] != null) ? sqlDataReader["CategoryName"].ToString() : String.Empty;
                    menu.MenuName = (sqlDataReader["MenuName"] != null) ? sqlDataReader["MenuName"].ToString() : String.Empty;
                    if (sqlDataReader["Price"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["Price"].ToString()))
                        {
                            menu.Price = Convert.ToDecimal(sqlDataReader["Price"]);
                        }
                    }
                    menu.MenuImage = (sqlDataReader["MenuImage"] != null) ? sqlDataReader["MenuImage"].ToString() : String.Empty;
                    menuList.Add(menu);
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return menuList;
        }

        public static List<User> GetUserList()
        {
            List<User> UserList = new List<User>();
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("SELECT * FROM tblUsers", sqlconnection);
            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = sqlconnection;
                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    User user = new User();
                    if (sqlDataReader["UserID"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["UserID"].ToString()))
                        {
                            user.UserID = Convert.ToInt32(sqlDataReader["UserID"]);
                        }
                    }
                    user.UserName = (sqlDataReader["UserName"] != null) ? sqlDataReader["UserName"].ToString() : String.Empty;
                    user.Email = (sqlDataReader["Email"] != null) ? sqlDataReader["Email"].ToString() : String.Empty;
                    user.Password = (sqlDataReader["Password"] != null) ? sqlDataReader["Password"].ToString() : String.Empty;
                    user.UserRole = (sqlDataReader["UserRole"] != null) ? sqlDataReader["UserRole"].ToString() : String.Empty;
                    UserList.Add(user);
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return UserList;
        }

        public static List<Menu> GetMenuListing()
        {
            List<Menu> MenuList = new List<Menu>();
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_GetMenuListing", sqlconnection);
            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlconnection;
                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    Menu menu = new Menu();
                    if (!string.IsNullOrEmpty(sqlDataReader["RestaurantID"].ToString()))
                    {
                        menu.RestaurantID = (int)sqlDataReader["RestaurantID"];
                    }
                    menu.RestaurantName = (sqlDataReader["RestaurantName"] != null) ? sqlDataReader["RestaurantName"].ToString() : String.Empty;
                    menu.MenuName = (sqlDataReader["MenuName"] != null) ? sqlDataReader["MenuName"].ToString() : String.Empty;
                    menu.CategoryName = (sqlDataReader["CategoryName"] != null) ? sqlDataReader["CategoryName"].ToString() : String.Empty;
                    if (sqlDataReader["Price"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["Price"].ToString()))
                        {
                            menu.Price = Convert.ToDecimal(sqlDataReader["Price"]);
                        }
                    }
                    menu.MenuImage = (sqlDataReader["MenuImage"] != null) ? sqlDataReader["MenuImage"].ToString() : String.Empty;
                    MenuList.Add(menu);
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return MenuList;
        }

        public static List<RestaurantReview> GetAllReviews(int restaurantId)
        {
            List<RestaurantReview> ReviewList = new List<RestaurantReview>();
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("SELECT Review,Title,OverallRating,(SELECT UserName FROM tblUsers WHERE CreatedUserID = tblUsers.UserID) AS CreatedUserName,(SELECT UserImage FROM tblUsers WHERE CreatedUserID = tblUsers.UserID) AS CreatedUserProfile,CreatedDate FROM tblReviews WHERE RestaurantID = @RestaurantID", sqlconnection);
            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@RestaurantID", restaurantId);

                cmd.Connection = sqlconnection;
                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    RestaurantReview review = new RestaurantReview();
                    review.Review = (sqlDataReader["Review"] != null) ? sqlDataReader["Review"].ToString() : String.Empty;
                    review.Title = (sqlDataReader["Title"] != null) ? sqlDataReader["Title"].ToString() : String.Empty;
                    review.OverallRating = (sqlDataReader["OverallRating"] != null) ? sqlDataReader["OverallRating"].ToString() : String.Empty;
                    review.CreatedUserName = (sqlDataReader["CreatedUserName"] != null) ? sqlDataReader["CreatedUserName"].ToString() : String.Empty;
                    review.CreatedUserProfile = (sqlDataReader["CreatedUserProfile"] != null) ? sqlDataReader["CreatedUserProfile"].ToString() : String.Empty;
                    if (sqlDataReader["CreatedDate"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["CreatedDate"].ToString()))
                        {
                            review.CreatedDate = Convert.ToDateTime(sqlDataReader["CreatedDate"]);
                        }
                    }
                    ReviewList.Add(review);
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return ReviewList;
        }

        public static List<TopPost> GetTopPosts(string postType)
        {
            List<TopPost> TopPostList = new List<TopPost>();
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);

            string cmdText = "SELECT Top 2 PostId,PostTitle, PostContent, PostImage,";
            cmdText += "(SELECT UserName FROM tblusers WHERE PostedBy = UserID) AS PostedUser,";
            cmdText += "PostedDate FROM tblPosts WHERE PostType=@PostType ORDER BY PostedDate DESC";

            SqlCommand cmd = new SqlCommand(cmdText, sqlconnection);
            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@PostType", postType);
                cmd.Connection = sqlconnection;

                SqlDataReader sqlDataReader = cmd.ExecuteReader();

                while (sqlDataReader.Read())
                {
                    TopPost topPost = new TopPost();

                    if (sqlDataReader["PostId"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["PostId"].ToString()))
                        {
                            topPost.PostId = Convert.ToInt32(sqlDataReader["PostId"]);
                        }
                    }

                    topPost.PostTitle = (sqlDataReader["PostTitle"] != null) ? sqlDataReader["PostTitle"].ToString() : String.Empty;
                    topPost.PostContent = (sqlDataReader["PostContent"] != null) ? sqlDataReader["PostContent"].ToString() : String.Empty;
                    topPost.PostImage = (sqlDataReader["PostImage"] != null) ? sqlDataReader["PostImage"].ToString() : String.Empty;
                    topPost.PostedUser = (sqlDataReader["PostedUser"] != null) ? sqlDataReader["PostedUser"].ToString() : String.Empty;
                    if (sqlDataReader["PostedDate"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["PostedDate"].ToString()))
                        {
                            topPost.PostedDate = Convert.ToDateTime(sqlDataReader["PostedDate"]);
                        }
                    }
                    TopPostList.Add(topPost);
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return TopPostList;
        }

        public static List<NewPost> GetNewPosts(string postType)
        {
            List<NewPost> NewPostList = new List<NewPost>();
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);

            string cmdText = "SELECT PostId,PostTitle, PostContent, PostImage,";
            cmdText += "(SELECT UserName FROM tblusers WHERE PostedBy = UserID) AS PostedUser,";
            cmdText += "PostedDate FROM tblPosts WHERE PostType=@PostType";
            cmdText += " ORDER BY PostedDate DESC";
            cmdText += " OFFSET  2 ROWS";
            cmdText += " FETCH NEXT 3 ROWS ONLY";

            SqlCommand cmd = new SqlCommand(cmdText, sqlconnection);

            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@PostType", postType);
                cmd.Connection = sqlconnection;
                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    NewPost newPost = new NewPost();

                    if (sqlDataReader["PostId"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["PostId"].ToString()))
                        {
                            newPost.PostId = Convert.ToInt32(sqlDataReader["PostId"]);
                        }
                    }

                    newPost.PostTitle = (sqlDataReader["PostTitle"] != null) ? sqlDataReader["PostTitle"].ToString() : String.Empty;
                    newPost.PostContent = (sqlDataReader["PostContent"] != null) ? sqlDataReader["PostContent"].ToString() : String.Empty;
                    newPost.PostImage = (sqlDataReader["PostImage"] != null) ? sqlDataReader["PostImage"].ToString() : String.Empty;
                    newPost.PostedUser = (sqlDataReader["PostedUser"] != null) ? sqlDataReader["PostedUser"].ToString() : String.Empty;
                    if (sqlDataReader["PostedDate"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["PostedDate"].ToString()))
                        {
                            newPost.PostedDate = Convert.ToDateTime(sqlDataReader["PostedDate"]);
                        }
                    }
                    NewPostList.Add(newPost);
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return NewPostList;
        }

        public static List<RecentPost> GetRecentPosts(string postType)
        {
            List<RecentPost> RecentPostList = new List<RecentPost>();
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);

            string cmdText = " SELECT PostId,PostTitle, PostImage";
            cmdText += " FROM tblPosts WHERE PostType=@PostType";
            cmdText += " ORDER BY PostedDate DESC";
            cmdText += " OFFSET  5 ROWS";
            cmdText += " FETCH NEXT 5 ROWS ONLY";

            SqlCommand cmd = new SqlCommand(cmdText, sqlconnection);
            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@PostType", postType);
                cmd.Connection = sqlconnection;
                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    RecentPost recentPost = new RecentPost();

                    if (sqlDataReader["PostId"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["PostId"].ToString()))
                        {
                            recentPost.PostId = Convert.ToInt32(sqlDataReader["PostId"]);
                        }
                    }

                    recentPost.PostTitle = (sqlDataReader["PostTitle"] != null) ? sqlDataReader["PostTitle"].ToString() : String.Empty;
                    recentPost.PostImage = (sqlDataReader["PostImage"] != null) ? sqlDataReader["PostImage"].ToString() : String.Empty;
                    RecentPostList.Add(recentPost);
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return RecentPostList;
        }

        public static List<OldPost> GetOldPosts(string postType)
        {
            List<OldPost> oldpostList = new List<OldPost>();
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);

            string cmdText = " SELECT PostId,PostTitle FROM tblPosts WHERE PostType=@PostType";
            cmdText += " ORDER BY PostedDate DESC";
            cmdText += " OFFSET  10 ROWS";
            cmdText += " FETCH NEXT 5 ROWS ONLY";

            SqlCommand cmd = new SqlCommand(cmdText, sqlconnection);
            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@PostType", postType);
                cmd.Connection = sqlconnection;
                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    OldPost oldPost = new OldPost();

                    if (sqlDataReader["PostId"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["PostId"].ToString()))
                        {
                            oldPost.PostId = Convert.ToInt32(sqlDataReader["PostId"]);
                        }
                    }

                    oldPost.PostTitle = (sqlDataReader["PostTitle"] != null) ? sqlDataReader["PostTitle"].ToString() : String.Empty;
                    oldpostList.Add(oldPost);
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return oldpostList;
        }

        public static User GetUserInfo(int userId)
        {
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("SELECT UserName,Email,Password,UserRole,UserImage FROM tblUsers WHERE UserID=@UserID", sqlconnection);
            User user = new User();
            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@UserID", userId);

                SqlDataReader sqlDataReader = cmd.ExecuteReader();

                if (sqlDataReader.Read())
                {
                    user.UserName = (sqlDataReader["UserName"] != null) ? sqlDataReader["UserName"].ToString() : String.Empty;
                    user.Email = (sqlDataReader["Email"] != null) ? sqlDataReader["Email"].ToString() : String.Empty;
                    user.Password = (sqlDataReader["Password"] != null) ? sqlDataReader["Password"].ToString() : String.Empty;
                    user.UserRole = (sqlDataReader["UserRole"] != null) ? sqlDataReader["UserRole"].ToString() : String.Empty;
                    user.UserImage = (sqlDataReader["UserImage"] != null) ? sqlDataReader["UserImage"].ToString() : String.Empty;
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return user;
        }

        public static Post GetPostDetails(int postId)
        {
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);

            string cmdText = "SELECT PostTitle, PostContent,PostType,PostImage,";
            cmdText += "(SELECT UserName FROM tblusers WHERE PostedBy = UserID) as PostedUser,";
            cmdText += "PostedDate FROM tblPosts WHERE PostId = @PostId";

            SqlCommand cmd = new SqlCommand(cmdText, sqlconnection);

            Post post = new Post();

            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@PostId", postId);

                SqlDataReader sqlDataReader = cmd.ExecuteReader();

                if (sqlDataReader.Read())
                {
                    post.PostTitle = (sqlDataReader["PostTitle"] != null) ? sqlDataReader["PostTitle"].ToString() : String.Empty;
                    post.PostContent = (sqlDataReader["PostContent"] != null) ? sqlDataReader["PostContent"].ToString() : String.Empty;
                    post.PostType = (sqlDataReader["PostType"] != null) ? sqlDataReader["PostType"].ToString() : String.Empty;
                    post.PostImage = (sqlDataReader["PostImage"] != null) ? sqlDataReader["PostImage"].ToString() : String.Empty;
                    post.PostedUser = (sqlDataReader["PostedUser"] != null) ? sqlDataReader["PostedUser"].ToString() : String.Empty;
                    if (sqlDataReader["PostedDate"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["PostedDate"].ToString()))
                        {
                            post.PostedDate = Convert.ToDateTime(sqlDataReader["PostedDate"]);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return post;
        }

        public static string CreateRestaurant(Restaurant restaurant, String image)
        {
            string errorMessage = string.Empty;

            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_CreateRestaurant", sqlconnection);

            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@RestaurantID", restaurant.RestaurantID);
                cmd.Parameters.AddWithValue("@Name", restaurant.Name);
                cmd.Parameters.AddWithValue("@Location", restaurant.Location);
                cmd.Parameters.AddWithValue("@Township", restaurant.Township);
                cmd.Parameters.AddWithValue("@Features", restaurant.RestaurantFeature);
                cmd.Parameters.AddWithValue("@Cuisine", restaurant.Cuisine);
                cmd.Parameters.AddWithValue("@PriceRangeFrom", restaurant.PriceRangeFrom);
                cmd.Parameters.AddWithValue("@PriceRangeTo", restaurant.PriceRangeTo);
                cmd.Parameters.AddWithValue("@RestaurantType", restaurant.RestaurantType);
                cmd.Parameters.AddWithValue("@OpenHour", restaurant.OpenHour);
                cmd.Parameters.AddWithValue("@CloseHour", restaurant.CloseHour);
                cmd.Parameters.AddWithValue("@Tel", restaurant.Tel);
                cmd.Parameters.AddWithValue("@Website", restaurant.Website);
                cmd.Parameters.AddWithValue("@UploadFile", image);

                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return errorMessage;
        }

        public static string CreateCategory(Category category)
        {
            string errorMessage = string.Empty;

            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_CreateCategory", sqlconnection);

            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@RestaurantID", category.RestaurantID);
                cmd.Parameters.AddWithValue("@CategoryName", category.CategoryName);

                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return errorMessage;
        }

        public static void CreateMenu(Menu menu,int restaurantId)
        {
            string errorMessage = string.Empty;

            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_CreateMenu", sqlconnection);

            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@MenuID", menu.MenuID);
                cmd.Parameters.AddWithValue("@CategoryID", menu.CategoryID);
                cmd.Parameters.AddWithValue("@RestaurantID", menu.RestaurantID);
                cmd.Parameters.AddWithValue("@MenuName",menu.MenuName);
                cmd.Parameters.AddWithValue("@Price", menu.Price);
                cmd.Parameters.AddWithValue("@MenuImage", menu.MenuImage);

                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
        }

        public static void CreateReview(RestaurantReview review)
        {
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_CreateReview", sqlconnection);

            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@RestaurantID", review.RestaurantID);
                cmd.Parameters.AddWithValue("@Title", review.Title);
                cmd.Parameters.AddWithValue("@Review", review.Review);
                cmd.Parameters.AddWithValue("@FoodRating", review.FoodRating);
                cmd.Parameters.AddWithValue("@ServiceRating", review.ServiceRating);
                cmd.Parameters.AddWithValue("@CleanlinessRating", review.CleanlinessRating);
                cmd.Parameters.AddWithValue("@OverallRating", review.OverallRating);
                cmd.Parameters.AddWithValue("@CreatedUserID", review.CreatedUserID);
                cmd.Parameters.AddWithValue("@CreatedDate", review.CreatedDate);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
        }

        public static void CreateAccount(User user)
        {

            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_CreateUserAccount", sqlconnection);

            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserName", user.UserName);
                cmd.Parameters.AddWithValue("@Email", user.Email);
                cmd.Parameters.AddWithValue("@Password", user.Password);
                cmd.Parameters.AddWithValue("@UserRole", user.UserRole);
                cmd.Parameters.AddWithValue("@UserImage", user.UserImage ?? string.Empty);
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
        }

        public static void CreatePost(Post post)
        {
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_CreatePost", sqlconnection);

            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@PostTitle", post.PostTitle);
                cmd.Parameters.AddWithValue("@PostContent", post.PostContent);
                cmd.Parameters.AddWithValue("@PostType", post.PostType);
                cmd.Parameters.AddWithValue("@PostImage", post.PostImage);
                cmd.Parameters.AddWithValue("@PostedBy", post.PostedBy);
                cmd.Parameters.AddWithValue("@PostedDate", post.PostedDate);
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
        }

        public static void DeleteRestaurant(string restaurantId)
        {

            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_DeleteRestaurant", sqlconnection);

            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@RestaurantID", restaurantId);

                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
        }

        public static void DeleteMenu(string menuId)
        {
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_DeleteMenu", sqlconnection);

            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@MenuID", menuId);

                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
        }

        public static void DeleteUser(int userId)
        {
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("DELETE FROM tblUsers WHERE UserID=@UserID", sqlconnection);

            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@UserID", userId);

                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
        }

        public static void DeleteCategory(string categoryId)
        {
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("DELETE FROM tblCategory WHERE CategoryID=@CategoryID", sqlconnection);

            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@CategoryID", categoryId);

                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
        }

        public static Restaurant GetRestaurantDetail(int restaurantId)
        {
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_GetRestaurantDetail", sqlconnection);
            Restaurant restaurant = new Restaurant();

            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlconnection;
                cmd.Parameters.Add("@RestaurantID", SqlDbType.Int).Value = restaurantId;
                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    restaurant.Name = (sqlDataReader["Name"] != null) ? sqlDataReader["Name"].ToString() : String.Empty;
                    restaurant.Location = (sqlDataReader["Location"] != null) ? sqlDataReader["Location"].ToString() : String.Empty;
                    restaurant.Township = (sqlDataReader["Township"] != null) ? sqlDataReader["Township"].ToString() : String.Empty;
                    if (sqlDataReader["PriceRangeFrom"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["PriceRangeFrom"].ToString()))
                        {
                            restaurant.PriceRangeFrom = Convert.ToDecimal(sqlDataReader["PriceRangeFrom"].ToString());
                        }
                    }
                    if (sqlDataReader["PriceRangeTo"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["PriceRangeTo"].ToString()))
                        {
                            restaurant.PriceRangeTo = Convert.ToDecimal(sqlDataReader["PriceRangeTo"].ToString());
                        }
                    }
                    restaurant.RestaurantFeature = (sqlDataReader["Features"] != null) ? sqlDataReader["Features"].ToString() : String.Empty;
                    restaurant.RestaurantType = (sqlDataReader["RestaurantType"] != null) ? sqlDataReader["RestaurantType"].ToString() : String.Empty;
                    restaurant.Cuisine = (sqlDataReader["Cuisine"] != null) ? sqlDataReader["Cuisine"].ToString() : String.Empty;
                    if (sqlDataReader["OpenHour"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["OpenHour"].ToString()))
                        {
                            restaurant.OpenHour = Convert.ToDateTime(sqlDataReader["OpenHour"].ToString());
                        }
                    }
                    if (sqlDataReader["CloseHour"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["CloseHour"].ToString()))
                        {
                            restaurant.CloseHour = Convert.ToDateTime(sqlDataReader["CloseHour"].ToString());
                        }
                    }
                    restaurant.Tel = (sqlDataReader["Tel"] != null) ? sqlDataReader["Tel"].ToString() : String.Empty;
                    restaurant.Website = (sqlDataReader["Website"] != null) ? sqlDataReader["Website"].ToString() : String.Empty;
                    restaurant.UploadFile = (sqlDataReader["UploadFile"] != null) ? sqlDataReader["UploadFile"].ToString() : String.Empty;
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return restaurant;
        }

        public static Menu EditMenu(string menuId)
        {
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_EditMenu", sqlconnection);
            Menu menu = new Menu();

            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlconnection;
                cmd.Parameters.Add("@MenuID", SqlDbType.Int, 100).Value = menuId;
                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                while (sqlDataReader.Read())
                {
                    menu.MenuName = (sqlDataReader["MenuName"] != null) ? sqlDataReader["MenuName"].ToString() : String.Empty;
                    if (sqlDataReader["Price"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["Price"].ToString()))
                        {
                            menu.Price = Convert.ToDecimal(sqlDataReader["Price"]);
                        }
                    }
                    if (!string.IsNullOrEmpty(sqlDataReader["CategoryID"].ToString()))
                    {
                        menu.CategoryID = (int)sqlDataReader["CategoryID"];
                    }
                    menu.MenuImage = (sqlDataReader["MenuImage"] != null) ? sqlDataReader["MenuImage"].ToString() : String.Empty;
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return menu;
        }

        public static User IsAccountExist(string name)
        {
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("sp_CheckAccountExist", sqlconnection);
            User user = new User();
            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserName", name ?? string.Empty);

                SqlDataReader sqlDataReader = cmd.ExecuteReader();

                if (sqlDataReader.Read())
                {
                    if (sqlDataReader["UserID"] != null)
                    {
                        if (!string.IsNullOrEmpty(sqlDataReader["UserID"].ToString()))
                        {
                            user.UserID = Convert.ToInt32(sqlDataReader["UserID"]);
                        }
                    }
                    user.UserName = (sqlDataReader["UserName"] != null) ? sqlDataReader["UserName"].ToString() : String.Empty;
                    user.Email = (sqlDataReader["Email"] != null) ? sqlDataReader["Email"].ToString() : String.Empty;
                    user.Password = (sqlDataReader["Password"] != null) ? sqlDataReader["Password"].ToString() : String.Empty;
                    user.UserRole = (sqlDataReader["UserRole"] != null) ? sqlDataReader["UserRole"].ToString() : String.Empty;
                    user.UserImage = (sqlDataReader["UserImage"] != null) ? sqlDataReader["UserImage"].ToString() : String.Empty;
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return user;
        }

        public static string Set_Paging(Int32 pageNumber, int pageSize, Int64 totalRecords, string className, string pageUrl, string disableClassName)
        {
            string ReturnValue = "";
            try
            {
                Int64 TotalPages = Convert.ToInt64(Math.Ceiling((double)totalRecords / pageSize));
                if (pageNumber > 1)
                {
                    if (pageNumber == 2)
                        ReturnValue = ReturnValue + "<a href='" + pageUrl.Trim() + "?pn=" + Convert.ToString(pageNumber - 1) + "' class='" + className + "'>Previous</a>&nbsp;&nbsp;&nbsp;";
                    else
                    {
                        ReturnValue = ReturnValue + "<a href='" + pageUrl.Trim();
                        if (pageUrl.Contains("?"))
                            ReturnValue = ReturnValue + "&";
                        else
                            ReturnValue = ReturnValue + "?";
                        ReturnValue = ReturnValue + "pn=" + Convert.ToString(pageNumber - 1) + "' class='" + className + "'>Previous</a>&nbsp;&nbsp;&nbsp;";
                    }
                }
                else
                    ReturnValue = ReturnValue + "<span class='" + disableClassName + "'>Previous</span>&nbsp;&nbsp;&nbsp;";
                if ((pageNumber - 3) > 1)
                    ReturnValue = ReturnValue + "<a href='" + pageUrl.Trim() + "' class='" + className + "'>1</a>&nbsp;.....&nbsp;|&nbsp;";
                for (int i = pageNumber - 3; i <= pageNumber; i++)
                    if (i >= 1)
                    {
                        if (pageNumber != i)
                        {
                            ReturnValue = ReturnValue + "<a href='" + pageUrl.Trim();
                            if (pageUrl.Contains("?"))
                                ReturnValue = ReturnValue + "&";
                            else
                                ReturnValue = ReturnValue + "?";
                            ReturnValue = ReturnValue + "pn=" + i.ToString() + "' class='" + className + "'>" + i.ToString() + "</a>&nbsp;|&nbsp;";
                        }
                        else
                        {
                            ReturnValue = ReturnValue + "<span style='font-weight:bold;'>" + i + "</span>&nbsp;|&nbsp;";
                        }
                    }
                for (int i = pageNumber + 1; i <= pageNumber + 3; i++)
                    if (i <= TotalPages)
                    {
                        if (pageNumber != i)
                        {
                            ReturnValue = ReturnValue + "<a href='" + pageUrl.Trim();
                            if (pageUrl.Contains("?"))
                                ReturnValue = ReturnValue + "&";
                            else
                                ReturnValue = ReturnValue + "?";
                            ReturnValue = ReturnValue + "pn=" + i.ToString() + "' class='" + className + "'>" + i.ToString() + "</a>&nbsp;|&nbsp;";
                        }
                        else
                        {
                            ReturnValue = ReturnValue + "<span style='font-weight:bold;'>" + i + "</span>&nbsp;|&nbsp;";
                        }
                    }
                if ((pageNumber + 3) < TotalPages)
                {
                    ReturnValue = ReturnValue + ".....&nbsp;<a href='" + pageUrl.Trim();
                    if (pageUrl.Contains("?"))
                        ReturnValue = ReturnValue + "&";
                    else
                        ReturnValue = ReturnValue + "?";
                    ReturnValue = ReturnValue + "pn=" + TotalPages.ToString() + "' class='" + className + "'>" + TotalPages.ToString() + "</a>";
                }
                if (pageNumber < TotalPages)
                {
                    ReturnValue = ReturnValue + "&nbsp;&nbsp;&nbsp;<a href='" + pageUrl.Trim();
                    if (pageUrl.Contains("?"))
                        ReturnValue = ReturnValue + "&";
                    else
                        ReturnValue = ReturnValue + "?";
                    ReturnValue = ReturnValue + "pn=" + Convert.ToString(pageNumber + 1) + "' class='" + className + "'>Next</a>";
                }
                else
                    ReturnValue = ReturnValue + "&nbsp;&nbsp;&nbsp;<span class='" + disableClassName + "'>Next</span>";
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            return (ReturnValue);
        }

        public static string GetRestaurantName(int editRestaurantId)
        {
            string restaurantName = string.Empty;

            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("SELECT Name FROM tblRestaurants WHERE tblRestaurants.RestaurantID=@RestaurantID", sqlconnection);

            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@RestaurantID", editRestaurantId);

                SqlDataReader sqlDataReader = cmd.ExecuteReader();

                if (sqlDataReader.Read())
                {
                    restaurantName = (sqlDataReader["Name"] != DBNull.Value) ? sqlDataReader["Name"].ToString() : string.Empty;
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return restaurantName;
        }

        public static int GetMenuTotalListCount(string categoryId, int restaurantId)
        {
            int totalcount = 0;

            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);

            try
            {
                string cmdText = "SELECT COUNT(*) AS TotalCount FROM tblMenu ";
                cmdText += "WHERE RestaurantID = @RestaurantID ";
                if (categoryId.ToLower() != "all") cmdText += " AND CategoryID = @CategoryID";

                SqlCommand cmd = new SqlCommand(cmdText, sqlconnection);

                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.AddWithValue("@RestaurantID", restaurantId);

                if (categoryId.ToLower() != "all")
                    cmd.Parameters.AddWithValue("@CategoryID", categoryId);

                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                if (sqlDataReader.Read())
                {
                    totalcount = int.Parse(sqlDataReader["TotalCount"].ToString());
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return totalcount;
        }

        public static int GetRestaurantListCount()
        {
            int totalcount = 0;

            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);

            try
            {
                string cmdText = "SELECT Count(RestaurantID) FROM tblRestaurants";

                SqlCommand cmd = new SqlCommand(cmdText, sqlconnection);

                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;

                totalcount =(int)cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return totalcount;
        }

        public static int GetMenuListCount(int restaurantId)
        {
            int totalcount = 0;

            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);

            try
            {
                string cmdText = "SELECT Count(MenuID) FROM tblMenu WHERE RestaurantID=@RestaurantID";

                SqlCommand cmd = new SqlCommand(cmdText, sqlconnection);

                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@RestaurantID", restaurantId);

                totalcount = (int)cmd.ExecuteScalar();

            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return totalcount;
        }

        public static int GetCategoryListCount()
        {
            int totalcount = 0;

            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);

            try
            {
                string cmdText = "SELECT Count(CategoryID) FROM tblCategory";

                SqlCommand cmd = new SqlCommand(cmdText, sqlconnection);

                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;

                totalcount = (int)cmd.ExecuteScalar();

            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return totalcount;
        }

        public static int GetRestaurantTotalListCount(string township)
        {
            int totalcount = 0;

            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);

            try
            {
                string cmdText = "SELECT COUNT(*) AS TotalCount FROM tblRestaurants";
                if(!string.IsNullOrEmpty(township) ) cmdText += " WHERE Township=@Township";

                SqlCommand cmd = new SqlCommand(cmdText, sqlconnection);

                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;

                if (!string.IsNullOrEmpty(township))
                    cmd.Parameters.AddWithValue("@Township", township);

                SqlDataReader sqlDataReader = cmd.ExecuteReader();
                if (sqlDataReader.Read())
                {
                    totalcount = int.Parse(sqlDataReader["TotalCount"].ToString());
                }
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return totalcount;
        }

        public static int GetUserListCount()
        {
            int totalcount = 0;

            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);

            try
            {
                string cmdText = "SELECT Count(UserID) FROM tblUsers";

                SqlCommand cmd = new SqlCommand(cmdText, sqlconnection);

                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;

                totalcount = (int)cmd.ExecuteScalar();

            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return totalcount;
        }

        public static int GetMenuListCount()
        {
            int totalcount = 0;

            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);

            try
            {
                string cmdText = "SELECT Count(UserID) FROM tblUsers";

                SqlCommand cmd = new SqlCommand(cmdText, sqlconnection);

                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;

                totalcount = (int)cmd.ExecuteScalar();

            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return totalcount;
        }

        public static int GetReviewListCount(int restaurantId)
        {
            int totalcount = 0;

            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);

            try
            {
                string cmdText = "SELECT Count(ID) FROM tblReviews WHERE RestaurantID = @RestauarntID";

                SqlCommand cmd = new SqlCommand(cmdText, sqlconnection);

                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@RestauarntID", restaurantId);

                totalcount = (int)cmd.ExecuteScalar();

            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
            return totalcount;
        }

        public static void UpdateUserProfileImage(int userId,string userImage)
        {
            SqlConnection sqlconnection = new SqlConnection(foodreviewsdbconnection);
            SqlCommand cmd = new SqlCommand("UPDATE tblUsers SET UserImage=@UserImage WHERE UserID=@UserID", sqlconnection);

            try
            {
                sqlconnection.Open();
                cmd.CommandType = CommandType.Text;
                cmd.Connection = sqlconnection;
                cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = userId;
                cmd.Parameters.Add("@UserImage", SqlDbType.NVarChar).Value = userImage;
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ErrorLogString(ex);
            }
            finally
            {
                sqlconnection.Close();
            }
        }

        public static void ErrorLogString(Exception str)
        {
            string message = string.Format("Time: {0}", DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt"));
            message += Environment.NewLine;
            message += str;
            message += Environment.NewLine;

            CreateErrorLog(message);
        }

        public static void CreateErrorLog(string message)
        {
            FileInfo fileInfo = new FileInfo(ErrLogfile);
            if (!fileInfo.Exists)
                Directory.CreateDirectory(fileInfo.Directory.FullName);

            using (StreamWriter strmwriter = new StreamWriter(ErrLogfile, true))
            {
                strmwriter.WriteLine(message);
                strmwriter.Close();
            }
        }
    }
}