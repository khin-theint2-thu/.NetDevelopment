<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Restaurants.aspx.cs" Inherits="FoodReviews.Restaurants" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="RestaurantGuide/slider/style.css" rel="stylesheet" />
    <link href="RestaurantGuide/css/jquerysctipttop.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <style>

            .col-md-4{
                padding:0;
            }            

            .btn{
                background:#ab0012;
                height:100%;
                padding: 0.7rem 0.5rem;
            }

                .btn i {
                    color: #fff;
                }

            .form-control {
                box-sizing: border-box;
                display: inline-block;
                height: 38.38px;
                width: 87%;
                float: left;
                border:1px solid #c2c2c2;
            }            
            .tp {
                top: 92px;
            }

            h5 {
                padding: 10px 0px;
            }

            button {
                float: left;
                width: 13%;
                padding: 5px;
                background: #ab0012;
                color: white;
                font-size: 17px;
                border: 1px solid grey;
                border-left: none;
                cursor: pointer;
                outline:none;
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

            .local-cuisine-title {
                height: 70px;
                width: 239px;
            }

            .local-cuisine {
                position: absolute;
                top: 25px;
            }

            .pagedirectory a{
                color:#969595;
            }

            .grid-style{
                margin-bottom:20px;
            }

            .btn-primary:focus, .btn-primary.focus{

            }

            .btnfilter {
                width: 60px;
                line-height: 14px;
            }

            .btndropdown{
                width: 220px;
                line-height: 14px;
            }
    </style>
    <script>
        function getRestaurantsByTownship(township) {
            window.location.href = "Restaurants.aspx?Township=" + township;
        }

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
            $("#filter").val(getCookie("Filter"));
            $('#township').val(getCookie("Township"));

            $('.accordion_head').click(function () {
                if ($(this).next('.accordion_body').is(':visible')) {
                    $(this).next('.accordion_body').slideToggle(500);
                    $(this).next('.accordion_body').addClass('hide');
                    $(this).children('.plusminus').children('img').attr('src', 'Images/accordion/plus.svg');
                } else {
                    $(this).next('.accordion_body').slideToggle(500);
                    $(this).next('.accordion_body').removeClass('hide');
                    $(this).children('.plusminus').children('img').attr('src', 'Images/accordion/minus.svg');
                }
            });

            <%
            for (int i = 0; i < RestaurantList.Count(); i++)
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

        });

        function Search(sortby,cuisine) {
            var filter = $("#filter").val();
            var township = $("#township").val();

            if (cuisine != '') {
                filter = cuisine;
            }
            PageReloadWithQuery(filter, township, sortby);

            var cookieName1 = "Filter";
            var cookieName2 = "Township";
            var cookieName3 = "SortBy";
            var cookieValue1 = filter;
            var cookieValue2 = township;
            var cookieValue3 = sortby;
            var d = new Date();
            d.setTime(d.getTime() + (60 * 1000));//cookies will be expire after 1 month
            var expires = "expires=" + d.toGMTString();
            document.cookie = cookieName1 + "=" + cookieValue1 + ";" + expires + ";path=/";
            document.cookie = cookieName2 + "=" + cookieValue2 + ";" + expires + ";path=/";
            document.cookie = cookieName3 + "=" + cookieValue3 + ";" + expires + ";path=/";
        }


        function PageReloadWithQuery(filter, township, sortby) {
            var pageURL = "Restaurants.aspx";

            if (filter != "") {

                if (pageURL.indexOf("?") == -1) {
                    pageURL += "?";
                } else {
                    pageURL += "&";
                }
                pageURL += "Filter=" + filter;

            }

            if (township != "") {

                if (pageURL.indexOf("?") == -1) {
                    pageURL += "?";
                } else {
                    pageURL += "&";
                }
                pageURL += "Township=" + township;

            }

            if (sortby != "") {

                if (pageURL.indexOf("?") == -1) {
                    pageURL += "?";
                } else {
                    pageURL += "&";
                }
                pageURL += "SortBy=" + sortby;
            }

            window.location.href = pageURL;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section class="section lb">
            <div class="container">
                    <span class="pagedirectory">
                        <a href="Index.aspx">Home</a> 
                        <i class="fa fa-angle-right"></i>
                        <a href="Restaurants">Restaurants</a>
                    </span>
                <h3 class="items-title">Restaurant Directory</h3>
                <div class="row">
                    <div class="col-md-6">
                        <div class="searchbox">
                        <input type="text" name="txtSearch" placeholder="Search..." class="form-control" id="filter"/>
                        <select name="comboTownship" class="form-control" id="township">
                            <option value="">Select Township...</option>
                            <%  
                                for (int i = 0; i < TownshipList.Count(); i++)
                                {
                                    string selected = "";
                                    if (selectedTownship == TownshipList[i].Name) selected = "selected";
                                    %>
                            <option value="<%= TownshipList[i].Name %>" <%= selected %>><%= TownshipList[i].Name %>(<%=TownshipList[i].TotalRestaurantCount %>)</option>
                            <%} %>
                        </select>
                        <button type="button" onclick="Search('','')"><i class="fa fa-search"></i></button>
                </div>
                    </div>
                    <div class="col-md-6">
                        <div class="filterbox">
                         <div class="btn-group">
                            <button type="button" class="btn btn-dark btnfilter">Filter</button>
                            <div class="btn-group">
                              <button type="button" class="btn btn-dark dropdown-toggle btndropdown" data-toggle="dropdown">
                              Sort by Open for business
                              </button>
                              <div class="dropdown-menu">
                                <a class="dropdown-item" onclick="Search('Restaurant','')">Restauarnt</a>
                                <a class="dropdown-item" onclick="Search('Price','')">Price</a>
                                <a class="dropdown-item" onclick="Search('Review','')">Review</a>
                              </div>
                            </div>
                          </div>
                    </div>
                    </div>
                </div>                              

                <div class="row pd">
                    <div class="col-md-12">
                   <div class="row grid-style">
				        <div class="col-md-12" style="padding:0px;">
                            <h3 class="items-title">Browse Restaurants by Food</h3>
					        <div class="slider slider_3" style="height:22vh;">
						        <ul class="slider__list">
                                  
							        <li class="slider__item">
                                        <a class="cuisine-slider-link" onclick="Search('','American')">
                                            <img src="Images/Food/American-Food.jpg" width="100%" height="100%"/>
                                            <div class="food-title">American</div>
                                        </a>
							        </li>
                                  	 <li class="slider__item">
                                        <a class="cuisine-slider-link" onclick="Search('','Australian')">
                                            <img src="Images/Food/Australian-Foods-Pavlova.jpg" width="100%" height="100%"/>
                                            <div class="food-title">Australian</div>
                                        </a>
							        </li>
                                     <li class="slider__item">
                                        <a class="cuisine-slider-link" onclick="Search('','Burmese')">
                                            <img src="Images/Food/Burmese-Food.jpg" width="100%" height="100%"/>
                                            <div class="food-title">Burmese</div>
                                        </a>
							        </li>
                                    <li class="slider__item">
                                        <a class="cuisine-slider-link" onclick="Search('','Chinese')">
                                            <img src="Images/Food/traditional-chinese-food-600.jpg" width="100%" height="100%"/>
                                            <div class="food-title">Chinese</div>
                                        </a>
							        </li>
                                    <li class="slider__item">
                                        <a class="cuisine-slider-link" onclick="Search('','Filipino')">
                                            <img src="Images/Food/Filipino.png" width="100%" height="100%"/>
                                            <div class="food-title">Filipino</div>
                                        </a>
							        </li>
                                    <li class="slider__item">
                                        <a class="cuisine-slider-link" onclick="Search('','French')">
                                            <img src="Images/Food/French-cuisine.jpg" width="100%" height="100%"/>
                                            <div class="food-title">French</div>
                                        </a>
							        </li>
                                    <li class="slider__item">
                                        <a class="cuisine-slider-link" onclick="Search('','German')">
                                            <img src="Images/Food/German.jpg" width="100%" height="100%"/>
                                            <div class="food-title">German</div>
                                        </a>
							        </li>
                                    <li class="slider__item">
                                        <a class="cuisine-slider-link" onclick="Search('','Greek')">
                                            <img src="Images/Food/greece.jpg" width="100%" height="100%"/>
                                            <div class="food-title">Greek</div>
                                        </a>
							        </li>
                                    <li class="slider__item">
                                        <a class="cuisine-slider-link" onclick="Search('','Indian')">
                                            <img src="Images/Food/Idian.jpg" width="100%" height="100%"/>
                                            <div class="food-title">Indian</div>
                                        </a>
							        </li>
                                    <li class="slider__item">
                                        <a class="cuisine-slider-link" onclick="Search('','Italian')">
                                            <img src="Images/Food/Itialian.jpg" width="100%" height="100%"/>
                                            <div class="food-title">Italian</div>
                                        </a>
							        </li>
                                    <li class="slider__item">
                                        <a class="cuisine-slider-link" onclick="Search('','Indonesian')">
                                            <img src="Images/Food/indonesia-food.jpg" width="100%" height="100%"/>
                                            <div class="food-title">Indonesian</div>
                                        </a>
							        </li>
                                    <li class="slider__item">
                                        <a class="cuisine-slider-link" onclick="Search('','Japanese')">
                                            <img src="Images/Food/Japanese.jpg" width="100%" height="100%"/>
                                            <div class="food-title">Japanese</div>
                                        </a>
							        </li>
                                    <li class="slider__item">
                                        <a class="cuisine-slider-link" onclick="Search('','Korean')">
                                            <img src="Images/Food/Korean.jpg" width="100%" height="100%"/>
                                            <div class="food-title">Korean</div>
                                        </a>
							        </li>
                                    <li class="slider__item">
                                        <a class="cuisine-slider-link" onclick="Search('','Mexican')">
                                            <img src="Images/Food/Mexican.jpg" width="100%" height="100%"/>
                                            <div class="food-title">Mexican</div>
                                        </a>
							        </li>
                                    <li class="slider__item">
                                        <a class="cuisine-slider-link" onclick="Search('','Thai')">
                                            <img src="Images/Food/thai.jpg" width="100%" height="100%"/>
                                            <div class="food-title">Thai</div>
                                        </a>
							        </li>
                                    <li class="slider__item">
                                        <a class="cuisine-slider-link" onclick="Search('','Vietnamese')">
                                            <img src="Images/Food/Vietnamese.jpg" width="100%" height="100%"/>
                                            <div class="food-title">Vietnamese</div>
                                        </a>
							        </li>					       
						        </ul>
						        <div class="slider__nav slider__nav_left"><img src="Images/icon/arrow-89-16.png" style="padding: 0px 4px;"/></div>
						        <div class="slider__nav slider__nav_next"><img src="Images/icon/arrow-25-16.png" style="padding: 0px 4px;"/></div>
					        </div>
				        </div>
			        </div>
                   <div class="row grid-style" id="TopRestaurants">
                   <div class="col-md-12" style="padding:0px;">
                    <h3 class="items-title">Top Restaurants in Yangon (Rangoon)</h3>
                        <div class="row">   
                     <%
                        for (int i = 0; i < RestaurantList.Count(); i++)
                        {
                            Restaurant = RestaurantList[i];
                            var image = Restaurant.UploadFile.Split(',') ?? null;
                        %>

                            <div class="col-md-6" style="padding-right:0px;">
                            <div class="blog-box">
                                    <div class="post-media">
                                    <a href="food-single.html" title="">    
                                        <img src="Images/RestaurantImages/<%=image[0]%>" alt="" style="width:109px;height:109px;"/>
                                        <div class="hovereffect"></div>
                                    </a>
                                    </div><!-- end media -->
                                    <div class="blog-meta big-meta">
                                    <h5><a href="RestaurantDirectory.aspx?RestaurantID=<%=Restaurant.RestaurantID%>" title=""><%=Restaurant.RowNum%>.&nbsp;<%=Restaurant.Name %></a></h5>
                                    <div class='rating-stars'>
                                    <ul id='userRating<%=i %>' data-value="<%=RestaurantList[i].OverallRating %>" style="display:inline-block;">
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
                                    <a data-restaurantid="<%=Restaurant.RestaurantID %>" onclick ="GoToReviewsPage(this)"><%=Restaurant.TotalReviews%> reviews</a>
                                </div>
                                    <span>From <%=String.Format("{0:N0}", Restaurant.PriceRangeFrom)%>Ks to <%=String.Format("{0:N0}", Restaurant.PriceRangeTo)%>Ks</span>
                                    <%--<span><%=Restaurant.Location %>&nbsp;,&nbsp;<%=Restaurant.Township %></span>--%>
<%--                                    <small><%=Restaurant.RestaurantType %> / </small><small>&nbsp;<%=Restaurant.RestaurantFeature %></small>--%>
                                </div>
                                </div>
                        </div>
                    <%} %>
                                                   </div>
                        </div>
                    </div>
                   <div class="row">
                        <div class="col-md-12 text-center">
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center" id="pager" runat="server">
                            </ul>
                        </nav>
                    </div><!-- end col -->
                    </div>
                </div><!-- end col -->                
                </div>
            </div>
        </section>
        <script type="text/javascript" src="<%=ResolveUrl("~/RestaurantGuide/slider/main.js")%>"></script>
        <script>
            $(function () {
                var increment = 10;
                var startFilter = 0;
                var endFilter = increment;
                var $this = $('.burmesefoods');
                var elementLength = $this.find('div').length;
                $('.listLength').text(elementLength);

                if (elementLength > 2) {
                    $('.buttonToogle1').show();
                }
                $('.burmesefoods .item').slice(startFilter, endFilter).addClass('shown');
                $('.shownLength').text(endFilter);
                $('.burmesefoods .item').not('.shown').hide();
                $('.buttonToogle1 .showMore').on('click', function () {
                    if (elementLength > endFilter) {
                        startFilter += increment;
                        endFilter += increment;
                        $('.burmesefoods .item').slice(startFilter, endFilter).not('.shown').addClass('shown').toggle(500);
                        $('.shownLength').text((endFilter > elementLength) ? elementLength : endFilter);
                        if (elementLength <= endFilter) {
                            $(this).remove();
                        }
                    }
                });
            });
        </script>
</asp:Content>
