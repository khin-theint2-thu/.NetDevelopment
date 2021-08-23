<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ViewPost.aspx.cs" Inherits="FoodReviews.ViewPost" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .postinfo {
            margin-bottom: 20px;
        }

        .postinfo span {
            font-size: 14px;
            color: #000;
            font-weight: 500;
            /*padding-bottom: 20px;*/
        }

        h2 {
            margin: 20px 0px 10px 0px !important;
        }

        .postcontent p {
            color: #000;
            font-weight: 400;
            margin-top: 20px;
            line-height: 25px;
        }

        .postedusername i {
            color: #ab0012;
        }

        .postType {
            background: #000;
            color: #fff!important;
            padding: 5px 10px;
            border-radius: 5px;
            margin-left: 7px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2><%=post.PostTitle%></h2>
                <div class="postinfo">
                    <span class="postedusername">By <i><%=post.PostedUser%></i> |</span>
                    <span><%=String.Format("{0:dd MMMM yyyy}", post.PostedDate)%></span>
                    <span class="postType"><%=post.PostType %></span>
                </div>
                <div class="postimage">
                    <img src="Images/ContentImages/<%=post.PostImage%>" alt="" width="100%" height="465px"/>
                </div>
                <div class="postcontent">
                    <p><%=post.PostContent%></p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
