<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="RestaurantForm.aspx.cs" Inherits="FoodReviews.RestaurantForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .selector{
            font-size:15px;
            padding-left:7px;
        }

        .selectdiv {
            margin-right: 10px;
            display: inline-block;
            margin-bottom: 1rem;
            background: #fff;
            padding: 5px 10px;
            border-radius: 20px;
            box-shadow: 0 3px 10px rgb(0 0 0 / 20%);
        }

        input[type=file]{
            margin-bottom:1.5rem;
        }
    </style>
    <script>
        function FormValildation() {
            var validationstatus = true;
            if ($('#RestaurantName').val().length == 0) {
                alert("Restaurant Name is required.")
                validationstatus = false;
            }

            if ($('#Location').val().length == 0) {
                alert("Location is required.")
                validationstatus = false;
            } 

            if ($('#PriceRangeFrom').val().length == 0) {
                alert("Price Range From is required.")
                validationstatus = false;
            }

            if ($('#PriceRangeTo').val().length == 0) {
                alert("Price Range To is required.")
                validationstatus = false;
            } 

            if ($('#OpenHour').val().length == 0) {
                alert("Open Hour is required.")
                validationstatus = false;
            }

            if ($('#CloseHour').val().length == 0) {
                alert("Close Hour is required.")
                validationstatus = false;
            } 

            if ($('#ContentPlaceHolder1_FilesUpload').val().length == 0) {
                alert("Upload File is required.")
                validationstatus = false;
            }
            
            return validationstatus;
        }
    </script>
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
                                <h6>Restaurant Name <span style="color:red;">*</span></h6>
                                <input type="text" name="txtRestaurantName" id="RestaurantName" class="form-control" value="<%=Restaurant.Name %>"  />
                                <h6>Location <span style="color:red;">*</span></h6>
                                <input type="text" name="txtLocation" id="Location" class="form-control" value="<%=Restaurant.Location %>"  />
                                <h6>Township <span style="color:red;">*</span></h6>
                                <select name="comboTownship" class="form-control"  >
                                    <%  
                                        for (int i = 0; i < TownshipList.Count(); i++)
                                        {
                                            string selected = "";
                                            if (selectedTownship == TownshipList[i].Name) selected = "selected";
                                            %>
                                    <option value="<%= TownshipList[i].Name %>" <%= selected %>><%= TownshipList[i].Name %></option>
                                    <%} %>
                                </select>
                                <h6>Restaurant Type <span style="color:red;">*</span></h6>
                                    <%  
                                        for (int i = 0; i < RestaurantTypeList.Count(); i++)
                                        {
                                            string selected = "";
                                            if (selectedRestaurantType == RestaurantTypeList[i].Name) selected = "checked";
                                            %>
                                <div class="selectdiv">
                                    <input type="checkbox" value="<%= RestaurantTypeList[i].Name %>" <%= selected %> name="chkRestType"/><span class="selector"><%= RestaurantTypeList[i].Name %></span>
                                </div>
                                    <%} %>
                                <h6>Restaurant Feature <span style="color:red;">*</span></h6>
                                    <%  
                                        for (int i = 0; i < FeatureList.Count(); i++)
                                        {
                                            string selected = "";
                                            if (selectedFeature == FeatureList[i].Name) selected = "checked";
                                            %>
                                    <div class="selectdiv">
                                        <input type="checkbox" value="<%= FeatureList[i].Name %>" <%= selected %> name="chkRestFeature" /><span class="selector"><%= FeatureList[i].Name %></span> 
                                    </div> 
                                    <%} %>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-wrapper">
                                <h6>Price Range From <span style="color:red;">*</span></h6>
                                <input type="number" name="txtFrom" id="PriceRangeFrom" class="form-control" value="<%=Restaurant.PriceRangeFrom %>"/>
                                <h6>Price Range To <span style="color:red;">*</span></h6>
                                <input type="number" name="txtTo" id="PriceRangeTo" class="form-control" value="<%=Restaurant.PriceRangeTo %>"/>
                                <h6>Cuisine <span style="color:red;">*</span></h6>
                                    <%  
                                        for (int i = 0; i < CuisineList.Count(); i++)
                                        {
                                            string selected = "";
                                            if (selectedCuisine == CuisineList[i].Name) selected = "checked";
                                            %>
                                <div class="selectdiv">
                                    <input type="checkbox" value="<%= CuisineList[i].Name %>" <%= selected %> name="chkCuisine"/><span class="selector"><%= CuisineList[i].Name %></span>
                                </div>    
                                    <%} %>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-wrapper">
                                <h6>Open Hour <span style="color:red;">*</span></h6>
                                <input type="time" name="txtOpenHour" id="OpenHour" class="form-control" value="<%=String.Format("{0:HH:mm}",Restaurant.OpenHour)%>"  />
                                <h6>Close Hour <span style="color:red;">*</span></h6>
                                <input  type="time" name="txtCloseHour" id="CloseHour" class="form-control" value="<%=String.Format("{0:HH:mm}",Restaurant.CloseHour)%>"  />
                                <h6>Tel</h6>
                                <input  type="text" name="txtTel" class="form-control" value="<%=Restaurant.Tel %>"  />
                                <h6>Website</h6>
                                <input  type="text" name="txtWebsite" class="form-control" value="<%=Restaurant.Website %>"  />
                                <h6>Upload File <span style="color:red;">*</span></h6>
                                <asp:FileUpload ID="FilesUpload" runat="server" AllowMultiple="true" value="" />
                                <asp:Button runat="server" CssClass="btn btn-dark" OnClick="btnSaveClick" OnClientClick="return FormValildation()" Text="Submit" style="float:left;"/>
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
