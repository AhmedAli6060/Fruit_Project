<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Fruit_Ahmed_.Cart1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <section id="img-title">
                <div class="container-fluid">
                    <div class="row">
                        <h1 class="text-center">سلة المشتريات</h1>
                    </div>
                </div>
            </section>
            <section id="secempty" runat="server" visible="false">
                <p class="text-center bg-warning">
                    <p runat="server" class="bg-warning text-center text-warning text-capitalize" style="font-size:2em"><i class="glyphicon glyphicon-info-sign"></i> السلة فارغه من فضلك اذهب لصفحه الاصناف لأختيار المنتج </p>
                </p>
            </section>
            <section class="cart">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <asp:GridView ID="Gvcart" runat="server" class="table table-bordered frame" OnRowCommand="Gvcart_RowCommand" AutoGenerateColumns="false" OnRowDeleting="Gvcart_RowDeleting" AllowPaging="true" PageSize="10" OnPageIndexChanging="Gvcart_PageIndexChanging" DataKeyNames="Cart_ComponentID">
                                <Columns>

                                    <asp:TemplateField HeaderStyle-Width="45%">
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" class="img-responsive" Width="30%" ImageUrl='<%#"~/images/frutisImages/"+Eval("image") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="الاجمالي" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltotal" runat="server" Text='<%# " الإجمالي " + Eval("Total_Price") +" ريال " %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                        
                                    <asp:TemplateField HeaderText="سعر الكيلو" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblprice" runat="server" Text='<%# " بـ " + Eval("price") +" ريال " %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="الكمية المطلوبة" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="txtquantity" runat="server"  Text='<%# " الكمية "+ Eval("quantity") +" ك " %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                        
                                    <asp:TemplateField HeaderText="اسم المنتج" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Lblproname" runat="server" Text='<%# Eval("productName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblid" runat="server" Text='<%# Eval("Cart_ComponentID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblproid" runat="server" Text='<%# Eval("product_ID") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ControlStyle-CssClass="fa fa-times" ShowDeleteButton="true" DeleteText="" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <section>
                        <p class="text-center">
                            <asp:LinkButton runat="server" ID="btnConfirm" OnClientClick="map()" OnClick="btnConfirm_Click" class="btn btn-mine btn-lg">  تاكيد الطلب</asp:LinkButton>
                        </p>
                    </section>
                   
            </section>


        </ContentTemplate>
    </asp:UpdatePanel>

    
</asp:Content>
