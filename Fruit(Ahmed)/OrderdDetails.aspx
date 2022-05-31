<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="OrderdDetails.aspx.cs" Inherits="Fruit_Ahmed_.OrderdDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript" src="//maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&key=AIzaSyByojT-ECrJKlKOBoya7DoVF2w4LRaN35k"></script>
    <script type="text/javascript">
        var markers = [
                 <asp:Repeater ID="rptMarkers" runat="server">
                 <ItemTemplate>
                                {
                                        
                                    "lat": '<%# Eval("lati") %>',
                                     "lng": '<%# Eval("longi") %>'
                                        
                                 }
                    </ItemTemplate>
            <SeparatorTemplate>
                        ,
                    </SeparatorTemplate>
            </asp:Repeater>
         ];
                 
    </script>


    <script type="text/javascript">
        window.onload = function () {
            var mapOptions = {
                center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
                zoom: 10,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var infoWindow = new google.maps.InfoWindow();
            var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
            for (i = 0; i < markers.length; i++) {
                var data = markers[i]
                var myLatlng = new google.maps.LatLng(data.lat, data.lng);
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                    title: data.title
                });
                (function (marker, data) {
                    google.maps.event.addListener(marker, "click", function (e) {
                        infoWindow.setContent(data.description);
                        infoWindow.open(map, marker);
                    });
                })(marker, data);
            }
        }
    </script>

        <section id="img-title">
            <div class="container-fluid">
                <div class="row">
                    <h1 class="text-center">الطلبات</h1>
                </div>
            </div>
        </section>

    <section class="cart">
        <div class="container">
            <div class="row ">
                
                <div class="col-md-6 col-sm-12 col-xs-12">
                    <table style="width: 50%" class="table table-bordered frame text-right" align="Center">
                        <tr>
                            <td>
                                <asp:Label ID="lblNum" runat="server" Text=""></asp:Label></td>
                            <td>:رقم الطلب </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblName" runat="server" Text=""></asp:Label></td>
                            <td class="">:اسم العميل</td>
                        </tr>
                         <tr>
                            <td>
                                <asp:Label ID="lblcity" runat="server" Text=""></asp:Label></td>
                            <td class="">:المدينة </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAddres" runat="server" Text=""></asp:Label></td>
                            <td class="">:الحى السكنى </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="lblMobile" runat="server" Text=""></asp:Label></td>
                            <td class="">:الجوال </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="lblTotalprice" runat="server" Text=""></asp:Label></td>
                            <td class="">:السعر الكلي </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:Label ID="lblDate" runat="server" Text=""></asp:Label></td>
                            <td class="">:تاريخ التوصيل </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:LinkButton ID="lbStatus" runat="server" OnClick="lbStatus_Click"></asp:LinkButton></td>
                            <td class="">:الحالة </td>
                        </tr>
                    </table>
                </div>

                <div class="col-md-6 col-sm-12 col-xs-12 frame">
                    
                    <h3 class="text-center">العنوان</h3>
                    <div id="dvMap" style="width: 100%; height: 500px;margin-bottom:50px">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="container">
        <div class="row">

             <div class="col-md-12">

                    <asp:GridView ID="GridView1" runat="server" class="table table-bordered frame" AutoGenerateColumns="false" DataKeyNames="Order_ComponentID">
                        <Columns>
                            <asp:TemplateField HeaderText="الكمية" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lblquantity" runat="server" Text='<%# Eval ("quantity") %>'>></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="المنتجات المطلوبة" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lblProductt" runat="server" Text='<%# Eval ("productName") %>'>></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>


                        </Columns>
                    </asp:GridView>

                </div>

        </div>
    </div>

</asp:Content>
