using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodReviews
{
    public class SubMenu
    {
        public string MenuID { get; set; }
        public string CategoryID { get; set; }
        public string CategoryName { get; set; }
        public string MenuName { get; set; }
        public decimal? Price { get; set; }
        public string Images { get; set; }

    }
}