<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="BlogContentForm.aspx.cs" Inherits="FoodReviews.BlogContentForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       h6{
           margin-bottom:10px;
       }

       .form-wrapper .form-control{
           min-height:40px!important;
       }

        input[type="radio"]{
            margin-bottom:1rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section class="section lb">
           <div class="container pb10">
                <div class="row">
                    <div class="col-lg-12">
                    <div class="form-wrapper">
                        <h6>Blog Title <span style="color:red;">*</span></h6>
                        <input type="text" name="txtPostTitle" id="PostTitle" class="form-control" value="" />
                        <h6>Blog Content <span style="color:red;">*</span></h6>
                        <pre><textarea name="txtPostContent" id="PostContent" class="form-control" style="height:250px;"></textarea></pre>
                        <h6>Post Type <span style="color:red;">*</span></h6>
                            <input type="radio" id="PostType1" name="rdoPostType" value="Foods" class="rdoinput" checked/>
                            <label for="Admin" class="statusLabel">Foods</label>
                            <input type="radio" id="PostType2" name="rdoPostType" value="Foods" class="rdoinput"/>
                            <label for="Admin" class="statusLabel">Restaurants</label>
                            <input type="radio" id="PostType3" name="rdoPostType" value="Recipes" class="rdoinput"/>
                            <label for="User" class="statusLabel">Recipes</label>
                            <input type="radio" id="PostType4" name="rdoPostType" value="Ingredients" class="rdoinput"/>
                            <label for="User" class="statusLabel">Ingredients</label>
                        <h6>Content Image <span style="color:red;">*</span></h6>
                        <asp:FileUpload ID="PostImage" runat="server" AllowMultiple="false" value="" style="margin-bottom:25px;"/><br />
                        <asp:Button runat="server" CssClass="btn btn-dark" OnClick="btnPostClick" Text="Post"/>
                        <asp:Button runat="server" CssClass="btn btn-dark" OnClick="btnCancelClick" Text="Cancel"/>
                    </div>
                </div>
                </div>
            </div>
        </section>
</asp:Content>
