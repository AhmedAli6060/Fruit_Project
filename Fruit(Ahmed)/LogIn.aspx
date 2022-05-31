<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="Fruit_Ahmed_.LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <section id="img-title">
        <div class="container-fluid">
            <div class="row">
                <h1 class="text-center">تسجيل دخول</h1>
            </div>
        </div>
    </section>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <section id="login">

                <div class="container">
                    <div class="row">
                        <div class="col-md-5 frame">

                            <h2 class="text-center">تسجيل دخول</h2>
                            <hr />
                            <div class="form-group">
                                <label>
                                    اسم المستخدم <span class="text-danger" runat="server" id="Spn1">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ValidationGroup="LogIn" ControlToValidate="txtboxName" Display="Dynamic"></asp:RequiredFieldValidator></span>
                                </label>
                                <asp:TextBox runat="server" ID="txtboxName" type="text" placeholder="اسم المستخدم" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label>
                                    كلمة المرور  <span class="text-danger" runat="server" id="spn2">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="txtboxpass" ValidationGroup="LogIn"></asp:RequiredFieldValidator></span></label>
                                <asp:TextBox runat="server" ID="txtboxpass" type="password" placeholder="كلمة المرور" class="form-control" />
                            </div>
                            <hr />
                            <p class="text-center">
                                <asp:Button runat="server" ID="btnLogIn" class="btn btn-mine btn-block" type="button" Text="تسجيل الدخول" OnClick="btnLogIn_Click " ValidationGroup="LogIn" />
                            </p>
                            <p runat="server" id="pnlLog" visible="false" class="bg-danger text-center">
                                <i class="glyphicon glyphicon-info-sign"></i>
                                <asp:Label ID="lblError" runat="server" Text="كلمة مرور خاطئة او اسم المستخدم"></asp:Label>
                            </p>


                        </div>

                        <div class="col-md-5 col-md-offset-2 frame">
                            <h2 class="text-center">حساب جديد</h2>
                            <hr />
                            <div class="form-group">
                                <label>
                                    <span class="text-danger">
                                        <asp:Label ID="lblName" runat="server" Visible="false" Text="هذا الإسم تم إستخدامه سابقا!"></asp:Label></span>
                                    اسم المستخدم <span class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="txtboxName2" ValidationGroup="Register" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </span>
                                    </span>
                                </label>
                                <asp:TextBox runat="server" ID="txtboxName2" type="text" placeholder="اسم المستخدم" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label>
                                    <span class="text-danger">
                                        <asp:Label ID="lblEmail" runat="server" Visible="false" Text=" "></asp:Label></span>
                                    البريد الإلكترونى   
                                    <span class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtboxEmail" ValidationGroup="Register" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </span>

                                </label>
                                <asp:TextBox runat="server" ID="txtboxEmail" type="email" placeholder="البريد الإلكترونى" class="form-control" />
                            </div>

                            <div class="form-group">
                                <label>
                                    كلمة المرور<span class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtboxPass2" ValidationGroup="Register" Display="Dynamic"></asp:RequiredFieldValidator></span>

                                </label>
                                <asp:TextBox runat="server" ID="txtboxPass2" type="password" placeholder="كلمة المرور" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label>
                                    <span class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtboxConfirm" ValidationGroup="Register" Display="Dynamic"></asp:RequiredFieldValidator><asp:CompareValidator ValidationGroup="Register" ID="CompareValidator1" runat="server" ErrorMessage="كلمتى المرور غير متطابقتين" ControlToCompare="txtboxPass2" ControlToValidate="txtboxConfirm" Display="Dynamic"></asp:CompareValidator></span>
                                    تأكيد كلمة المرور
                                </label>
                                <asp:TextBox runat="server" ID="txtboxConfirm" type="password" placeholder="كلمة المرور" class="form-control" />
                            </div>
                            <div class="form-group">
                                <label>
                                    رقم الجوال<span class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtmob" ValidationGroup="Register" Display="Dynamic"></asp:RequiredFieldValidator></span>
                                </label>
                                <asp:TextBox runat="server" ID="txtmob" placeholder="رقم الجوال" class="form-control" />
                            </div>
                            <hr />
                            <p class="text-center">
                                <asp:Button runat="server" ID="btnCreate" class="btn btn-mine btn-block" type="button" Text="إنشاء" OnClick="btnCreate_Click" ValidationGroup="Register" />
                            </p>
                            <p runat="server" visible="false" id="pnlSuccess" class="bg-success text-center">
                                <i class="glyphicon glyphicon-ok"></i>
                                <asp:Label ID="lblSuccess" runat="server" Text="تم إنشاء حساب بنجاح"> </asp:Label>
                            </p>
                        </div>

                    </div>
                </div>
            </section>


        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
