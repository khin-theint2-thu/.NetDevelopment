<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="MenuListing.aspx.cs" Inherits="FoodReviews.MenuListing" %>
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

        .page-title{
            border-bottom: 1px dashed #dadada
        }

        .fa-plus-circle, .fa-ban{
            font-size: 15px;
            margin-right: 8px;
        }

        .navbar {
            flex-wrap: initial !important;
        }

        .btn{
            color:#fff!important;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('#RestaurantTable').DataTable();
        });

        function Cancel() {
            window.location.href = "Dashboard.aspx";
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="limiter">
		<div class="container">
            <button type="button" class="btn btn-dark" onclick="Cancel()" style="font-size:12px;margin-top:30px;" >
                <i class="fa fa-ban" aria-hidden="true"></i>Cancel
            </button>
            <section style="margin-top:30px;">
                <table id="RestaurantTable" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>Menu Name</th>
							<th>Restaurant Name</th>
							<th>Category Name</th>
							<th>Price</th>
                            <th>Photo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < Menulist.Count(); i++)
                            {
                                Menu = Menulist[i];
                        %>
						<tr>
                            <td><%=Menu.MenuName %></td>
							<td><a href="MenuForm.aspx?RestaurantID=<%=Menu.RestaurantID %>"><%=Menu.RestaurantName %></a></td>
							<td><%=Menu.CategoryName %></td>
							<td><%=Menu.Price %> Ks</td>
							<td><img src="Images/RestaurantImages/<%=Menu.MenuImage %>" alt="" class="img-fluid" style="height: 70px;width: 100px;"/></td>
						</tr>
                        <%} %>
                    </tbody>
                </table>
        </section>
		</div>
	</div>
</asp:Content>
