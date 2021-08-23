<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="MenuForm.aspx.cs" Inherits="FoodReviews.MenuForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
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
                    url: '<%= ResolveUrl("~/MenuForm.aspx/DeleteMenu") %>',
                    data: JSON.stringify({ "selectedIDs": selectedIDs }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (data) {
                        window.location.href = "MenuForm.aspx?RestaurantID=<%=editRestaurantId%>";
                    },
                    error: function (data, success, error) {
                        alert("Error : " + data.responseJSON.Message);
                    }
                });
            };
        }

        function EditMenu(e) {
            var $el = $(e);
            var MenuID = $el.attr("data-id");
            $.ajax({
                type: 'POST',
                url: '<%= ResolveUrl("~/MenuForm.aspx/EditMenuDetail") %>',
                data: JSON.stringify({ "MenuID": MenuID }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    var MenuDetail = data.d;
                    $("#MenuID").val(MenuID);
                    $("#MenuName").val(MenuDetail.MenuName);
                    $("#Price").val(MenuDetail.Price);
                    $("#comboCategoryName").find($("select option[value='" + MenuDetail.CategoryID + "']")).attr("selected", true);
                    alert(MenuDetail.CategoryID);
                },
                error: function (data, success, error) {
                    alert("Error : " + data.responseJSON.Message);
                }
            });
        }

        $(document).ready(function () {
            $('#MenuTable').DataTable();
        });

        function CategoryFormValidation() {
            var validationstatus = true;
            if ($('#CategoryName').val().length == 0) {
                alert("Category Name is required.")
                validationstatus = false;
            }

            return validationstatus;
        }

        function MenuFormValidation() {
            var validationstatus = true;
            if ($('#MenuName').val().length == 0) {
                alert("Menu Name is required.")
                validationstatus = false;
            }            

            if ($('#Price').val().length == 0) {
                alert("Price is required.")
                validationstatus = false;
            }

            if ($('#ContentPlaceHolder1_FileUpload').val().length == 0) {
                alert("Upload File is required.")
                validationstatus = false;
            }

            return validationstatus;
        }

        function DeleteCategory() {
            var del = document.getElementById('delete'),
            sel = document.getElementById('comboCategoryName');
            var opt = sel.options[sel.selectedIndex];
            if (opt.className !== 'placeholder') {
                sel.removeChild(opt);
            }
            $.ajax({
                type: 'POST',
                url: '<%= ResolveUrl("~/MenuForm.aspx/DeleteCategory") %>',
                data: JSON.stringify({ "categoryID": opt.value }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    window.location.href = "MenuForm.aspx?RestaurantID=<%=editRestaurantId%>";
                },
                error: function (data, success, error) {
                    alert("Error : " + data.responseJSON.Message);
                }
            });
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
                                <div class="col-lg-12">
                                   <div class="form-wrapper">
                                        <asp:Button runat="server" CssClass="btn btn-dark" OnClick="btnGoToRestaurantListing" Text="View Restaurant List" style="margin-bottom:30px;"/>
                                        <asp:Button runat="server" CssClass="btn btn-dark" Text="Reset" OnClientClick="this.form.reset();return false;" style="margin-bottom:30px;"/>
                                   </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="form-wrapper">
                                        <h6>Menu Name <span style="color:red;">*</span></h6>
                                        <input type="text" name="txtMenuName" id="MenuName" class="form-control" value=""  />
                                        <h6>Category Name <span style="color:red;">*</span><i class="fa fa-trash-o" aria-hidden="true" id="delete" onclick="DeleteCategory()" style="cursor:pointer;float:right;"></i></h6>
                                        <select name="comboCategoryName" class="form-control" id="comboCategoryName" >
                                            <%  
                                                for (int i = 0; i < CategoryList.Count(); i++)
                                                {
                                                    %>
                                            <option value="<%= CategoryList[i].CategoryID %>"><%= CategoryList[i].CategoryName %></option>
                                            <%} %>
                                        </select>
                                        <asp:Button runat="server" CssClass="btn btn-dark" OnClick="btnAddMenuClick" OnClientClick="return MenuFormValidation()" Text="Add Menu" style="float:left;"/>
                                        <input type="hidden" id="MenuID" name="txtMenuID"/>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-wrapper">
                                        <h6>Price <span style="color:red;">*</span></h6>
                                        <input type="text" name="txtPrice" id="Price" class="form-control" value=""  />
                                        <h6>Upload File <span style="color:red;">*</span></h6>
                                        <asp:FileUpload ID="FileUpload" runat="server" AllowMultiple="false" value="" style="margin-bottom:25px;"/>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-wrapper">
                                        <h6>Category Name <span style="color:red;">*</span></h6>
                                        <input type="text" name="txtCategoryName" id="CategoryName" class="form-control" value=""/>
                                        <asp:Button runat="server" CssClass="btn btn-dark" OnClick="btnAddCategoryClick" OnClientClick="return CategoryFormValidation()" Text="Add Category"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="container">
                        <table id="MenuTable" class="table table-striped table-bordered" style="width:100%;margin-top:30px;">
                            <thead>
                                <tr>
                                    <th>
                                        <i class="fa fa-trash-o" aria-hidden="true" onclick="DeleteMenu()"></i>
							        </th>
							        <th>Menu Name</th>
							        <th>Category Name</th>
							        <th>Price</th>
							        <th>File(s)</th>
							        <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                    <%
                                        for (int i = 0; i < MenuList.Count(); i++)
                                        {
                                            Menu = MenuList[i];
                                %>
					            <tr>
                                    <td><input type="checkbox" class="deleteChkBox" value="<%=Menu.MenuID %>"/></td>
							        <td><%=Menu.MenuName %></td>
							        <td><%=Menu.CategoryName %></td>
							        <td><%=String.Format("{0:N0}", Menu.Price)%>Ks</td>,
							        <td><%=Menu.MenuImage %></td>
                                    <td><i class="fa fa-pencil" aria-hidden="true" data-id="<%=Menu.MenuID %>" onclick="EditMenu(this)" style="cursor:pointer;"></i></td>
						        </tr>
                            <%} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    </section>

</asp:Content>
