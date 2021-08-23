<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="FoodReviews.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .section .row a:hover{
            /*color:#000!important;*/
            text-decoration:underline!important;
            cursor:pointer;
        }

        .div_page_main_title {
            box-shadow: 0 3px 10px rgb(0 0 0 / 20%);
            border-radius: 5px;
            padding: 15px;
            line-height: 40px;
            position: relative !important;
            /*margin-top: -135px;*/
            margin-bottom: 30px;
            /*z-index: 50;*/
            background: #fff;
            font-size: 1.2rem;
            font-weight: 500;
            width:100%;
        }

         .div_page_main_title ul li{
             font-size:1.1rem;
             margin-left:2rem;
             font-weight:400;
             line-height:35px;
         }

         .traveler_guide{
             padding:0px 10px;
         }

         .traveler_guide .row{
             margin-bottom:2rem;
         }

         .traveler_guide div img{
             height:260px;
             width:100%;
         }

        .guide_text {
            color: #fff;
            position: relative;
            margin-top: -53px;
            padding: 13px;
            text-transform:uppercase;
        }

            .guide_text a {
                font-weight: 600;
                font-size: 18px;
            }

        .guide_text a:hover{
            color:#fff!important;
        }

        .bg{
            background:#fff;
            color:#000;
        }

        .bg a:hover{
            color:#000!important;
        }

        .white_text a{
            color:#fff!important;
        }

        .white_text a:hover{
            color:#fff!important;
        }

        .outerdiv{
            box-shadow:0 1px 3px 0 rgb(202 202 202);
        }

        .col-md-6,.col-md-3{
            padding-left:5px;
            padding-right:5px;
        }
    </style>
    <script>
        function GoToReviewsPage(e) {
            var $el = $(e);
            var userinfo = getCookie("UserInfo");
            var restaurantID = $el.attr("data-restaurantid");

            if (userinfo != "") {
                window.location.href = "Reviews.aspx?RestaurantID=" + restaurantID;
            } else {
                alert("Please login first!");
            }
        }

        function getCookie(name) {
            var found = document.cookie.split(';').filter(c => c.trim().split("=")[0] === name);
            if (found.length > 0) {
                return found[0].split("=")[1];
            }
            return "";//if first time browsing,will return no value
        }

        function GoToMenuPage(e) {
            var $el = $(e);
            var restaurantID = $el.attr("data-restaurantid");
            window.location.href = "Menu.aspx?RestaurantID=" + restaurantID;
        }

        function GoToViewPost(e) {
            var $el = $(e);
            var postID = $el.attr("data-postid");
            window.location.href = "ViewPost.aspx?PostId=" + postID;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section class="section lb text-muted">
            <div class="container">
                <div class="row">
                    <div class="div_page_main_title">
                      If you’re looking for a tasty meal, this site helps you find the best restaurants, cafes, and bars.<br />
                    <ul>
                        <li>Discover customers comments, reviews and ratings of their impact on restaurants.</li>
                        <li>Choose the cuisine, the type of restaurants and locate the place by filtering the township.</li>
                        <li>Indicate the dish you want to try and find the restaurant that serves it.</li>
                    </ul>
                    </div>
                </div>

                <div class="row">
                    <div class="traveler_guide">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="outerdiv">
                                    <img src="Images/banner4.jpg"/>
                                    <div class="guide_text white_text"><a href="Restaurants.aspx?Filter=Burmese">FAMOUS BURMESE FOODS You should try in Yangon</a></div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="outerdiv">
                                    <img src="Images/d11.jpg"/>
                                    <div class="guide_text bg"><a href="Restaurants.aspx?Filter=Delivery Avaliable">Delivery Abaliable</a></div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="outerdiv">
                                    <img src="Images/d11.jpg"/>
                                    <div class="guide_text bg"><a href="Restaurants.aspx?Filter=Free Wifi">Free WiFi Available</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="outerdiv">
                                    <img src="Images/d11.jpg"/>
                                    <div class="guide_text bg"><a href="Restaurants.aspx?Filter=Parking Avaliable">Parking Avaliable</a></div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="outerdiv">
                                    <img src="Images/d11.jpg"/>
                                    <div class="guide_text bg"><a href="Restaurants.aspx?Filter=Finde Dining">Fine Dining</a></div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="outerdiv">
                                    <img src="Images/d11.jpg"/>
                                    <div class="guide_text bg"><a href="Restaurants.aspx?Filter=Cheap Eat">Cheap Eat</a></div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="outerdiv">
                                    <img src="Images/d11.jpg"/>
                                    <div class="guide_text bg"><a href="Restaurants.aspx?Filter=Moderately Priced">Moderately Priced</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="outerdiv">
                                    <img src="Images/d11.jpg"/>
                                    <div class="guide_text bg"><a href="Restaurants.aspx?Filter=Breakfast">Breakfast</a></div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="outerdiv">
                                    <img src="Images/d11.jpg"/>
                                    <div class="guide_text bg"><a href="Restaurants.aspx?Filter=Dinner">Dinner</a></div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="outerdiv">
                                    <img src="Images/banner3.jpg"/>
                                    <div class="guide_text white_text"><a href="Restaurants.aspx?Filter=Burmese">MOST POPULAR RECIPES in this week</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           </div>
        </section>
        <script src="Content/slider/multislider.js"></script>        
</asp:Content>
