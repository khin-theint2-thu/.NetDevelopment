<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="RestaurantDirectory.aspx.cs" Inherits="FoodReviews.RestaurantDirectory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="RestaurantGuide/okaslider/oka_slider_model.css" rel="stylesheet" />
    <script src="RestaurantGuide/okaslider/oka_slider_model.js"></script>
	<script type="text/javascript">
		$(function(i){
				
			$('.images').oka_slider_model({ 
				'type': 6
			});
				
		});

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

       $(document).ready(function () {
            <%
        for (int i = 0; i < ReviewList.Count(); i++)
        {
                    %>
            var value = $('#userRating<%=i%>').data('value');

            var onStar = parseInt(value, 10); // The star currently selected
            var stars = $("#userRating<%=i%> li").parent().children('li.star');

            for (i = 0; i < stars.length; i++) {
                $(stars[i]).removeClass('selected');
            }

            for (i = 0; i < onStar; i++) {
                $(stars[i]).addClass('selected');
            }
            <%}%>
        })
	</script>
    <style>
        .restauratdetails{
            display:flex;
        }

        .restauratdetails div{
            flex:1;
        }

        body{
            background:#f3f3f3;
        }

        .mg30{
            margin-top:30px;
            margin-bottom:30px;
        }

        .pd20{
            padding:20px;
        }

        .btnreview {
            float: right;
            border: 0;
            background: #000;
            color: #fff;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 15px;
            font-weight: 500;
        }

        h5{
            /*display:inline-block;*/
            /*padding-bottom:10px;*/
            flex:1;
            padding:10px 0px;
        }

        .rating-stars{
            display:inline-block;
        }

        .user_name{
            margin:10px 0px;
        }

        p {
            color: #000;
            line-height: 24px;
        }

        .reviewTitle{
            font-size:20px;
            font-weight:500;
        }

        .menudetails{
            padding:0px 20px;
        }

        .cuisinedetails{
            padding:0px;
        }

        .about{
            border-right:1px solid rgba(0, 0, 0, 0.1);
        }

        .contentTitle{
            display:flex;
            /*align-items:flex-end;*/
        }

        .seperator{
            border-right:1px solid rgba(0, 0, 0, 0.2);
            margin:5px;
        }

        .restaurantinfo {
            margin-bottom: 15px;
            font-size: 17px;
            font-weight: 400;
        }

        .restaurantinfo i:nth-child(1){
            padding-left:0px!important;
        }

        .restaurantinfo i{
            padding:0px 7px;
        }

        .pagedirectory a{
            color: #969595;
            /*padding-left:15px;*/
        }

         .disableLink, .disableLink:hover {
                background: #f3f3f3 !important;
                color: #cccaca !important;
                cursor: not-allowed !important;
            }

            .page-active, .page-active:hover {
                background-color: #ed1b2e !important;
                color: #fff !important;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section lb">
        <div class="container">
            <span class="pagedirectory">
                <a href="Index.aspx">Home</a> 
                <i class="fa fa-angle-right"></i>
                <a href="Restaurants">Restaurants</a>
                <i class="fa fa-angle-right"></i> 
                <a href="RestaurantDirectory?RestaurantID=<%=editRestaurantID%>"><%=Restaurant.Name %></a>
            </span>
            <div class="row">
                <div class="col-md-12 restaurantinfo">
                    <h5><%=Restaurant.Name %></h5>
                    <span><i class="fa fa-map-marker" aria-hidden="true"></i><%=Restaurant.Location %>,<%=Restaurant.Township %></span><span class="seperator"></span><i class="fa fa-phone" aria-hidden="true"></i><span><%=Restaurant.Tel %></span><span class="seperator"></span><i class="fa fa-desktop" aria-hidden="true"></i><span><%=Restaurant.Website %></span><span class="seperator"></span><a href="Menu.aspx?RestaurantID=<%=editRestaurantID%>"><i class="fa fa-cutlery"></i>Menu</a><span class="seperator"></span><span><i class="fa fa-clock-o" aria-hidden="true"></i><%=String.Format("{0:HH:mm tt}",Restaurant.OpenHour)%> - <%=String.Format("{0:HH:mm tt}",Restaurant.OpenHour)%></span>
                </div>
            </div>
            <div class="row">
            	    <div class="slider_model images">
		            <div class="slider_model_box">
                        <%
                            string[] images=Restaurant.UploadFile.Split(',');
                            for(int i = 0; i < images.Count(); i++)
                            {
                                %>
                        <img  src="Images/RestaurantImages/<%=images[i]%>" width="200px" height="150px"/>
                        <%} %>
		            </div>	
	            </div>
            </div>

            <div class="row mg30">
                <div class="col-md-9 bg-white pd20">
                    <h5>Details</h5>
                    <hr />
                    <div class="restauratdetails">
                        <div class="about">
                            <span>About</span>
                        </div>
                        <div class="menudetails">
                            <span>Price Range</span><br />
                            <span><%=Restaurant.PriceRangeFrom%></span>Ks-<span><%=Restaurant.PriceRangeTo%></span>Ks<br />
                            <span>Meals</span><br />
                            <%  
                                string categoryname = "";
                                for (int i = 0; i < CategoryList.Count(); i++)
                                {
                                    categoryname += CategoryList[i].CategoryName;
                                    if(i+1 != CategoryList.Count())
                                    {
                                        categoryname += ",";
                                    }
                                }
                            %>
                              <span><%=categoryname %></span>      
                        </div>
                        <div class="cuisinedetails">
                            <span>Cuisines</span><br />
                            <span><%=Restaurant.Cuisine %></span><br />
                            <span>Features</span><br />
                            <span><%=Restaurant.RestaurantFeature %></span>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">

                </div>
            </div>

            <div class="row mg30" id="Reviews">
                <div class="col-md-9 bg-white pd20">
                    <div class="contentTitle">
                        <h5>Reviews (<%=totalreviewcount %>)</h5>
                        <button type="button" data-restaurantid="<%=editRestaurantID %>" onclick ="GoToReviewsPage(this)" class="btnreview">Write a review</button>
                    </div>
                    <hr />
                                        <%
                            for (int i = 0; i < ReviewList.Count(); i++)
                            {
                                Review = ReviewList[i];
                        %>
                        <div class="row">
                            <div class="col-md-3" style="display:flex;flex-direction:column;align-items:center;">
                                <img src="Images/UserImages/<%=Review.CreatedUserProfile %>" class="circularAvatar recentAvatar" width="72" height="72"/>
                                <div class="user_name"><%=Review.CreatedUserName %></div>
                            </div>
                            <div class="col-md-9">
                                <div class='rating-stars'>
                                    <ul id='userRating<%=i %>' data-value="<%=Review.OverallRating %>">
                                        <li class='star' title='Poor' data-value='1'>
                                        <i class='fa fa-star fa-fw' style="font-size:1em;"></i>
                                        </li>
                                        <li class='star' title='Fair' data-value='2'>
                                        <i class='fa fa-star fa-fw' style="font-size:1em;"></i>
                                        </li>
                                        <li class='star' title='Good' data-value='3'>
                                        <i class='fa fa-star fa-fw' style="font-size:1em;"></i>
                                        </li>
                                        <li class='star' title='Very Good' data-value='4'>
                                        <i class='fa fa-star fa-fw' style="font-size:1em;"></i>
                                        </li>
                                        <li class='star' title='Excellent' data-value='5'>
                                        <i class='fa fa-star fa-fw' style="font-size:1em;"></i>
                                        </li>
                                    </ul>
                                    </div>
                                Reviewed <%=String.Format("{0:dd MMMM yyyy}",Review.CreatedDate)%>
                                        <div class="reviewTitle"><%=Review.Title %></div>
                                <p><%=Review.Review %></p>
                            </div>
                        </div>
                        <%} %>
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center" id="pager" runat="server">
                        </ul>
                    </nav>
                </div>
                <div class="col-md-3">

                </div>
            </div>
        </div>
    </section>
</asp:Content>
