<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="Fruit_Ahmed_.WebForm1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Fruits</title>
    <link rel="icon" href="images/apple.png" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/normalize.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Cairo" rel="stylesheet" />
    <link href="css/lightbox.css" rel="stylesheet" />
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <section id="soctial">
       <div class="soctial-icons">
                <ul class="list-inline">
                   <li class="list-inline-item">
                                    <a href="#" target="_blank">
                                        <i class="fa twitter fa-twitter-square fa-2x" aria-hidden="true"></i>
                                    </a></li>
                                <li class="list-inline-item">
                                    <a href="#" target="_blank">
                                        <i class="fa fa-instagram fa-instagram fa-2x" aria-hidden="true"></i>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#" target="_blank">
                                        <i class="fa snapchat fa-snapchat-square fa-2x" aria-hidden="true"></i>
                                    </a>
                                </li>
                    <a href="Orders.aspx" runat="server" id="ord" visible="false">
                        <asp:Label ID="Label1" runat="server" class="list-inline-item" Text="" ForeColor="#FFC857" CssClass="fa-3x"></asp:Label>
                    </a>
                    <asp:Label ID="Label2" runat="server" Text="طلبات لم تسلم" Visible="false" ForeColor="#FFC857"></asp:Label>
                </ul>
            </div>
        </section>

        <section id="logo" style="background-color:#FFF">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-2 col-md-offset-5">
                        <a href="Home.aspx"><img src="images/logo.jpg" width="50%" alt="logo-image" /></a> 
                    </div>
                    <div class="col-md-4 col-md-offset-1">

                        <asp:LinkButton ID="lbLogout" CausesValidation="false" OnClick="lbLogout_Click" CssClass="btn btn-link" Visible="false" runat="server">تسجيل الخروج <i class="glyphicon glyphicon-log-in"></i></asp:LinkButton>

                        <asp:LinkButton ID="lbProfile" CausesValidation="false" PostBackUrl="~/Profile.aspx" CssClass="btn btn-link" Visible="false" runat="server">صفحتي الشخصية <i class="glyphicon glyphicon-user"></i></asp:LinkButton>

                        <asp:LinkButton ID="lbCart" CausesValidation="false" PostBackUrl="~/Cart.aspx" CssClass="btn btn-link" runat="server">سلة المشتريات <i class="glyphicon glyphicon-shopping-cart"></i></asp:LinkButton>
                        <a href="LogIn.aspx" id="loginn" runat="server" class="btn btn-link">تسجيل دخول <i class="glyphicon glyphicon-log-in"></i></a>
                    </div>
                </div>
            </div>
        </section>


        <section id="navbar">
            <nav class="navbar navbar-default" style="background-color:#e7e7e7">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"><span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                    </div>
                    <div class="col-md-8 col-md-offset-3">
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li><a href="Homee.aspx" id="order" runat="server" visible="false">الإدارة</a></li>
                                <li><a href="ContactUs.aspx">اتصل بنا</a></li>
                                <li><a href="news.aspx">أخبارنا</a></li>
                                <li><a href="about.aspx">قصتنا</a></li>
                                <li class="dropdown" id="sort" runat="server"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">المدينة <span class="caret"></span></a>
                                    <ul class="dropdown-menu" >
                                        <li>
                                            <asp:LinkButton ID="lnkkch" runat="server" CausesValidation="false" OnClick="lnkkch_Click">خميس مشيط</asp:LinkButton></li>
                                        <li role="separator" class="divider"></li>
                                        <li>
                                            <asp:LinkButton ID="lnkabha" runat="server" CausesValidation="false" OnClick="lnkabha_Click">أبها</asp:LinkButton></li>
                                         <li role="separator" class="divider"></li>
                                        <li>
                                            <asp:LinkButton ID="lnktaaf" runat="server" CausesValidation="false" OnClick="lnktaaf_Click">الطائف</asp:LinkButton></li>
                                    </ul>
                                </li>
                                <li><a href="Home.aspx">الرئيسية</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
        </section>

        <script type="text/javascript" src="//maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&key=AIzaSyByojT-ECrJKlKOBoya7DoVF2w4LRaN35k"></script>
        <script type="text/javascript">
            var long = 0;
            var lat = 0;
            window.onload = function () {
                var mapOptions = {
                    center: new google.maps.LatLng(24.774265, 46.738586),
                    zoom: 6,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                var infoWindow = new google.maps.InfoWindow();
                var latlngbounds = new google.maps.LatLngBounds();
                var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
                google.maps.event.addListener(map, 'click', function (e) {
                    long = e.latLng.lng();
                    lat = e.latLng.lat();
                    document.getElementById("lat").value = lat;
                    document.getElementById("lng").value = long;
                    alert("Latitude: " + lat + "\r\nLongitude: " + long);

                });
            }
        </script>

        <section id="login">

            <div class="container">
                <div class="row">
                    <div class="col-md-5 frame">
                        <h2 class="text-right">من فضلك حدد موقعك قبل تاكيد طلبك</h2>
                        <hr />
                        <div id="dvMap" style="width: 100%; height: 500px; margin-right: 0px;">
                        </div>
                        <asp:HiddenField ID="lat" runat="server" />
                        <asp:HiddenField ID="lng" runat="server" />

                    </div>

                    <div class="col-md-5 col-md-offset-2 frame">
                        <h2 class="text-right">تاكيد الطلب</h2>
                        <hr />
                        <div class="text-right">
                        <div class="form-group">
                           <label> <asp:Label runat="server" class="text-danger" ID="lblorderno" ></asp:Label>&nbsp;&nbsp;&nbsp; : رقم الطلب</label>
                            </div>
                        <div class="form-group">
                            <label><asp:Label runat="server" ID="lblusername" class="text-danger"></asp:Label></label>
                            <label>&nbsp;&nbsp;&nbsp; : اسم المستخدم</label>
                        </div>
                        <div class="form-group">
                            <label> <asp:Label runat="server" ID="lblmail" class="text-danger"></asp:Label>&nbsp;&nbsp;&nbsp; :البريد الإلكتروني</label>
                        </div>
                        <div class="form-group">
                            <label><asp:Label runat="server" ID="lbltotalprice" class="text-danger"></asp:Label></label>
                            <label>&nbsp;&nbsp;&nbsp; :المبلغ المطلوب دفعه</label>
                        </div>
                        <div class="form-group">
                            <label>
                                <asp:Label ID="lblMob" CssClass="text-danger" runat="server" Text=""></asp:Label>
                            </label>
                            <label>&nbsp;&nbsp;&nbsp; :رقم الجوال</label>
                        </div>
                              <div class="form-group">
                            <label>
                                <asp:Label ID="lblcity" CssClass="text-danger" runat="server" Text=""></asp:Label>
                            </label>
                            <label>&nbsp;&nbsp;&nbsp; :المدينة</label>
                        </div>
                  
                        <div class="form-group">
                            <label>الحي السكني <span class="text-danger"></span></label>
                            <asp:DropDownList ID="ddl" runat="server" class="form-control">
                              
                            </asp:DropDownList>
                        </div>
                                  <div class="form-group">
                            <label>
                                تاريخ التوصيل <span class="text-danger">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="**" ControlToValidate="txttime"></asp:RequiredFieldValidator></label></span>
<%--                                    <asp:TextBox runat="server" ID="txttime" TextMode="Date" placeholder="التاريخ" class="form-control" />--%>
<%--                            <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>--%>
                            <cc1:CalendarExtender ID="CalendarExtender1" TargetControlID="txttime" Format="MM-dd-yyyy" runat="server"></cc1:CalendarExtender>
                            <asp:TextBox runat="server" ID="txttime"  placeholder="التاريخ" class="form-control" />
                        </div>
                        </div>
                        <hr />
                        <p class="text-center">
                            <asp:LinkButton runat="server" ID="lnkconfirm" class="btn btn-mine btn-block" OnClick="lnkconfirm_Click">تاكيد</asp:LinkButton>
                        </p>
                        <p class="bg-success text-center"><i class="glyphicon glyphicon-ok" runat="server" visible="false" id="lblok">تم التاكيد</i></p>
                    </div>

                </div>
            </div>
        </section>

        <div class="container-fluid">
            <div class="row">
                <img src="images/bg-footer.png" alt="footer-image" width="100%" />
            </div>
        </div>



        <section id="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <h4 class="text-right">مصادر مفيدة</h4>
                        <hr />
                        <ul class="unstyled-list text-right">
                            <li><a href="ContactUs.aspx">اتصل بنا</a></li>
                            <li><a href="about.aspx">قصتنا</a></li>

                        </ul>
                    </div>
                    <div class="col-md-3 col-md-offset-1">
                        <h4 class="text-right">تواصل معنا</h4>
                        <hr />
                        <ul class="unstyled-list text-right">
                            <li>+0100 222 333</li>
                            <li>Example@yahoo.com</li>
                            <li>Address</li>
                        </ul>

                    </div>
                    <div class="col-md-3 col-md-offset-1">
                        <h4 class="text-right">قصتنا</h4>
                        <hr />
                        <p class="text-right">
                            يعتبر سوق الخضار والفواكه الوجهة المثالية لمحلات السوبرماركت لشراء منتجاتهم بالجملة في المنطقة الصناعية برأس الخور. توجه إلى سوق الخضار والفواكه وقم بمساومة الباعة للحصول على أفضل الأسعار. يضم السوق ثلاثة أجنحة تعرض نفس المنتجات تقريباً، في حين يختص الجناح الأول ببيع المنتجات بكميات صغيرة للأفراد. 
                    <a class="btn btn-link" href="about.aspx">...اقرأ المزيد
                    </a>
                        </p>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="container">
                        <div class="col-md-7 col-md-offset-1">
                            <ul class="list-inline">
                                <a href="#" target="_blank">
                                    <li class="list-inline-item"><i class="fa twitter fa-twitter-square fa-2x" aria-hidden="true"></i></li>
                                </a>
                                <a href="#" target="_blank">
                                    <li class="list-inline-item"><i class="fa google fa-google-plus-square fa-2x" aria-hidden="true"></i></li>
                                </a>
                                <a href="#" target="_blank">
                                    <li class="list-inline-item"><i class="fa facebook fa-instagram fa-2x" aria-hidden="true"></i></li>
                                </a>
                            </ul>
                        </div>
                        <div class="col-md-4">
                            <p class="par"><span style="color:#F05945">CreaDev</span> جميع حقوق الملكية محفوظة &copy; 2016 </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section id="scrolling"><a href="javascript:void(0);" id="scroll" style="display: none;">Top<span></span></a> </section>

    </form>
    <!--        scripts section-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/custom.js"></script>

</body>
</html>
