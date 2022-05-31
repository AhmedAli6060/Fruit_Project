<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Fruit_Ahmed_.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section id="slider">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="images/4.jpg" alt="Image" width="100%" />
                    <div class="carousel-caption"></div>
                </div>
                <div class="item">
                    <img src="images/5.jpg" alt="Image" width="100%" />
                    <div class="carousel-caption"></div>
                </div>
                <div class="item">
                    <img src="images/6.jpg" alt="Image" width="100%" />
                    <div class="carousel-caption"></div>
                </div>
            </div>
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><span class="sr-only">Previous</span> </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><span class="sr-only">Next</span> </a>
        </div>
    </section>

  
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                 <div class="row">
                <div class="col-md-4">
                    <hr />
                </div>
                <div class="col-md-4">
                    <h2 class="text-center title">تعرف علينا</h2>
                </div>
                <div class="col-md-4">
                    <hr />
                </div>
            </div>
        

                <div class="embed-responsive embed-responsive-16by9">
                    <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/4DOvcbjqsEc" frameborder="0" allowfullscreen></iframe>
                </div>
            </div>
        </div>
    </div>
    <section id="product">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <hr />
                </div>
                <div class="col-md-4">
                    <h2 class="text-center title">منتجات مدينة خميس مشيط </h2>
                </div>
                <div class="col-md-4">
                    <hr />
                </div>
            </div>

            <div class="row">
                <asp:ListView ID="lvProducts" runat="server" DataKeyNames="product_ID" DataSourceID="SqlDataSource1" >
                    <ItemTemplate>
                        <div class="col-md-3">
                            <div class="thumbnail1">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/images/frutisImages/"+Eval("image") %>' CssClass="img-responsive" alt="..." />
                                <div class="caption">
                                    <h3 class="text-center">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("productName") %>'></asp:Label></h3>
                                    <hr />
                                    <h2 class="text-center">
                                        <p class="alignContent">
                                            <p class="text-left alignContent">(ريال  (كيلو</p>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                                        </p>
                                    </h2>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FruitConnectionString5 %>" SelectCommand="SelectCity1" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

            </div>
        </div>
    </section>

      

    <section id="recomended">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <hr />
                </div>
                <div class="col-md-4">
                    <h2 class="text-center title">منتجات مدينة أبها</h2>
                </div>
                <div class="col-md-4">
                    <hr />
                </div>
            </div>
            <div class="row">
                <asp:ListView ID="lvFruits" runat="server" DataKeyNames="product_ID" DataSourceID="SqlDataSource3" >
                    <ItemTemplate>
                        <div class="col-md-3">
                            <div class="thumbnail1">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/images/frutisImages/"+Eval("image") %>' CssClass="img-responsive" alt="..." />
                                <div class="caption">
                                    <h3 class="text-center">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("productName") %>'></asp:Label></h3>
                                    <hr />
                                    <h2 class="text-center">
                                        <p class="alignContent">
                                            <p class="text-left alignContent">(ريال  (كيلو</p>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                                    </h2>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:FruitConnectionString11 %>" SelectCommand="SelectCity2" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </div>
        </div>



    </section>

    <section id="Vegs">
        <div class="container">

            <div class="row">
                <div class="col-md-4">
                    <hr />
                </div>
                <div class="col-md-4">
                    <h2 class="text-center title">منتجات مدينة الطائف</h2>
                </div>
                <div class="col-md-4">
                    <hr />
                </div>
            </div>
            <div class="row">
                <asp:ListView ID="lvVegs" runat="server" DataKeyNames="product_ID" DataSourceID="SqlDataSource2" >
                    <ItemTemplate>
                        <div class="col-md-3">
                            <div class="thumbnail1">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/images/frutisImages/"+Eval("image") %>' CssClass="img-responsive" alt="..." />
                                <div class="caption">
                                    <h3 class="text-center">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("productName") %>'></asp:Label></h3>
                                    <hr />
                                    <h2 class="text-center">
                                        <p class="alignContent">
                                            <p class="text-left alignContent">(ريال  (كيلو</p>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                                    </h2>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FruitConnectionString10 %>" SelectCommand="SelectCity3" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </div>

        </div>
    </section>


</asp:Content>
