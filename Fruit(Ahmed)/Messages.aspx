<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Messages.aspx.cs" Inherits="Fruit_Ahmed_.Messages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <section id="img-title">
        <div class="container-fluid">
            <div class="row">
                <h1 class="text-center">الرسائل</h1>
            </div>
        </div>
    </section>

       <section class="cart">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <asp:GridView ID="gvMessage" runat="server" AutoGenerateColumns="false" class="table table-bordered frame"  DataKeyNames="MassegeID" OnPageIndexChanging="gvMessage_PageIndexChanging"
                            PageSize="10" AllowPaging="true">
                            <Columns>
                                
                                <asp:TemplateField HeaderText="الرسالة" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server"  Text='<%# Eval("Masseges") %>' ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="البريد الإلكتروني" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server"  Text='<%# Eval("Email") %>' ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="اسم المستخدم" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("UserName") %>'  ></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </section>

</asp:Content>
