<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="FoodReviews.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

        .button {
            background-color:transparent;
            border: 1px solid #dee3e0;
            border-radius: 5px;
        }

        .form-control {
            min-height: 0px !important;
            background: #f5f5f5 !important;
        }

        .fa-key{
            padding-right: 10px;
        }

        .fa-cloud-upload{
            padding-right:5px;
        }

        input[type="file"] {
            display: none;
        }
           
    </style>
    <script>
        function ShowChangePswPanel() {
            var hiddenpanel = document.getElementById("HiddenPswPanel");
            var viewpanel = document.getElementById("ChangePsw");
            hiddenpanel.style.display = "block";
            viewpanel.style.display = "none";
            return false;
        }

        function showImage(src, target) {
            var fr = new FileReader();

            fr.onload = function () {
                target.src = fr.result;
            };

            fr.readAsDataURL(src.files[0]);
        }
        function putImage() {
            var src = document.getElementById("ContentPlaceHolder1_ProfileImage");
            var target = document.getElementById("target");
            showImage(src, target);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section lb">
           <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-wrapper">
                            <div class="row">
                                <div class="col-lg-2">
                                    <img id="target" src="Images/UserImages/<%=UserInfo[2] %>" width="160px"  height="160px"/><br />
                                     <label class="custom-file-upload">
                                        <asp:FileUpload ID="ProfileImage" runat="server" AllowMultiple="false" onchange="putImage()" />
                                        <i class="fa fa-cloud-upload" aria-hidden="true"></i>Choose your profile
                                     </label>
                                </div>
                                <div class="col-lg-10">
                                    <div class="row">
                                        <div class="col-sm-3" style="padding-left:3rem;">
                                            Name
                                        </div>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" value="<%=UserInfo[1] %>" readonly/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3" style="padding-left:3rem;">
                                            Email
                                        </div>
                                        <div class="col-sm-9">
                                             <input type="text" class="form-control" value="<%=UserInfo[4] %>" readonly/>
                                        </div>
                                    </div>
                                    <div id="ChangePsw">
                                    <div class="row">
                                        <div class="col-sm-3" style="padding-left:3rem;">
                                            Password
                                        </div>
                                        <div class="col-sm-9">
                                            <button class="button changePassword" onclick="return ShowChangePswPanel()"><i class="fa fa-key" aria-hidden="true"></i>Change Password</button>
                                        </div>
                                    </div>
                                    </div>
                                    <%--<div id="HiddenPswPanel" style="display:none;">
                                        <div class="row">
                                            <div class="col-sm-3" style="padding-left:3rem;">
                                                Current Password
                                            </div>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="txtCurrentPsw"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3" style="padding-left:3rem;">
                                                New Password
                                            </div>
                                            <div class="col-sm-9">
                                                 <input type="text" class="form-control" name="txtNewPsw"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-3" style="padding-left:3rem;">
                                                Confirm New Password
                                            </div>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" name="txtConfirmNewPsw"/>
                                            </div>
                                        </div>
                                    </div>--%>
                                    <div class="row">
                                        <div class="col-sm-3" style="padding-left:3rem;">
                                            User Role
                                        </div>
                                        <div class="col-sm-9">
                                                <input type="text" class="form-control" value="<%=UserInfo[3] %>" readonly/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12" style="padding-left:3rem;">
                                            <asp:Button runat="server" CssClass="btn btn-dark" accept=".png,.jpg,.jpeg"  OnClick="btnSaveUserInfoClick" Text="Save"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
               </div>
          </div>                
    </section>
</asp:Content>
