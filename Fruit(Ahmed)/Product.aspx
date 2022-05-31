<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Fruit_Ahmed_.Product1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-control
        {
            direction:rtl;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <table class="table">
        <tr>
            <td align="center">
                <asp:Button ID="btnAddFruit1" CssClass="btn btn-default btn-lg" runat="server" Text="إدارة الفاكهه" OnClick="btnAddFruit1_Click" CausesValidation="false" />
                <asp:Button ID="bntAddVegetables1" CssClass="btn btn-default btn-lg" runat="server" Text="إدارة الخضروات" OnClick="bntAddVegetables1_Click" CausesValidation="false" />
            </td>
        </tr>
    </table>

    <asp:UpdatePanel ID="upnlFruit" runat="server" Visible="false">
        <ContentTemplate>

            <section id="AddFruits">
                <div class="container">
                    <div class="row">
                        <%--Grid--%>
                        <div class="col-md-5  frame">
                            <h2 class="text-center">الفواكهه المتواجده</h2>
                            <hr />
                            <div class="form-group">
                                <asp:GridView ID="gvFruits" runat="server" DataKeyNames="product_ID"
                                    AllowPaging="True" AutoGenerateColumns="False" PageSize="3"
                                    OnRowDeleting="gvFruits_RowDeleting"
                                    OnPageIndexChanging="gvFruits_PageIndexChanging"
                                    CellPadding="4" CssClass="table table-bordered table-responsive " OnSelectedIndexChanged="gvFruits_SelectedIndexChanged">
                                    <Columns>
                                        <asp:CommandField ShowDeleteButton="true" DeleteText="حذف" ControlStyle-CssClass="btn btn-danger" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" CausesValidation="false" runat="server" CssClass="btn btn-danger" CommandName="select">تعديل</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="صورة المنتج">
                                            <ItemTemplate>
                                                <asp:Image ID="fupFruits" runat="server" CssClass="img-responsive" AlternateText="No Image" ImageUrl='<%# "~/images/frutisImages/" + Eval("image") %>'></asp:Image>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="المدينة">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcityname" runat="server" Text='<%# Eval("CityName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="الكميه المتاحه">
                                            <ItemTemplate>
                                                <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="السعر للكيلو الواحد">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="أسم الفاكهه">
                                            <ItemTemplate>
                                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("productName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:LinkButton ID="Linkadd" OnClick="Linkadd_Click" CssClass="btn btn-mine  btn-block" runat="server">اضافة</asp:LinkButton>
                            </div>
                        </div>

                        <%--add --%>

                        <asp:Panel ID="Panel1" runat="server" Visible="false">
                            <div class="col-md-5 col-md-offset-2 frame text-right">
                                <h2 class="text-center">أضافة فاكهه </h2>
                                <hr />
                                <div class="form-group">
                                    <label id="lblName">
                                        أسم الفاكهه<span class="text-danger">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ControlToValidate="txtName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </span>
                                    </label>
                                    <asp:TextBox ID="txtName" CssClass="form-control" placeholder="أدخل هنا أسم الفاكهه" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="text-right" for=""> سعر الكيلو
                                        <span class="text-danger">
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="من فضلك قم بأدخال ارقام !!" ControlToValidate="txtPrice" ValidationExpression="^(?:\d{1,2})?(?:\.\d{1,2})?$"></asp:RegularExpressionValidator>
                                        </span>
                                        <span class="text-danger">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ControlToValidate="txtPrice" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </span>
                                       
                                                                        

                                    </label>

                                    <asp:TextBox ID="txtPrice" CssClass="form-control" placeholder="أدخل هنا سعر الكيلو الواحد" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label id="lblQuantity">
                                        المدينة<span class="text-danger">
                                           
                                        </span>
                                    </label>
                                    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="CityName" DataValueField="CityID">
                                        
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FruitConnectionString3 %>" SelectCommand="SELECT * FROM [Cityes]"></asp:SqlDataSource>
                                    <asp:EntityDataSource ID="EntityDataSource1" runat="server">
                                    </asp:EntityDataSource>
                                </div>
                                <div class="form-group">
                                    <label class="text-right" for=""> الكميه
                                        <span class="text-danger">
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="من فضلك قم بأدخال ارقام !!" ControlToValidate="txtQuantity" ValidationExpression="^(?:\d{1,2})?(?:\.\d{1,2})?$"></asp:RegularExpressionValidator>
                                        </span>
                                        <span class="text-danger">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ControlToValidate="txtQuantity" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </span>
                                       
                                                                        

                                    </label>

                                    <asp:TextBox ID="txtQuantity" CssClass="form-control" placeholder="أدخل هنا الكميه" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label id="lblImage">
                                        أضف صوره<span class="text-danger">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ControlToValidate="fUpImage" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </span>
                                    </label>
                                    <asp:FileUpload ID="fUpImage" CssClass="btn btn-default" runat="server" />
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="btnAddFruit2" runat="server" CssClass="btn btn-mine  btn-lg" Text="إضافة" OnClick="btnAddFruit2_Click" />
                                </div>
                                <p class="bg-success text-center"><i class="glyphicon glyphicon-ok" runat="server" visible="false" id="lblokf">تمت الأضافه</i></p>
                                <p class="bg-warning text-center"><i class="glyphicon glyphicon-warning-sign" runat="server" visible="false" id="lblfailf">من فضلك اختار صوره فقط</i></p>
                            </div>
                        </asp:Panel>

                        <%--   Edit--%>
                        <asp:Panel ID="Panel2" runat="server" Visible="false">
                            <div class="col-md-5 col-md-offset-2 frame text-right">
                                <h2 class="text-center">تعديل </h2>
                                <hr />
                                <div class="form-group">
                                    <label id="lblName">
                                        أسم الفاكهه<span class="text-danger">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" Display="Dynamic" runat="server" ControlToValidate="TextBox1name" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </span>
                                    </label>
                                    <asp:TextBox ID="TextBox1name" CssClass="form-control" placeholder="أدخل هنا أسم الفاكهه" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="text-right" for="">
                                        سعر الكيلو
                                        <span class="text-danger">
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="من فضلك قم بأدخال ارقام !!" ControlToValidate="TextBox2price" ValidationExpression="^(?:\d{1,2})?(?:\.\d{1,2})?$"></asp:RegularExpressionValidator>
                                        </span>
                                        <span class="text-danger">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" Display="Dynamic" runat="server" ControlToValidate="TextBox2price" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </span>                                
                                    </label>

                                    <asp:TextBox ID="TextBox2price" CssClass="form-control" placeholder="أدخل هنا سعر الكيلو الواحد" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label id="lblQuantity">
                                        المدينة<span class="text-danger">
                                           
                                        </span>
                                    </label>
                                    <asp:DropDownList ID="DropDownList3" runat="server"  class="form-control" DataSourceID="SqlDataSource2" DataTextField="CityName" DataValueField="CityID">

                                       
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FruitConnectionString4 %>" SelectCommand="SELECT * FROM [Cityes]"></asp:SqlDataSource>
                                </div>
                                <div class="form-group">
                                    <label class="text-right" for="">الكميه
                                        <span class="text-danger">
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="من فضلك قم بأدخال ارقام !!" ControlToValidate="TextBox3quan" ValidationExpression="^(?:\d{1,2})?(?:\.\d{1,2})?$"></asp:RegularExpressionValidator>
                                        </span>
                                        <span class="text-danger">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" Display="Dynamic" runat="server" ControlToValidate="TextBox3quan" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </span>
                                    </label>

                                    <asp:TextBox ID="TextBox3quan" CssClass="form-control" placeholder="أدخل هنا الكميه" runat="server"></asp:TextBox>
                                </div>
                                <%--<div class="form-group">
                                    <label id="lblImage">
                                        أضف صوره<span class="text-danger">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" Display="Dynamic" runat="server" ControlToValidate="FileUpload1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </span>
                                    </label>
                                    <asp:FileUpload ID="FileUpload1" CssClass="btn btn-default" runat="server" />
                                    <asp:Label ID="Label1img" runat="server" Visible="false" Text="Label"></asp:Label>
                                </div>--%>
                                <div class="form-group">
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-mine  btn-lg" Text="الغاء" CausesValidation="false" OnClick="Button2_Click" />
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-mine  btn-lg" Text="تعديل" OnClick="Button1_Click" />
                                    </div>
                            </div>
                        </asp:Panel>


                    </div>
                </div>
            </section>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnAddFruit2" />
        </Triggers>
    </asp:UpdatePanel>

    <br />

    <asp:UpdatePanel ID="upnlVegetable" runat="server" Visible="false">
        <ContentTemplate>

            <section id="AddVegetables">
                <div class="container">
                    <div class="row">

                        <%--Grid--%>

                        <div class="col-md-5  frame">
                            <h2 class="text-center">الخضروات المتواجده</h2>
                            <hr />
                            <div class="form-group">
                                <asp:GridView ID="gvVegetables" runat="server" DataKeyNames="product_ID"
                                    AllowPaging="True" AutoGenerateColumns="False" PageSize="3"
                                    OnRowDeleting="gvVegetables_RowDeleting" OnPageIndexChanging="gvVegetables_PageIndexChanging"
                                    CellPadding="4" CssClass="table table-bordered table-responsive " OnSelectedIndexChanged="gvVegetables_SelectedIndexChanged">
                                    <Columns>
                                        <asp:CommandField ShowDeleteButton="true" DeleteText="حذف" ControlStyle-CssClass="btn btn-danger" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" CausesValidation="false" runat="server" CssClass="btn btn-danger" CommandName="select">تعديل</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="صورة المنتج">
                                            <ItemTemplate>
                                                <asp:Image ID="fupFruits" runat="server" CssClass="img-responsive" AlternateText="No Image" ImageUrl='<%# "~/images/frutisImages/" + Eval("image") %>'></asp:Image>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="المدينة">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcityname" runat="server" Text='<%# Eval("CityName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="الكميه المتاحه">
                                            <ItemTemplate>
                                                <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="السعر للكيلو الواحد">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="أسم الفاكهه">
                                            <ItemTemplate>
                                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("productName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <asp:LinkButton ID="LinkButton2" OnClick="LinkButton2_Click" CssClass="btn btn-mine  btn-block" runat="server">اضافة</asp:LinkButton>
                            </div>
                        </div>

                        <%--add --%>

                        <asp:Panel ID="Panel4" runat="server" Visible="false">
                            <div class="col-md-5 col-md-offset-2 frame text-right">
                                <h2 class="text-center">أضافة خضروات </h2>
                                <hr />
                                <div class="form-group">
                                    <label id="lblName2">
                                        أسم الخضره<span class="text-danger">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" runat="server" ControlToValidate="txtName2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </span>
                                    </label>
                                    <asp:TextBox ID="txtName2" CssClass="form-control" placeholder="أدخل هنا أسم الخضره" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="text-right" for="">
                                        سعر الكيلو 
                                        <span class="text-danger">
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="من فضلك قم بأدخال ارقام !!" ControlToValidate="txtPrice2" ValidationExpression="^(?:\d{1,2})?(?:\.\d{1,2})?$"></asp:RegularExpressionValidator>
                                        </span>
                                        <span class="text-danger">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" runat="server" ControlToValidate="txtPrice2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </span>
                                    </label>

                                    <asp:TextBox ID="txtPrice2" CssClass="form-control" placeholder="أدخل هنا سعر الكيلو الواحد" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label id="lblQuantity">
                                        المدينة<span class="text-danger">
                                        </span>
                                    </label>
                                    <asp:DropDownList ID="DropDownList2" DataSourceID="SqlDataSource2" runat="server" class="form-control" DataTextField="CityName" DataValueField="CityID">
                                        
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="text-right" for="">
                                        الكميه 
                                        <span class="text-danger">
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="من فضلك قم بأدخال ارقام !!" ControlToValidate="txtQuantity2" ValidationExpression="^(?:\d{1,2})?(?:\.\d{1,2})?$"></asp:RegularExpressionValidator>
                                        </span>
                                        <span class="text-danger">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" runat="server" ControlToValidate="txtQuantity2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </span>
                                    </label>

                                    <asp:TextBox ID="txtQuantity2" CssClass="form-control" placeholder="أدخل هنا الكميه" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label id="lblImage2">
                                        أصف صوره<span class="text-danger">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" runat="server" ControlToValidate="fUpImage2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </span>
                                    </label>
                                    <asp:FileUpload ID="fUpImage2" CssClass="btn btn-default" runat="server" />
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="btnAddVegetables" runat="server" CssClass="btn btn-mine  btn-lg" Text="إضافة" OnClick="btnAddVegetables_Click" />
                                </div>
                                <p class="bg-success text-center"><i class="glyphicon glyphicon-ok" runat="server" visible="false" id="lblokv">تمت الأضافة</i></p>
                                <p class="bg-warning text-center"><i class="glyphicon glyphicon-warning-sign" runat="server" visible="false" id="lblfailv">من فضلك اختار صوره فقط</i></p>
                            </div>
                        </asp:Panel>
                        <%--  Edit --%>
                        <asp:Panel ID="Panel3" runat="server" Visible="false">
                            <div class="col-md-5 col-md-offset-2 frame text-right">
                                <h2 class="text-center">تعديل </h2>
                                <hr />
                                <div class="form-group">
                                    <label id="lblName">
                                         أسم الخضروات <span class="text-danger">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" Display="Dynamic" runat="server" ControlToValidate="TextBox1v" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </span>
                                    </label>
                                    <asp:TextBox ID="TextBox1v" CssClass="form-control" placeholder="أدخل هنا أسم الفاكهه" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label class="text-right" for="">سعر الكيلو
                                        <span class="text-danger">
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="من فضلك قم بأدخال ارقام !!" ControlToValidate="TextBox2v" ValidationExpression="^(?:\d{1,2})?(?:\.\d{1,2})?$"></asp:RegularExpressionValidator>
                                        </span>
                                        <span class="text-danger">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" Display="Dynamic" runat="server" ControlToValidate="TextBox2v" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </span>
                                    </label>

                                    <asp:TextBox ID="TextBox2v" CssClass="form-control" placeholder="أدخل هنا سعر الكيلو الواحد" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label id="lblQuantity">
                                        المدينة<span class="text-danger">
                                           
                                        </span>
                                    </label>
                                    <asp:DropDownList ID="DropDownList4" DataSourceID="SqlDataSource2" runat="server" class="form-control" DataTextField="CityName" DataValueField="CityID">

                                       
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label class="text-right" for="">الكميه
                                        <span class="text-danger">
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ErrorMessage="من فضلك قم بأدخال ارقام !!" ControlToValidate="TextBox3quan" ValidationExpression="^(?:\d{1,2})?(?:\.\d{1,2})?$"></asp:RegularExpressionValidator>
                                        </span>
                                        <span class="text-danger">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" Display="Dynamic" runat="server" ControlToValidate="TextBox3v" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </span>
                                    </label>

                                    <asp:TextBox ID="TextBox3v" CssClass="form-control" placeholder="أدخل هنا الكميه" runat="server"></asp:TextBox>
                                </div>
                                <%--<div class="form-group">
                                    <label id="lblImage">
                                        أصف صوره<span class="text-danger">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" Display="Dynamic" runat="server" ControlToValidate="FileUpload2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </span>
                                    </label>
                                    <asp:FileUpload ID="FileUpload2" CssClass="btn btn-default" runat="server" />
                                    <asp:Label ID="Label1v" runat="server" Visible="false" Text="Label"></asp:Label>
                                </div>--%>
                                <div class="form-group">
                                    <asp:Button ID="Button4" runat="server" CssClass="btn btn-mine  btn-lg" Text="الغاء" CausesValidation="false" OnClick="Button4_Click" />
                                    <asp:Button ID="Button3" runat="server" CssClass="btn btn-mine  btn-lg" Text="تعديل" OnClick="Button3_Click" />
                                    </div>
                            </div>
                        </asp:Panel>

                        </div>
                    </div>
                </section>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnAddVegetables" />
        </Triggers>
    </asp:UpdatePanel>


</asp:Content>
