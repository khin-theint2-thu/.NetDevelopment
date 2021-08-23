<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ContactMe.aspx.cs" Inherits="FoodReviews.ContactMe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section class="section lb">
            <div class="container mb6 ">
               <span class="pagedirectory">
                    <a href="Index.aspx">Home</a> 
                    <i class="fa fa-angle-right"></i>
                    <a href="ContactMe.aspx">Contact</a>
                </span>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="page-wrapper">
                            <div class="row">
                                <div class="col-lg-7">
                                    <div class="form-wrapper" style="margin-top:10px;">
                                        <input type="text" class="form-control" placeholder="Your name"/>
                                        <input type="text" class="form-control" placeholder="Email address"/>
                                        <input type="text" class="form-control" placeholder="Phone"/>
                                        <input type="text" class="form-control" placeholder="Subject"/>
                                        <textarea class="form-control" placeholder="Your message"></textarea>
                                        <button type="submit" class="btn btn-dark">Send <i class="fa fa-envelope-open-o"></i></button>
                                    </div>
                                </div>
                                <div class="col-lg-5">
                                    <div id="map"></div>
                                </div>
                            </div>
                        </div><!-- end page-wrapper -->
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section>
</asp:Content>
