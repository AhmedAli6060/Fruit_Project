<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="Fruit_Ahmed_.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <section id="img-title">
                <div class="container-fluid">
                    <div class="row">
                        <h1 class="text-center">الطلبات</h1>
                    </div>
                </div>
            </section>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <section class="cart" style="margin-top:70px">
          <div class="container">
              <div class="row">
                  <table style="width:70%" align="Center" class="">
                      <tr>
                          <td><asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" CssClass="btn btn-mine btn-lg" Text="بحث" /></td>
                          <td><asp:TextBox ID="txtSearch" CssClass="form-control input-lg" TextMode="Number" runat="server"></asp:TextBox></td>
                          <td class="text-center"><label>:رقم الطلب </label></td>
                      </tr>
                  </table>
                   <section id="secempty" runat="server" visible="false">
                        <p class="text-center bg-warning">
                            <p runat="server" class="bg-warning text-center" >  هذا الرقم غير موجود!! </p>
                        </p>
                    </section>
                  <div class="col-md-12">


                      <asp:GridView ID="gvCust" AutoGenerateColumns="false" 
                          OnPageIndexChanging="gvCust_PageIndexChanging" PageSize="10" AllowPaging="true"
                           DataKeyNames="order_ID" OnSelectedIndexChanged="gvCust_SelectedIndexChanged" CssClass="table table-bordered frame text-center" runat="server">
                          <Columns>

                              <asp:TemplateField HeaderText="الحالة" HeaderStyle-CssClass="text-center" HeaderStyle-Width="30%">
                                  <ItemTemplate>
                                      <asp:Label ID="lblRole" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>

                              <asp:TemplateField HeaderText="اسم العميل" HeaderStyle-CssClass="text-center" HeaderStyle-Width="53%">
                                  <ItemTemplate>
                                      <asp:LinkButton ID="lbCusName" Text='<%# Eval("userName") %>' CommandName="select" runat="server"></asp:LinkButton>
                                  </ItemTemplate>
                              </asp:TemplateField>

                              
                              <asp:TemplateField HeaderText="رقم الطلب" HeaderStyle-CssClass="text-center" HeaderStyle-Width="7%">
                                  <ItemTemplate>
                                      <asp:Label ID="lblNum" runat="server" Text='<%# Eval("OrderNo") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>
                          </Columns>
                      </asp:GridView>

                  </div>
              </div>
          </div> 
    </section>

            
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
