<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Posts.aspx.cs" Inherits="FoodReviews.Posts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="RestaurantGuide/css/jquerysctipttop.css" rel="stylesheet" />
    <style>
        .page-active,.page-active:hover,.disableLink,.disableLink:hover {
            background-color: #910013 !important;
        }

        .contentbody{
            padding-bottom:6rem;
        }   
          
        label.label-checkbox {
            cursor: pointer;
        }

        h2{
            margin-bottom:7px;
        }

        .text-area{
            color:#000;
            margin:10px 0px;
        }
        

        .pagedirectory a{
                color:#969595;
            }
    </style>
    <script>

        function GetPostsByPostType(postType) {
            var selectedpostType;
            switch (postType){
                case 1:
                    selectedpostType = "Foods";
                    break;
                case 2:
                    selectedpostType = "Restaurants";
                    break;
                case 3:
                    selectedpostType = "Recipes";
                    break;
                case 4:
                    selectedpostType = "Ingredients";
                    break;
            }
            window.location.href = "Posts.aspx?PostType=" + selectedpostType;
        }

        $(document).ready(function () {
            var url_string = window.location.href;
            var url = new URL(url_string);
            var postType = url.searchParams.get("PostType");
            $('#' + postType).attr("checked", "checked");


        });

        $(document).ready(function () {
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
        });

        function writeApost(e) {
            var $el = $(e);
            var userID = $el.attr("data-userid");

            if (userID != 0) {
                window.location.href = "BlogContentForm.aspx?UserID=" + userID;
            } else {
                alert("Please login first!");
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section lb">
        <div class="container mb6">
            <span class="pagedirectory">
                <a href="Index.aspx">Home</a> 
                <i class="fa fa-angle-right"></i>
                <a href="Posts.aspx">Posts</a>
            </span>
            <div class="row">
                <div class="col-md-10">
                    <div class="postType">
                        <label class="label-checkbox" >
                          <input type="radio" name="rdopostType" id="Foods" checked onclick="GetPostsByPostType(1)"/>
                          <span>Foods</span>
                        </label>
                         <label class="label-checkbox" >
                          <input type="radio" name="rdopostType" id="Restaurants" onclick="GetPostsByPostType(2)"/>
                          <span>Restaurants</span>
                        </label>
                        <label class="label-checkbox" >
                          <input type="radio" name="rdopostType" id="Recipes" onclick="GetPostsByPostType(3)"/>
                          <span>Recipes</span>
                        </label>
                        <label class="label-checkbox" >
                          <input type="radio" name="rdopostType" id="Ingredients" onclick="GetPostsByPostType(4)"/>
                          <span>Ingredients</span>
                        </label>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="add-post">
                        <a data-userid="<%=UserInfo[0] %>" onclick="writeApost(this)"><i class="fa fa-pencil" aria-hidden="true" style="color:#fff;padding-right:8px;"></i>Write a Post</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="post-list">
                        <%  
                            for (int i = 0; i < TopPostList.Count(); i++)
                            {
                        %>
                            <div class="post-sharing">
                                <h2><%=TopPostList[i].PostTitle%></h2>
                            <div class="postinfo">
                            <span class="postedusername">By <i><%=TopPostList[i].PostedUser%></i> |</span>
                            <span><%=String.Format("{0:dd MMMM yyyy}", TopPostList[i].PostedDate)%></span>
                            </div>
                            <div class="postimage">
                                <img src="Images/ContentImages/<%=TopPostList[i].PostImage%>" alt="" width="100%" height="465px"/>
                            </div>
                            <p class="text-area" data-controller="#readMore<%=i %>">
                                <%=TopPostList[i].PostContent %>
                            </p>
                            <a id="readMore<%=i %>" class="btn btn-dark" style="display:block;">Read more</a>  
                            </div>
                        <%} %>
                    </div>

                        <%  
                            for (int i = 0; i < NewPostList.Count(); i++)
                            {
                        %>
                            <div class="post-sharing">
                                <h2><%=NewPostList[i].PostTitle%></h2>
                                <div class="postinfo">
                                    <span class="postedusername">By <i><%=NewPostList[i].PostedUser%></i> |</span>
                                    <span><%=String.Format("{0:dd MMMM yyyy}", NewPostList[i].PostedDate)%></span>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="newpostimage">
                                            <img src="Images/ContentImages/<%=NewPostList[i].PostImage%>" alt=""/>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                       <p class="newpostcontent">
                                            <%=NewPostList[i].PostContent %>
                                        </p>
                                        <a href="ViewPost.aspx?PostId=<%=NewPostList[i].PostId %>" class="readmore-text">Read more</a> 
                                    </div>
                                </div>
                            </div>

                        <%} %>
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center" id="pager" runat="server">
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-4">
                    <div class="accordion_head">Recent Posts<div class="plusminus"><img src="Images/accordion/plus.svg" /></div>
                    </div>
                     <div class="accordion_body hide">
                            <%  
                                for (int j = 0; j < RecentPostList.Count(); j++)
                                {
                            %>
                            <div class="recentpost-list ">
                                <div class="recentpostimage accordion_item">
                                    <img src="Images/ContentImages/<%=RecentPostList[j].PostImage%>" alt="" width="100px" height="67px"/>
                                </div>
                                <a href="ViewPost.aspx?PostId=<%=RecentPostList[j].PostId%>"><%=RecentPostList[j].PostTitle%></a>
                            </div> 
                            <%} %>
                      </div> 
                                       
                    <div class="accordion_head">Old Posts<div class="plusminus"><img src="Images/accordion/plus.svg" /></div>
                    </div>
                     <div class="accordion_body hide">
                     <%  
                        for (int j = 0; j < OldPostList.Count(); j++)
                        {
                    %>
                    <div class="oldpost-list">
                        <a href="ViewPost.aspx?PostId=<%=OldPostList[j].PostId%>"><%=OldPostList[j].PostTitle%></a>
                    </div>                     
                         <%} %>
                                
                    </div>
                </div>
            </div>
       </div>
    </section>
    <script src="RestaurantGuide/js/jquery-3.5.1.min.js"></script>
    <script src="RestaurantGuide/js/jquery-read-more.js"></script>
    <script>
        $(".text-area").readMore({ lines: 3 });
    </script>
</asp:Content>
