<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UserListing.aspx.cs" Inherits="FoodReviews.UserListing" %>
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

    </style>
    <script>
        $(document).ready(function () {
            $('#UserTable').DataTable();
        });

        function GoToLoginForm() {
            window.location.href = "UserForm.aspx";
        }

        function Cancel() {
            window.location.href = "Dashboard.aspx";
        }

        function DeleteUser(userID){
                $.ajax({
                type: 'POST',
                url: '<%= ResolveUrl("~/UserListing.aspx/DeleteUser") %>',
                data: JSON.stringify({ "userID": userID }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    window.location.href = "UserListing.aspx";
                },
                error: function (data, success, error) {
                    alert("Error : " + data.responseJSON.Message);
                }
            });
         }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

		<section class="container">
            <button type="button" class="btn btn-dark" onclick="GoToLoginForm()" style="font-size:12px;margin-top:30px;" >
                <i class="fa fa-plus-circle" aria-hidden="true"></i>Add User
            </button>
            <button type="button" class="btn btn-dark" onclick="Cancel()" style="font-size:12px;margin-top:30px;" >
                <i class="fa fa-ban" aria-hidden="true"></i>Cancel
            </button>
            <div style="margin-top:30px;">
                <table id="UserTable" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>User ID</th>
							<th>User Name</th>
							<th>Email</th>
							<th>Password</th>
							<th>User Role</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < UserList.Count(); i++)
                            {
                                user = UserList[i];
                        %>
						<tr>
							<td><%=user.UserID%></td>
							<td><%=user.UserName %></td>
							<td><%=user.Email %></td>
							<td><%=user.Password %></td>
							<td><%=user.UserRole %></td>
							<td><i class="fa fa-trash-o" aria-hidden="true" onclick="DeleteUser(<%=user.UserID %>)"></i></td>
						</tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
		</section>
</asp:Content>
