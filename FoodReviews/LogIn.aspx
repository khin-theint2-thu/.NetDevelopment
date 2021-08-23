<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="FoodReviews.LogIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>

    .login-page {
        width: 360px;
        padding: 5% 0 0;
        margin: auto;
    }

    .form {
        top:60px;
        position: relative;
        /*z-index: 1;*/
        background: #FFFFFF;
        max-width: 360px;
        /*margin: 0 auto 100px;*/
        padding: 45px;
        text-align: center;
        box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
    }

    .form input {
        font-family: "Roboto", sans-serif;
        outline: 0;
        background: #f2f2f2;
        width: 100%;
        border: 0;
        margin: 0 0 15px;
        padding: 15px;
        box-sizing: border-box;
        font-size: 14px;
    }

    .form button {
        font-family: "Roboto", sans-serif;
        text-transform: uppercase;
        outline: 0;
        background: #000;
        width: 100%;
        border: 0;
        padding: 15px;
        color: #FFFFFF;
        font-size: 14px;
        -webkit-transition: all 0.3 ease;
        transition: all 0.3 ease;
        cursor: pointer;
    }

    .form button:hover, .form button:active, .form button:focus {
        background: #ab0012;
    }

    .form .message {
        margin: 15px 0 0;
        color: #b3b3b3;
        font-size: 12px;
    }

    .form .message a {
        color: #ed6226;
        text-decoration: none;
    }

    .form .register-form {
        display: none;
    }

    .container:before, .container:after {
        content: "";
        display: block;
        clear: both;
    }

    .container .info {
        margin: 50px auto;
        text-align: center;
    }

    .container .info h1 {
        margin: 0 0 15px;
        padding: 0;
        font-size: 36px;
        font-weight: 300;
        color: #1a1a1a;
    }

    .container .info span {
        color: #4d4d4d;
        font-size: 12px;
    }

    .container .info span a {
        color: #000000;
        text-decoration: none;
    }

    .container .info span .fa {
        color: #EF3B3A;
    }

    body {
        background: #f5f5f5; /* fallback for old browsers */
    }

    a:hover,a:focus{
        color:#ab0012!important;
    }
</style>
    <script>
        $(document).ready(function () {
            $('.message a').click(function () {
                $('.animate').animate({ height: "toggle", opacity: "toggle" }, "slow");
            });
        });

        function CreateAccount() {
            var validationstatus = CreateFormValidation();
            var name = $("#txtName").val();
            var password = $("#txtPassowrd").val();
            var email = $("#txtEmailAddress").val();
            if (validationstatus) {
                $.ajax({
                    type: 'POST',
                    url: '<%= ResolveUrl("~/LogIn.aspx/CreateAccount") %>',
                    data: JSON.stringify({ "Name": name, "Password": password, "Email": email }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                    },
                    error: function (data, success, error) {
                        alert("Error : " + data.responseJSON.Message);
                    }
                });
            }
        }

        function AccountLogIn() {
            var validationStatus = LoginFormValidation();
            var name = $("#txtusername").val();
            var password = $("#txtuserpassword").val();
            if (validationStatus) {
                $.ajax({
                    type: 'POST',
                    url: '<%= ResolveUrl("~/LogIn.aspx/AccountLogIn") %>',
                    data: JSON.stringify({ "Name": name, "Password": password }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        if (data.d.UserName == null) {
                            alert("Account does not exist");
                        }
                        else if (data.d.Password.toLowerCase() != password.toLowerCase()) {
                            alert("Incorrect Password.");
                        }
                        else if (data.d.UserRole.toLowerCase() == "admin" || data.d.UserRole.toLowerCase() == "user") {
                            //set cookie
                            setCookie([data.d.UserID, data.d.UserName, data.d.UserImage, data.d.UserRole, data.d.Email]);
                            window.location.href = "Index.aspx";
                        }
                        return false;
                    },
                    error: function (data, success, error) {
                        alert("Error : " + data.responseJSON.Message);
                    }
                });
            }
        }

        function setCookie(userinfo) {
            var cookieName = "UserInfo";
            var cookieValue = userinfo;
            var d = new Date();
            d.setTime(d.getTime() + (30 * 24 * 60 * 60 * 1000));//cookies will be expire after 1 month
            var expires = "expires=" + d.toGMTString();
            document.cookie = cookieName + "=" + cookieValue + ";" + expires + ";path=/";
        }

        function LoginFormValidation() {
            var status = true;
            if ($("#txtusername").val().length == 0) {
                alert("User Name is required.")
                status = false;
            }

            if ($("#txtuserpassword").val().length == 0) {
                alert("Password is required.")
                status = false;
            }
            return status;
        }

        function CreateFormValidation() {
            var status = true;
            if ($("#txtName").length == 0) {
                alert("Name is required.")
                status = false;
            }

            if ($("#txtPassowrd").length == 0) {
                alert("Password is required.")
                status = false;
            }

            if ($("#txtEmailAddress").length == 0) {
                alert("Email Address is required.")
                status = false;
            }
            return status;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container pb10">
            <div class="login-page">
              <div class="form">
                   <div class="login-form animate">
                      <input type="text" id="txtusername" placeholder="username"/>
                      <input type="password" id="txtuserpassword" placeholder="password"/>
                      <button onclick="AccountLogIn()">login</button>
                      <p class="message">Not registered? <a href="#">Create an account</a></p>
                   </div>
                   <div class="register-form animate">
                      <input type="text" id="txtName" placeholder="name" required="required"/>
                      <input type="password" id="txtPassowrd" placeholder="password"/>
                      <input type="text" id="txtEmailAddress" placeholder="email address"/>
                      <button onclick="CreateAccount()">create</button>
                      <p class="message">Already registered? <a href="#">Log In</a></p>
                  </div>   
              </div>
            </div>
        </div>
</asp:Content>
