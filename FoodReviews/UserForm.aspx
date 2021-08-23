<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UserForm.aspx.cs" Inherits="FoodReviews.UserForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <style>
        label{
            margin-right:15px;
        }
   </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section lb">
        <div class="container pb10">
            <div class="row">
                <div class="col-lg-12">
                    <div class="page-wrapper">
                        <div class="row">
                            <div class="col-lg-6 offset-3">
                                <div class="form-wrapper">
                                    <h6>User Name <span style="color:red;">*</span></h6>
                                    <input type="text" name="txtUserName" id="UserName" class="form-control" value="" />
                                    <h6>Email <span style="color:red;">*</span></h6>
                                    <input type="text" name="txtEmail" id="Email" class="form-control" value="" />
                                    <h6>Password <span style="color:red;">*</span></h6>
                                    <input type="text" name="txtPassword" id="Password" class="form-control" value="" />
                                    <h6>User Role <span style="color:red;">*</span></h6>
                                    <input type="radio" id="Status1" name="rdoUserRole" value="Admin" class="rdoinput"/>
                                    <label for="Admin" class="statusLabel">Admin</label>
                                    <input type="radio" id="Status2" name="rdoUserRole" value="User" class="rdoinput" checked/>
                                    <label for="User" class="statusLabel">User</label>
                                    <h6>Upload Profile</h6>
                                    <asp:FileUpload ID="FileUpload" runat="server" AllowMultiple="false" value="" style="margin-bottom:25px;"/><br />
                                    <asp:Button runat="server" CssClass="btn btn-dark" OnClick="btnAddUserClick" Text="Submit"/>
                                    <asp:Button runat="server" CssClass="btn btn-dark" OnClick="btnCancelClick" Text="Cancel"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
