<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="FoodReviews.Reviews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        h6{
            font-weight:500;
            margin-bottom:0;
            font-size:14px;
        }        

        .pageTitle {
            font-size: 19px;
            color: #4a4a4a;
            border-bottom: 1px solid #ccc;
            padding-bottom: 12px;
        }

        .labelHeader {
            font-size: 16px;
            margin: 15px 0px;
            color: #2c2c2c;
            display: block;
            font-weight: 600;
        }

        .shape {
            float: left;
            background-size: contain;
            background-repeat: no-repeat;
            margin: 30px;
            width: 265px;
            height: 265px;
            shape-margin: 20px;
        }

        .form-wrapper {
            margin: 20px 0px;
        }

        .FraudLabelFly {
            padding-left: 20px;
            margin-top: -5px;
            margin-bottom:25px;
        }

        .page-active,.page-active:hover,.disableLink,.disableLink:hover {
            background-color: #910013 !important;
        }

        .blog-meta.big-meta p{
            margin-bottom:5px!important;
        }

        .blog-box{
            margin-bottom: 2.5em;
        }

        .pagedirectory a{
            color: #969595;
            /*padding-left:15px;*/
        }

    </style>
    <script>
       
        $(document).ready(function () {

            /* 1. Visualizing things on Hover*/
            $('#stars li').on('mouseover', function () {
                var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on

                // Now highlight all the stars that's not after the current hovered star
                $(this).parent().children('li.star').each(function (e) {
                    if (e < onStar) {
                        $(this).addClass('hover');
                    }
                    else {
                        $(this).removeClass('hover');
                    }
                });

            }).on('mouseout', function () {
                $(this).parent().children('li.star').each(function (e) {
                    $(this).removeClass('hover');
                });
            });

            /* 2. Action to perform on click */
            $('#stars li').on('click', function () {
                var onStar = parseInt($(this).data('value'), 10); // The star currently selected
                var stars = $(this).parent().children('li.star');

                for (i = 0; i < stars.length; i++) {
                    $(stars[i]).removeClass('selected');
                }

                for (i = 0; i < onStar; i++) {
                    $(stars[i]).addClass('selected');
                }

                // JUST RESPONSE (Not needed)
                var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
                var msg = "";
                var overallResult = "";
                if (ratingValue > 1) {
                    msg = "Thanks! You rated this " + ratingValue + " stars.";
                }
                else {
                    msg = "We will improve ourselves. You rated this " + ratingValue + " stars.";
                }
            
                responseMessage(msg, ratingValue);
            });

            /* 1. Visualizing things on Hover*/
            $('#stars1 li').on('mouseover', function () {
                var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on

                // Now highlight all the stars that's not after the current hovered star
                $(this).parent().children('li.star').each(function (e) {
                    if (e < onStar) {
                        $(this).addClass('hover');
                    }
                    else {
                        $(this).removeClass('hover');
                    }
                });

            }).on('mouseout', function () {
                $(this).parent().children('li.star').each(function (e) {
                    $(this).removeClass('hover');
                });
            });

            /* 2. Action to perform on click */
            $('#stars1 li').on('click', function () {
                var onStar = parseInt($(this).data('value'), 10); // The star currently selected
                var stars = $(this).parent().children('li.star');

                for (i = 0; i < stars.length; i++) {
                    $(stars[i]).removeClass('selected');
                }

                for (i = 0; i < onStar; i++) {
                    $(stars[i]).addClass('selected');
                }

                // JUST RESPONSE (Not needed)
                var ratingValue = parseInt($('#stars1 li.selected').last().data('value'), 10);
               
                $("#FoodRating").val(ratingValue);
            });

            /* 1. Visualizing things on Hover*/
            $('#stars2 li').on('mouseover', function () {
                var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on

                // Now highlight all the stars that's not after the current hovered star
                $(this).parent().children('li.star').each(function (e) {
                    if (e < onStar) {
                        $(this).addClass('hover');
                    }
                    else {
                        $(this).removeClass('hover');
                    }
                });

            }).on('mouseout', function () {
                $(this).parent().children('li.star').each(function (e) {
                    $(this).removeClass('hover');
                });
            });

            /* 2. Action to perform on click */
            $('#stars2 li').on('click', function () {
                var onStar = parseInt($(this).data('value'), 10); // The star currently selected
                var stars = $(this).parent().children('li.star');

                for (i = 0; i < stars.length; i++) {
                    $(stars[i]).removeClass('selected');
                }

                for (i = 0; i < onStar; i++) {
                    $(stars[i]).addClass('selected');
                }

                // JUST RESPONSE (Not needed)
                var ratingValue = parseInt($('#stars2 li.selected').last().data('value'), 10);

                $("#ServiceRating").val(ratingValue);

            });

            /* 1. Visualizing things on Hover*/
            $('#stars3 li').on('mouseover', function () {
                var onStar = parseInt($(this).data('value'), 10);

                $(this).parent().children('li.star').each(function (e) {
                    if (e < onStar) {
                        $(this).addClass('hover');
                    }
                    else {
                        $(this).removeClass('hover');
                    }
                });

            }).on('mouseout', function () {
                $(this).parent().children('li.star').each(function (e) {
                    $(this).removeClass('hover');
                });
            });

            /* 2. Action to perform on click */
            $('#stars3 li').on('click', function () {
                var onStar = parseInt($(this).data('value'), 10); // The star currently selected
                var stars = $(this).parent().children('li.star');

                for (i = 0; i < stars.length; i++) {
                    $(stars[i]).removeClass('selected');
                }

                for (i = 0; i < onStar; i++) {
                    $(stars[i]).addClass('selected');
                }

                var ratingValue = parseInt($('#stars3 li.selected').last().data('value'), 10);
               
                $("#CleanlinessRating").val(ratingValue);

            });                     
        });


        function responseMessage(msg,result) {
            $('.success-box').fadeIn(200);
            $('.success-box div.text-message').html("<span>" + msg + "</span>");
            $("#OverallRating").val(result);
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                    <div class="reviewHeader">
                    <span class="pagedirectory">
                        <a href="Index.aspx">Home</a> 
                        <i class="fa fa-angle-right"></i>
                        <a href="Restaurants">Restaurants</a>
                        <i class="fa fa-angle-right"></i> 
                        <a href="RestaurantDirectory?RestaurantID=<%=editRestaurantID%>"><%=Restaurant.Name %></a>
                        <i class="fa fa-angle-right"></i>
                        <a href="#">Review</a>
                    </span>
                        <div class="row" style="margin-top:10px;">
                            <div class="col-md-4">
                                <%string image = "";
                                    string[] images=Restaurant.UploadFile.Split(',');
                                    image = images[0];
                                     %>
                                <img  src="Images/RestaurantImages/<%=image%>" width="200px" height="150px"/>
                            </div>
                            <div class="col-md-8">
                                <div class="nameAndaddress">
                                    <div class="propertyname"><%=Restaurant.Name%></div>
                                    <div class="propertydetail"><i class="fa fa-map-marker" aria-hidden="true"></i><%=Restaurant.Location%></div>
                                    <div class="propertydetail"><i class="fa fa-phone" aria-hidden="true"></i><%=Restaurant.Tel %></div>
                                    <div class="propertydetail"><a href="<%=Restaurant.Website %>"><i class="fa fa-desktop" aria-hidden="true"></i>Website</a></div>
                                    <i class="fa fa-clock-o" aria-hidden="true"></i>
                                    <small class="propertydetail"><%=String.Format("{0:HH:mm tt}",Restaurant.OpenHour)%></small> &nbsp;-&nbsp;
                                    <small class="propertydetail"><%=String.Format("{0:HH:mm tt}",Restaurant.CloseHour)%></small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="fieldset">
                        <h2 class="pageTitle">
                            Your first-hand experiences really help other travelers. Thanks!
                        </h2>
                        <div class="writeAReviewSection">
                            <div class="labelHeader">Your overall rating of this restaurant </div>
                            <div class="easyClear bigRatingParent">
                                <div class='rating-stars'>
                                    <ul id='stars'>
                                      <li class='star' title='Poor' data-value='1'>
                                        <i class='fa fa-star fa-fw'></i>
                                      </li>
                                      <li class='star' title='Fair' data-value='2'>
                                        <i class='fa fa-star fa-fw'></i>
                                      </li>
                                      <li class='star' title='Good' data-value='3'>
                                        <i class='fa fa-star fa-fw'></i>
                                      </li>
                                      <li class='star' title='Very Good' data-value='4'>
                                        <i class='fa fa-star fa-fw'></i>
                                      </li>
                                      <li class='star' title='Excellent' data-value='5'>
                                        <i class='fa fa-star fa-fw'></i>
                                      </li>
                                    </ul>
                                  </div>
                                <div class='success-box'>
                                    <div class='clearfix'></div>
                                    <img alt='tick image' width='32' src='data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeD0iMHB4IiB5PSIwcHgiIHZpZXdCb3g9IjAgMCA0MjYuNjY3IDQyNi42NjciIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDQyNi42NjcgNDI2LjY2NzsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHdpZHRoPSI1MTJweCIgaGVpZ2h0PSI1MTJweCI+CjxwYXRoIHN0eWxlPSJmaWxsOiM2QUMyNTk7IiBkPSJNMjEzLjMzMywwQzk1LjUxOCwwLDAsOTUuNTE0LDAsMjEzLjMzM3M5NS41MTgsMjEzLjMzMywyMTMuMzMzLDIxMy4zMzMgIGMxMTcuODI4LDAsMjEzLjMzMy05NS41MTQsMjEzLjMzMy0yMTMuMzMzUzMzMS4xNTcsMCwyMTMuMzMzLDB6IE0xNzQuMTk5LDMyMi45MThsLTkzLjkzNS05My45MzFsMzEuMzA5LTMxLjMwOWw2Mi42MjYsNjIuNjIyICBsMTQwLjg5NC0xNDAuODk4bDMxLjMwOSwzMS4zMDlMMTc0LjE5OSwzMjIuOTE4eiIvPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8L3N2Zz4K'/>
                                    <div class='text-message'></div>
                                    <div class='clearfix'></div>
                                            <input type="hidden" name="txtOverallRating" id="OverallRating"/>
                                    </div>
                                <div class="form-wrapper">
                                    <div class="labelHeader">Title of your review</div>
                                    <input class="form-control" type="text" placeholder="" name="txtTitle" required/>
                                    <div class="labelHeader">Your Review</div>
                                    <textarea class="form-control" placeholder="Your message" name="txtReview" required></textarea>
                                    
                                    <div class="labelHeader">Click to select a rating</div>
                                    <div class="ratingTable">
                                        <div class="questionRow">
                                            <div class="detailQuestion">Food</div>
                                            <div class="answerBlock">
                                                <div class='rating-stars'>
                                                    <ul id='stars1'>
                                                      <li class='star' title='Poor' data-value='1'>
                                                        <i class='fa fa-star fa-fw' style="font-size:2em;"></i>
                                                      </li>
                                                      <li class='star' title='Fair' data-value='2'>
                                                        <i class='fa fa-star fa-fw' style="font-size:2em;"></i>
                                                      </li>
                                                      <li class='star' title='Good' data-value='3'>
                                                        <i class='fa fa-star fa-fw' style="font-size:2em;"></i>
                                                      </li>
                                                      <li class='star' title='Very Good' data-value='4'>
                                                        <i class='fa fa-star fa-fw' style="font-size:2em;"></i>
                                                      </li>
                                                      <li class='star' title='Excellent' data-value='5'>
                                                        <i class='fa fa-star fa-fw' style="font-size:2em;"></i>
                                                      </li>
                                                    </ul>
                                                  </div>
                                                <input type="hidden" name="txtFoodRating" id="FoodRating"/>
                                            </div>
                                        </div>
                                        <div class="questionRow">
                                            <div class="detailQuestion">Service</div>
                                            <div class="answerBlock">
                                                <div class='rating-stars'>
                                                    <ul id='stars2'>
                                                      <li class='star' title='Poor' data-value='1'>
                                                        <i class='fa fa-star fa-fw' style="font-size:2em;"></i>
                                                      </li>
                                                      <li class='star' title='Fair' data-value='2'>
                                                        <i class='fa fa-star fa-fw' style="font-size:2em;"></i>
                                                      </li>
                                                      <li class='star' title='Good' data-value='3'>
                                                        <i class='fa fa-star fa-fw' style="font-size:2em;"></i>
                                                      </li>
                                                      <li class='star' title='Very Good' data-value='4'>
                                                        <i class='fa fa-star fa-fw' style="font-size:2em;"></i>
                                                      </li>
                                                      <li class='star' title='Excellent' data-value='5'>
                                                        <i class='fa fa-star fa-fw' style="font-size:2em;"></i>
                                                      </li>
                                                    </ul>
                                                  </div>
                                                <input type="hidden" name="txtServiceRating" id="ServiceRating"/>
                                            </div>
                                        </div>
                                        <div class="questionRow">
                                            <div class="detailQuestion">Cleanliness</div>
                                            <div class="answerBlock"> 
                                                <div class='rating-stars'>
                                                    <ul id='stars3'>
                                                      <li class='star' title='Poor' data-value='1'>
                                                        <i class='fa fa-star fa-fw' style="font-size:2em;"></i>
                                                      </li>
                                                      <li class='star' title='Fair' data-value='2'>
                                                        <i class='fa fa-star fa-fw' style="font-size:2em;"></i>
                                                      </li>
                                                      <li class='star' title='Good' data-value='3'>
                                                        <i class='fa fa-star fa-fw' style="font-size:2em;"></i>
                                                      </li>
                                                      <li class='star' title='Very Good' data-value='4'>
                                                        <i class='fa fa-star fa-fw' style="font-size:2em;"></i>
                                                      </li>
                                                      <li class='star' title='Excellent' data-value='5'>
                                                        <i class='fa fa-star fa-fw' style="font-size:2em;"></i>
                                                      </li>
                                                    </ul>
                                                  </div>
                                                <input type="hidden" name="txtCleanlinessRating" id="CleanlinessRating"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="labelHeader">Submit your review</div>
                                    <input type="checkbox" style="float:left;" required/>
                                    <div class="FraudLabelFly"><label for="noFraud">I certify that this review is based on my own experience and is my genuine opinion of this restaurant, and that I have no personal or business relationship with this establishment, and have not been offered any incentive or payment originating from the establishment to write this review.</label></div>
                                    <asp:Button runat="server" OnClick="btnPostClick" Text="Submit your review" style="display:block;border-radius:5px;" CssClass="btn btn-dark submitreview"/>
                                </div>
                            </div>
                        </div>
                    </div>
            </div><!-- end col -->
            <div class="col-md-5">
                <div class="RecentReviewCol">
                    <div class="labelHeader">Recent reviews of this property</div>

                    <%
                        for (int i = 0; i < ReviewList.Count(); i++)
                        {
                            Review = ReviewList[i];
                    %>

                    <div class="recentReview">
                        <div class="recentInfo">
                            <img src="Images/UserImages/<%=Review.CreatedUserProfile %>" class="circularAvatar recentAvatar" width="32" height="32"/>
                                <div class="recentName"><%=Review.CreatedUserName %>&nbsp;wrote a review on&nbsp;<%=String.Format("{0:dd MMMM yyyy}",Review.CreatedDate)%></div>
                                <div class="bubblesAndTitle">
                                    <div class="recentRating">
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
                                    </div>
                                    <div class="recentTitle wrap">“<%=Review.Title %>”</div>
                                </div>
                        </div>
                        <div class="partialReview">
                            <p><%=Review.Review %></p>
                        </div>
                    </div>
                    <%} %>
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center" id="pager" runat="server">
                    </ul>
                </nav>
            </div>
            </div>
        </div>
    </div>
</asp:Content>
