<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="FoodReviews.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .fa-star-o, .fa-star {
            color: rgba(0,0,0,0.15);
        }
    </style>
    <script>
        function AddRestaurant() {
            window.location.href = "RestaurantForm.aspx";
        }

        function ViewRestaurantList() {
            window.location.href = "RestaurantListing.aspx";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section lb">
        <div class="container pb10">
            <div class="row">
                <div class="col-lg-12">
                    <div class="page-wrapper">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="small-box bg-blue">
                                    <div class="inner">
                                        <h1><%=RestaurantListCount %></h1>
                                        <p>Restaurants</p>
                                    </div>
                                    <div class="icon">
                                        <i class="fa fa-building" aria-hidden="true"></i>
                                    </div>
                                    <a href="RestaurantListing.aspx" class="small-box-footer bg-footer-blue">More info <i class="fa fa-arrow-circle-right"></i></a>
                               </div>
                           </div>
                            <div class="col-lg-3">
                                <div class="small-box bg-red">
                                    <div class="inner">
                                        <h1><%=UserListCount %></h1>
                                        <p>Users</p>
                                    </div>
                                    <div class="icon">
                                        <i class="fa fa-user-plus" aria-hidden="true"></i>
                                    </div>
                                    <a href="UserListing.aspx" class="small-box-footer bg-footer-red">More info <i class="fa fa-arrow-circle-right"></i></a>
                               </div>
                            </div>
                         </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
