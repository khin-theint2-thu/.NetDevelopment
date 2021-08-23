using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodReviews
{
    public class RestaurantReview
    {
        public int ID { get; set; }
        public int RestaurantID { get; set; }
        public string Title { get; set; }
        public string Review { get; set; }
        public string FoodRating { get; set; }
        public string ServiceRating { get; set; }
        public string CleanlinessRating { get; set; }
        public string OverallRating { get; set; }
        public int CreatedUserID { get; set; }
        public string CreatedUserName { get; set; }
        public string CreatedUserProfile { get; set; }
        public DateTime? CreatedDate { get; set; }
    }
}