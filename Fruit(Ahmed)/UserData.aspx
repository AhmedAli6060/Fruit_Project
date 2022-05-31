<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UserData.aspx.cs" Inherits="Fruit_Ahmed_.UserData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section id="img-title">
        <div class="container-fluid">
            <div class="row">
                <h1 class="text-center">بيانات المستخدمين</h1>
            </div>
        </div>
    </section>

       <section class="cart">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <asp:GridView ID="gvusers" runat="server" AutoGenerateColumns="false" 
                            OnPageIndexChanging="gvusers_PageIndexChanging" PageSize="10"
                            AllowPaging="true" class="table table-bordered frame"  
                            DataKeyNames="customer_ID" OnRowDeleting="gvusers_RowDeleting" CssClass="table table-bordered  table-responsive">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="true" DeleteText="حذف" ControlStyle-CssClass="btn btn-danger" ItemStyle-Width="5%" />
                                <asp:TemplateField HeaderText="البريد الإلكتروني" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server"  Text='<%# Eval("Email") %>' ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="اسم المستخدم" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("userName") %>'  ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </section>
</asp:Content>
