using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodReviews
{
    public class Menu
    {
        public int MenuID { get; set; }
        public int CategoryID { get; set; }
        public string CategoryName { get; set; }
        public int RestaurantID { get; set; }
        public string RestaurantName { get; set; }
        public string MenuName { get; set; }
        public decimal? Price { get; set; }
        public string MenuImage { get; set; }
    }
}