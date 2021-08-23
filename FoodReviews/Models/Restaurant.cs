using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodReviews
{
    public class Restaurant
    {
        public int RestaurantID { get; set; }
        public string RowNum { get; set; }
        public string Name { get; set; }
        public string Location { get; set; }
        public string Township { get; set; }
        public string RestaurantFeature { get; set; }
        public string RestaurantType { get; set; }
        public string Cuisine { get; set; }
        public decimal? PriceRangeFrom { get; set; }
        public decimal? PriceRangeTo { get; set; }
        public DateTime? OpenHour { get; set; }
        public DateTime? CloseHour { get; set; }
        public string Tel { get; set; }
        public string Website { get; set; }
        public string UploadFile { get; set; }
        public string TotalMenuCount { get; set; }
        public string TotalReviews { get; set; }
        public string OverallRating { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime LastUpdatedDate { get; set; }
    }
}