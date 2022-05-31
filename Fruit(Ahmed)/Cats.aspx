<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Cats.aspx.cs" Inherits="Fruit_Ahmed_.Cats" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section id="img-title">
        <div class="container-fluid">
            <div class="row">
                <h1 class="text-center">المنتجات</h1>
            </div>
        </div>
    </section>
    <section id="product">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <hr />
                </div>
                <div class="col-md-4">
                    <h2 class="text-center title" runat="server" id="h2header"></h2>
                </div>
                <div class="col-md-4">
                    <hr />
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group" align="right">
                        <asp:DropDownList ID="ddlcats" runat="server" Style="direction: rtl; font-size: large; width: 50%" class="form-control input-lg text-right" AutoPostBack="true"  OnSelectedIndexChanged="ddlcats_SelectedIndexChanged">
                            
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="row">
                <asp:ListView ID="listview" runat="server" OnItemCommand="listview_ItemCommand" OnSelectedIndexChanging="listview_SelectedIndexChanging" OnSelectedIndexChanged="listview_SelectedIndexChanged"   DataKeyNames="product_ID" >
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="thumbnail1">
                                <p class="text-center">
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/images/frutisImages/"+Eval("image") %>' />
                                </p>
                                <div class="caption">
                                    <h3 class="text-center">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("productName") %>'></asp:Label></h3>
                                    <hr />
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <h5 class="text-center">
                                                <table align="center">
                                                    <tr>
                                                        <td>
                                                            <asp:LinkButton runat="server" ID="btnmin" class="fa fa-minus" CommandName="min"></asp:LinkButton></td>
                                                        <td>
                                                            <asp:TextBox runat="server" ID="txtquantity" CssClass="form-control" Text="1" BackColor="Transparent" autocomplete="off" size="2" ReadOnly="true" Width="65px" Style="display: inline-block; text-align: center;" TextMode="number"></asp:TextBox></td>
                                                        <td>
                                                            <asp:LinkButton runat="server" ID="btaadd" CommandName="Pluse" class="fa fa-plus"></asp:LinkButton></td>
                                                    </tr>
                                                </table>
                                            </h5>

                                            <h2 class="text-center">
                                                <p class="alignContent">
                                                    <p class="text-left alignContent">(ريال  (كيلو</p>
                                                    <asp:Label ID="Lblprice" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                                                </p>
                                                 <p class="alignContent">
                                                    <p class="text-left alignContent">طلب</p>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("NoOrder") %>'></asp:Label>
                                                </p>
                                            </h2>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <%--<asp:Label ID="lblid" runat="server" Text='<%# Eval("Cart_ComponentID") %>' Visible="false"></asp:Label>--%>
                                    <asp:Label ID="lblproid" runat="server" Text='<%# Eval("product_ID") %>' Visible="false"></asp:Label>
                                    <p class="text-center">
                                        <asp:LinkButton ID="lnkaddtocart" runat="server" CssClass="btn btn-mine" CommandName="select">
                                                    <i class="glyphicon glyphicon-shopping-cart"></i>أضف الي سلتي</asp:LinkButton>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
              
            </div>
        </div>
    </section>
</asp:Content>
