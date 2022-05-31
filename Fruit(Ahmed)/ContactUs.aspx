<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Fruit_Ahmed_.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <section id="img-title">
                <div class="container-fluid">
                    <div class="row">
                        <h1 class="text-center">اتصل بنا</h1>
                    </div>
                </div>
            </section>

            <section id="contact">
                <div class="container">
                    <div class="row">
                          <div class="col-md-4 frame">
                            <h2 class="text-center">معلومات تواصل بالموقع</h2>
                              <table class="table">
                                  <tr>
                                      <td>عنوان المؤسسة</td>
                                      <td><span>: العنوان</span></td>
                                  </tr>
                                  <tr>
                                      <td>+000 000 000 000</td>
                                      <td><span>: الهاتف</span></td>
                                  </tr>
                                  <tr>
                                      <td>example@yahoo.com</td>
                                      <td><span>: الايميل</span></td>
                                  </tr>
                                  <tr>
                                       <td><ul class="list-unstyled">
                                          <li><a href="#">facebook.com</a></li>
                                          <li><a href="#">twitter.com</a></li>
                                          <li><a href="#">snapchat.com</a></li>
                                          </ul></td>
                                      <td><span>: الحسابات الالكترونية</span></td>
                                  </tr>
                              </table>
                        </div>
                        <div class="col-md-6 col-md-offset-2 frame">
                            <h2 class="text-center">اتصل بنا</h2>
                            <hr />
                            <div class="form-group">
                                <label class="text-right" for="">
                                    الاسم  <span class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="txtusername"></asp:RequiredFieldValidator></span>
                                </label>
                                <asp:TextBox ID="txtusername" runat="server" class="form-control" placeholder="الاسم "></asp:TextBox>
                            </div>
                            
                            <div class="form-group">
                                <label class="text-right" for="">
                                    <span class="text-danger">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="ايميل خاطئ!!" ControlToValidate="txtmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </span>
                                     <span class="text-danger">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtmail"></asp:RequiredFieldValidator>
                                    </span>
                                    البريد الاكتروني 
                                </label>

                                <asp:TextBox ID="txtmail" class="form-control" placeholder="البريد الاكتروني" runat="server"></asp:TextBox>
                                 </div>

                            <div class="form-group">
                                <label class="text-right" for="">
                                     الجوال 
                                     <span class="text-danger">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="txtMobile"></asp:RequiredFieldValidator>
                                    </span>
                                </label>
                                <asp:TextBox ID="txtMobile" class="form-control" placeholder="الجوال" runat="server"></asp:TextBox>
                                 </div>
                                <div class="form-group">
                                    <label for="">
                                        رسالة <span class="text-danger">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="txtmassege"></asp:RequiredFieldValidator></span></label>
                                    <asp:TextBox ID="txtmassege" runat="server" Style="resize: none" class="form-control" Rows="8" placeholder="رسالة" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                <hr />
                                <p class="text-center">
                                    <asp:LinkButton ID="lnksend" runat="server" OnClick="lnksend_Click" class="btn btn-mine btn-block">ارسال</asp:LinkButton>
                                </p>
                                <p class="bg-success text-center" id="lblsend" runat="server" visible="false">تم الارسال <i class="glyphicon glyphicon-ok"></i></p>
                           </div>
                      
                    </div>
                    </div>
            </section>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
