using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodReviews
{
    public class Category
    {
        public int CategoryID { get; set; }
        public int RestaurantID { get; set; }
        public string CategoryName { get; set; }
        public string TotalMenuCount { get; set; }
    }
}