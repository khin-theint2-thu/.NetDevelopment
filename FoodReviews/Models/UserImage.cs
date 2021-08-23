using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FoodReviews.Models
{
    public class UserImage
    {
        public int ImageID { get; set; }
        public string FilePath { get; set; }
        public string FileName { get; set; }
        public string ContentType { get; set; }
        public string FileExtension { get; set; }
        public int Filesize { get; set; }
    }
}