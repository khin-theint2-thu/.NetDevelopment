<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="FoodReviews.Menu1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    .blog-box {
        /*margin-bottom: 1.5rem !important;*/
        background: #fff;
        /*height: 94%;*/
    }

    .menu-category {
        font-size: 14px;
        /*font-weight: 500;*/
        background: #000;
        color: #fff;
        max-width: 20rem;
        width: auto;
        display: inline-block;
        padding: 0px 10px;
    }

    .menu-detail {
        padding: 0px 15px;
        line-height: 2rem;
        margin:10px 0px;
    }

    .food-price {
        font-weight: 500;
    }

    .page-active, .page-active:hover {
        background-color: #ed1b2e !important;
        color: #fff !important;
    }

    .disableLink, .disableLink:hover {
        background: #f3f3f3 !important;
        color: #cccaca !important;
        cursor: not-allowed !important;
    }

    .grid-style{
        margin-bottom:20px;
    }

    
        .pagedirectory a{
        color:#969595;
    }
    </style>
<script>
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
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section lb">
        <div class="container">
            <span class="pagedirectory">
                <a href="Index.aspx">Home</a> 
                <i class="fa fa-angle-right"></i>
                <a href="Restaurants">Restaurants</a>
                <i class="fa fa-angle-right"></i> 
                <a href="RestaurantDirectory?RestaurantID=<%=editRestaurantId%>"><%=Restaurant.Name %></a>
                <i class="fa fa-angle-right"></i> 
                <a href="#">Menu</a>
            </span>
            <div class="row" style="margin-top:10px;">
                <div class="col-md-8">
                    <div class="page-wrapper">
                        <div class="row grid-style">
                            <%  
                                    for (int i = 0; i < MenuList.Count(); i++)
                                    {
                                %>                               

                                <div class="col-md-6">
                                        <div class="blog-box">
                                        <img src="Images/RestaurantImages/<%=MenuList[i].MenuImage%>" alt="" style="width: 109px;height: 109px;"/>
                                        <div class="menu-detail">
                                            <h5><%=MenuList[i].MenuName%></h5>
                                            <div class="food-price"><%=String.Format("{0:0.##}", MenuList[i].Price)%>Ks</div>
                                            <div class="menu-category"><%=MenuList[i].CategoryName%></div>
                                        </div><!-- end meta -->
                                    </div><!-- end blog-box -->
                                </div>

                            <hr class="invis"/>
                            <%} %>  
                    </div><!-- end col -->
                        <div class="row" style="width:100%;">
                        <div class="col-md-12">
                            <nav aria-label="Page navigation">
                                <ul class="pagination justify-content-center" id="pager" runat="server">
                                </ul>
                            </nav>
                        </div><!-- end col -->
                    </div><!-- end row -->
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="sidebar">
                            <div class="accordion_head">See All Categories<div class="plusminus"><img src="Images/accordion/plus.svg" /></div>
                            </div>
                            <div class="accordion_body hide">
                               <div class="accordion_item"><a href="Menu.aspx?RestaurantID=<%=editRestaurantId %>">All</a></div>
                                <%  
                                    for (int i = 0; i < CategoryList.Count(); i++)
                                    {
                                %>
                                        <div class="accordion_item"><a href="Menu.aspx?RestaurantID=<%=editRestaurantId %>&CategoryID=<%=CategoryList[i].CategoryID%>"><%= CategoryList[i].CategoryName %><span>(<%=CategoryList[i].TotalMenuCount %>)</span></a></div>
                                <%} %>
                            </div>
                    </div><!-- end sidebar -->
                </div><!-- end col -->
            </div><!-- end row -->
        </div><!-- end container -->
    </section>
</asp:Content>
