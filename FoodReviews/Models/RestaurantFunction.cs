using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace FoodReviews
{
    public class RestaurantFunction
    {
        //public int AddRestaurant(Restaurant Restaurant)
        //{
        //    String connetionString;
        //    SqlConnection cnn;

        //    connetionString = @"Data Source=PC;Initial Catalog=FoodReviewsDB;User ID=sa;Pwd=echo123;";
        //    cnn = new SqlConnection(connetionString);
        //    cnn.Open();
        //    SqlCommand cmd = new SqlCommand("insert into  [tblRestaurants](Name,Address,Township,[From],[To],RestaurantType,GoodFor,OpenHour,CloseHour,Phone,Website,UploadFile) values (@Name,@Address,@Township,@From,@To,@RestaurantType,@GoodFor,@OpenHour,@CloseHour,@Phone,@Website,@UploadFile)", cnn);
        //    cmd.Parameters.AddWithValue(@"Name", Restaurant.Name);
        //    cmd.Parameters.AddWithValue(@"Address", Restaurant.Location);
        //    cmd.Parameters.AddWithValue(@"Township", Restaurant.Township);
        //    cmd.Parameters.AddWithValue(@"From", Restaurant.From);
        //    cmd.Parameters.AddWithValue(@"To", Restaurant.To);
        //    cmd.Parameters.AddWithValue(@"RestaurantType", Restaurant.RestaurantType);
        //    cmd.Parameters.AddWithValue(@"GoodFor", Restaurant.GoodFor);
        //    cmd.Parameters.AddWithValue(@"OpenHour", Restaurant.OpenHour);
        //    cmd.Parameters.AddWithValue(@"CloseHour", Restaurant.CloseHour);
        //    cmd.Parameters.AddWithValue(@"Phone", Restaurant.Phone);
        //    cmd.Parameters.AddWithValue(@"Website", Restaurant.Website);
        //    cmd.Parameters.AddWithValue(@"UploadFile", Restaurant.UploadFile);
        //    cmd.ExecuteNonQuery();
        //    cnn.Close();

        //    return Restaurant.Id;
        //}

        //public void UpdateRestaurant(Restaurant Restaurant)
        //{
        //    String connetionString;
        //    SqlConnection cnn;

        //    connetionString = @"Data Source=PC;Initial Catalog=FoodReviewsDB;User ID=sa;Pwd=echo123;";
        //    cnn = new SqlConnection(connetionString);
        //    cnn.Open();
        //    SqlCommand cmd = new SqlCommand(" UPDATE [tblRestaurants] SET [Name] = @Name, [Address] = @Address, [Township] = @Township, [From] = @From, [To] = @To,  [RestaurantType] = @RestaurantType, [GoodFor] = @GoodFor,[OpenHour]=@OpenHour,[CloseHour]=@CloseHour,[Phone]=@Phone,[Website]=@Website WHERE Id=@Id", cnn);
        //    cmd.Parameters.AddWithValue(@"Id", Restaurant.Id);
        //    cmd.Parameters.AddWithValue(@"Name", Restaurant.Name);
        //    cmd.Parameters.AddWithValue(@"Address", Restaurant.Location);
        //    cmd.Parameters.AddWithValue(@"Township", Restaurant.Township);
        //    cmd.Parameters.AddWithValue(@"From", Restaurant.From);
        //    cmd.Parameters.AddWithValue(@"To", Restaurant.To);
        //    cmd.Parameters.AddWithValue(@"RestaurantType", Restaurant.RestaurantType);
        //    cmd.Parameters.AddWithValue(@"GoodFor", Restaurant.GoodFor);
        //    cmd.Parameters.AddWithValue(@"OpenHour", Restaurant.OpenHour);
        //    cmd.Parameters.AddWithValue(@"CloseHour", Restaurant.CloseHour);
        //    cmd.Parameters.AddWithValue(@"Phone", Restaurant.Phone);
        //    cmd.Parameters.AddWithValue(@"Website", Restaurant.Website);

        //    cmd.ExecuteNonQuery();
        //    cnn.Close();
        //}

        //public IList<Restaurant> PopulateData()
        //{
        //    List<Restaurant> list = new List<Restaurant>();
        //    Restaurant R;
        //    RestaurantFunction RF = new RestaurantFunction();
        //    string connetionString;
        //    SqlConnection cnn;

        //    connetionString = @"Data Source=PC;Initial Catalog=FoodReviewsDB;User ID=sa;Pwd=echo123;";

        //    cnn = new SqlConnection(connetionString);
        //    cnn.Open();
        //    SqlCommand cmd = new SqlCommand("select * from tblRestaurants", cnn);
        //    SqlDataReader dr;
        //    dr = cmd.ExecuteReader();
        //    while (dr.Read())
        //    {
        //        R = new Restaurant();
        //        R.Id = int.Parse(dr["Id"].ToString());
        //        R.Name = dr["Name"].ToString();
        //        R.Location = dr["Address"].ToString();
        //        R.Township = dr["Township"].ToString();
        //        R.From= dr["From"].ToString();
        //        R.To = dr["To"].ToString();
        //        R.RestaurantType = dr["RestaurantType"].ToString();
        //        R.GoodFor= dr["GoodFor"].ToString();
        //        R.OpenHour= dr["OpenHour"].ToString();
        //        R.CloseHour = dr["CloseHour"].ToString();
        //        R.Phone= dr["Phone"].ToString();
        //        R.Website = dr["Website"].ToString();
        //        R.UploadFile = dr["UploadFile"].ToString();
        //        list.Add(R);
        //        R = null;
        //    }
        //    cnn.Close();
        //    return list;
        //}
    }

}