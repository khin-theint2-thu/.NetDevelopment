<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="RestaurantListing.aspx.cs" Inherits="FoodReviews.RestaurantListing1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       
        .limiter{
            background:#ffffff!important;
        }

        .menucount {
            background: #fff;
            border-radius: 50%;
            color: #000;
            font-size: 10px;
            padding: 4px;
            font-weight: 600;
            margin-left: 10px;
        }

        .fa-plus-circle, .fa-ban{
            font-size: 15px;
            margin-right: 8px;
        }

        .navbar {
            flex-wrap: initial!important;
        }

        .table-bordered a:hover{
            color:#ff0000!important;
        }

        .active .page-link, .page-link:hover {
            background-color: #ed1b2e !important;
            color: #fff !important;
        }


        section {
            top: 60px;
            position: relative;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('#RestaurantTable').DataTable();
        });

        function GoToRestaurantForm() {
            window.location.href = "RestaurantForm.aspx";
        }

        function Cancel() {
            window.location.href = "Dashboard.aspx";
        }

        function DeleteMenu() {
            var selectedIDs = new Array();
            $('input:checkbox.deleteChkBox').each(function () {
                if ($(this).prop('checked')) {
                    selectedIDs.push($(this).val());
                }
            });
            if (selectedIDs.length > 0) {
                $.ajax({
                type: 'POST',
                url: '<%= ResolveUrl("~/RestaurantListing.aspx/DeleteRestaurant") %>',
                data: JSON.stringify({ "selectedIDs": selectedIDs }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    window.location.href = "RestaurantListing.aspx";
                },
                error: function (data, success, error) {
                    alert("Error : " + data.responseJSON.Message);
                }
            });
            };
         }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">        
		<section class="container">
            <button type="button" class="btn btn-dark" onclick="GoToRestaurantForm()" style="font-size:12px;margin-top:30px;" >
                <i class="fa fa-plus-circle" aria-hidden="true"></i>Add Restaurant
            </button>
            <button type="button" class="btn btn-dark" onclick="Cancel()" style="font-size:12px;margin-top:30px;" >
                <i class="fa fa-ban" aria-hidden="true"></i>Cancel
            </button>
            <div style="margin-top:30px;margin-bottom:30px;">
                <table id="RestaurantTable" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>
                                <i class="fa fa-trash-o" aria-hidden="true" onclick="DeleteMenu()"></i>
						    </th>
                            <th>Restaurant Name</th>
							<th>Township</th>
							<th>Restaurant Type</th>
							<th>Restaurant Feature</th>
							<th>Cuisine</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < restaurantList.Count(); i++)
                            {
                                Restaurant = restaurantList[i];
                        %>
						<tr>
                            <td><input type="checkbox" class="deleteChkBox" value="<%=Restaurant.RestaurantID %>"/></td>
							<td><a href="RestaurantViewForm.aspx?RestaurantID=<%=Restaurant.RestaurantID %>"><%=Restaurant.Name %></a></td>
							<td><%=Restaurant.Township %></td>
							<td><%=Restaurant.RestaurantType %></td>
							<td><%=Restaurant.RestaurantFeature %></td>
							<td><%=Restaurant.Cuisine %></td>
							<td><a href="MenuForm.aspx?RestaurantID=<%=Restaurant.RestaurantID %>"><button type="button" class="btn btn-dark" style="font-size:12px;" >Menu(<%=Restaurant.TotalMenuCount %>)</button></a></td>
						</tr>
                        <%} %>
                    </tbody>
                </table>
        </div>
		</section>
</asp:Content>
