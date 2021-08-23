<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="RestaurantViewForm.aspx.cs" Inherits="FoodReviews.RestaurantViewForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section lb">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="page-wrapper">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="form-wrapper">
                                        <h6>Restaurant Name</h6>
                                        <input type="text" name="txtRestaurantName"  class="form-control" value="<%=Restaurant.Name %>" readonly/>
                                        <h6>Location</h6>
                                        <input type="text" name="txtLocation" class="form-control" value="<%=Restaurant.Location %>" readonly/>
                                        <h6>Township</h6>
                                        <input type="text" name="txtTownship" class="form-control" value="<%=Restaurant.Township %>" readonly/>
                                        <h6>Restaurant Type</h6>
                                        <input type="text" name="txtRestaurantType"  class="form-control" value="<%=Restaurant.RestaurantType %>" readonly/>                                      
                                        <h6>Restaurant Feature</h6>
                                        <input type="text" name="txtRestaurantFeature" class="form-control" value="<%=Restaurant.RestaurantFeature %>" readonly/>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-wrapper">
                                        <h6>Price Range From</h6>
                                        <input type="number" name="txtFrom" id="PriceRangeFrom" class="form-control" value="<%=Restaurant.PriceRangeFrom %>" readonly/>
                                        <h6>Price Range To</h6>
                                        <input type="number" name="txtTo" id="PriceRangeTo" class="form-control" value="<%=Restaurant.PriceRangeTo %>" readonly/>
                                        <h6>Cuisine</h6>
                                        <input type="text" name="txtCuisine" id="Cuisine" class="form-control" value="<%=Restaurant.Cuisine %>" readonly/>
                                        <h6>Upload File</h6>
                                        <asp:FileUpload ID="FilesUpload" runat="server" AllowMultiple="true" value="" />
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-wrapper">
                                        <h6>Open Hour</h6>
                                        <input type="time" name="txtOpenHour" id="OpenHour" class="form-control" value="<%=String.Format("{0:HH:mm}",Restaurant.OpenHour)%>" readonly/>
                                        <h6>Close Hour</h6>
                                        <input  type="time" name="txtCloseHour" id="CloseHour" class="form-control" value="<%=String.Format("{0:HH:mm}",Restaurant.CloseHour)%>" readonly/>
                                        <h6>Tel</h6>
                                        <input  type="text" name="txtTel" class="form-control" value="<%=Restaurant.Tel %>" readonly/>
                                        <h6>Website</h6>
                                        <input  type="text" name="txtWebsite" class="form-control" value="<%=Restaurant.Website %>" readonly/>
                                        <asp:Button runat="server" CssClass="btn btn-dark" OnClick="btnEditClick" Text="Edit" style="float:left;"/>
                                        <asp:Button runat="server" CssClass="btn btn-dark" OnClick="btnCancelClick" Text="Cancel" style="float:right;"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</asp:Content>
