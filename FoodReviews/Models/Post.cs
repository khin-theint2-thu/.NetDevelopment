using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodReviews.Models
{
    public class Post
    {
        public int PostId { get; set; }
        public string PostTitle { get; set; }
        public string PostContent { get; set; }
        public string PostType { get; set; }
        public string PostImage { get; set; }
        public int PostedBy { get; set; }
        public string PostedUser { get; set; }
        public DateTime? PostedDate { get; set; }
    }
}