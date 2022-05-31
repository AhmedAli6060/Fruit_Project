<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Fruit_Ahmed_.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <section id="img-title">
        <div class="container-fluid">
            <div class="row">
                <h2 class="text-center w">الصفحة الشخصية</h2>
                <h2 class="text-center w"> 
                        مرحبا بك في صفحتك الشخصية يا
                    </h2>
                <h3 class="text-center headName">
                          <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                </h3>
            </div>
        </div>
    </section>

    <section class="cart">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="Gvprofile" AllowPaging="true" runat="server" class="table table-bordered table-responsive frame" CellPadding="4" OnPageIndexChanging="Gvprofile_PageIndexChanging" PageSize="10"  AutoGenerateColumns="false"  DataKeyNames="Order_ComponentID">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" class="img-responsive" Width="30%" ImageUrl='<%#"~/images/frutisImages/"+Eval("image") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="الاجمالي">
                                <ItemTemplate>
                                    <asp:Label ID="lbltotal" runat="server" Text='<%# "الإجمالي " + Eval("TotalPrice") +" ريال " %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="الكمية">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>   
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="اسم المنتج">
                                <ItemTemplate>
                                    <asp:Label ID="Lblproname" runat="server" Text='<%# Eval("productName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="رقم الطلب">
                                <ItemTemplate>
                                    <asp:Label ID="lbltotal" runat="server" Text='<%# Eval("OrderNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </section>


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnUpdate" />
        </Triggers>
        <ContentTemplate>

    <section id="news">
        <div class="container">
            
            <hr/>
            <div class="row">
    <div class="col-md-8 col-md-offset-2">
        <h4 class="text-right">بياناتي</h4>
        <hr/>
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
عرض البيانات        </a>
      </h4> </div>
                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                         <table style="width: 80%" class="table table-bordered frame text-right" align="Center">
                        <tr>
                            <td>
                                <asp:Label ID="lblUsername" runat="server" Text=""></asp:Label></td>
                            <td class="">:اسم المستخدم</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPass" runat="server" Text="******"></asp:Label>
                                <%--<asp:TextBox ID="txtPass" Visible="false" class="form-control" TextMode="Password" runat="server"></asp:TextBox>--%>
                                <asp:TextBox ID="txtPassword" Visible="false" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtPassword" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td class="">:كلمة المرور </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblMail" runat="server" Text=""></asp:Label>
                                <asp:TextBox ID="txtMail" Visible="false" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtMail" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="rev" ControlToValidate="txtMail" ForeColor="Red" runat="server" ErrorMessage="عنوان بريد إلكتروني غير صحيح" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                            </td>
                            <td class="">:البريد الإلكتروني </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="lblMobile" runat="server" Text=""></asp:Label>
                                <asp:TextBox ID="txtMobile" Visible="false" TextMode="Number" required="required" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="txtMobile" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                            <td class="">:الجوال </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Button ID="btnEdite" class="btn btn-mine btn-block" OnClick="btnEdite_Click" runat="server" Text="تعديل" />
                                <asp:Button ID="btnUpdate" class="btn btn-mine btn-block" Visible="false" OnClick="btnUpdate_Click" runat="server" Text="تحديث" />
                                <%--<asp:Button ID="lbCancel" runat="server" class="btn btn-mine btn-block" CausesValidation="false" OnClick="lbCancel_Click" Visible="false" Text="إلغاء" />--%>

                                <asp:Button ID="btnCancel" runat="server" class="btn btn-mine btn-block" CausesValidation="false" OnClick="btnCancel_Click" Visible="false" Text="إلغاء" />
                            </td>
                            <td class=""> </td>
                        </tr>
                    </table>


                    </div>
                </div>
            </div>

        </div>
               </div>
                
            </div>
        </div>
    </section>
            
        </ContentTemplate>
    </asp:UpdatePanel>
    <i class="fa " aria-hidden="true"></i>
</asp:Content>
