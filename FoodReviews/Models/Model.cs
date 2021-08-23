using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodReviews.Models
{
    public class TopPost
    {
        public int PostId { get; set; }
        public string PostTitle { get; set; }
        public string PostContent { get; set; }
        public string PostType { get; set; }
        public string PostImage { get; set; }
        public string PostedUser { get; set; }
        public DateTime? PostedDate { get; set; }
    }

    public class NewPost
    {
        public int PostId { get; set; }
        public string PostTitle { get; set; }
        public string PostContent { get; set; }
        public string PostType { get; set; }
        public string PostImage { get; set; }
        public string PostedUser { get; set; }
        public DateTime? PostedDate { get; set; }
    }

    public class RecentPost
    {
        public int PostId { get; set; }
        public string PostTitle { get; set; }
        public string PostImage { get; set; }
    }

    public class OldPost
    {
        public int PostId { get; set; }
        public string PostTitle { get; set; }
    }

    public class RecommendRestaurant
    {
        public string RestaurantID { get; set; }
        public string RestaurantName { get; set; }
        public string Image { get; set; }
        public string OverallRating { get; set; }
        public string RestaurantType { get; set; }
        public string Cuisine { get; set; }
    }

    public class LocalCuisine
    {
        public string RestaurantID { get; set; }
        public string RestaurantName { get; set; }
        public string Image { get; set; }
        public string TotalReviews { get; set; }
    }

    public class DeliveryAvaliable
    {
        public string RestaurantID { get; set; }
        public string RestaurantName { get; set; }
        public string Image { get; set; }
        public string TotalReviews { get; set; }
    }

    public class CheapEat
    {
        public string RestaurantID { get; set; }
        public string RestaurantName { get; set; }
        public string Image { get; set; }
        public string TotalReviews { get; set; }
    }

    public class PopularRecipe
    {
        public string RecipeID { get; set; }
        public string Title { get; set; }
        public string Image { get; set; }
    }

    public class LatestRestaurant
    {
        public string RestaurantID { get; set; }
        public string RestaurantName { get; set; }
        public string Image { get; set; }
        public string TotalReviews { get; set; }
    }
}