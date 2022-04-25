<%@ Page Title="Anasayfa" Language="C#" MasterPageFile="~/SembolEmlak.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SembolEmlak.Anasayfa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header id="header">
        <nav id="main-nav" class="navbar navbar-default navbar-fixed-top" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.aspx">
                        <img src="images/sembollogo.png" width="200" height="50" alt="logo"></a>
                </div>
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li class="scroll active"><a href="index.aspx">Anasayfa</a></li>
                        <li class="scroll"><a href="#about">Hakkımızda</a></li>
                        <li class="scroll"><a href="#our-team">Hizmetlerimiz</a></li>
                        <li class="scroll"><a href="#contact">İletişim</a></li>
                        <li class="scroll"><a href="kategori.aspx">İlanlar</a></li>
                    </ul>
                </div>
            </div>
            <!--/.container-->
        </nav>
        <!--/nav-->
    </header>
    <section id="main-slider">
        <div class="owl-carousel">
            <div class="item" style="background-image: url(images/slider/slider1.jpg);">
                <div class="slider-inner">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.item-->
            <div class="item" style="background-image: url(images/slider/slider2.jpg);">
                <div class="slider-inner">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.item-->
            <!--/.item-->
            <div class="item" style="background-image: url(images/slider/slider3.jpg);">
                <div class="slider-inner">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.item-->
            <div class="item" style="background-image: url(images/slider/slider4.jpg);">
                <div class="slider-inner">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/.item-->
        </div>
        <!--/.owl-carousel-->
    </section>
    <!--/#main-slider-->
    <section id="hero-text" class="wow fadeIn">
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <h2>Modern Mimari, Yenilik ve Mükemmellik</h2>
                    <p>
                        Buraya Bir Şeyler Yazınız ... 
                       Buraya Bir Şeyler Yazınız ... 
                       Buraya Bir Şeyler Yazınız ... 
                       Buraya Bir Şeyler Yazınız ...  
                       Buraya Bir Şeyler Yazınız ... 
                       Buraya Bir Şeyler Yazınız ... 
                       Buraya Bir Şeyler Yazınız ... 
                       Buraya Bir Şeyler Yazınız ...  
                    </p>
                </div>
                <div class="col-sm-3 text-right">
                    <a class="btn btn-primary btn-lg" href="#portfolio">Galeri</a>
                </div>
            </div>
        </div>
    </section>
    <!--/#hero-text-->
    <section id="about">
        <div class="container">

            <div class="section-header">
                <h2 class="section-title text-center wow fadeInDown"></h2>
            </div>

            <div class="row">
                <div class="col-sm-6 wow fadeInLeft">
                    <img class="img-responsive" src="images/about.png" alt="">
                </div>

                <div class="col-sm-6 wow fadeInRight">
                    <h3 class="column-title">Hakkımızda</h3>
                    <p>
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <%#Eval("aciklama") %>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:baglanti%>" SelectCommand="SELECT * FROM [tbl_aciklama]"></asp:SqlDataSource>

                    </p>
                </div>
            </div>
        </div>
    </section>
    <!--/#about-->
    <section id="portfolio">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title text-center wow fadeInDown">Galeri</h2>
                <p class="text-center wow fadeInDown"></p>
            </div>
            <div class="text-center">
                <ul class="portfolio-filter">
                    <li><a class="active" href="#" data-filter="*">Tümü</a></li>
                    <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <li><a href="#" data-filter=".<%#Eval("kategori_ad") %>"><%#Eval("kategori_ad") %></a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:baglanti%>" SelectCommand="SELECT * FROM [tbl_kategori]"></asp:SqlDataSource>
                </ul>
                <!--/#portfolio-filter-->
            </div>
            <div class="portfolio-items">
                <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                        <div class="portfolio-item <%#Eval("emlaktipi") %>">
                            <div class="portfolio-item-inner">
                                <img class="img-responsive" style="width: 275px; height: 200px;" src="images/portfolio/<%#Eval("kapakurl")%>" alt="Fotoğraf Görüntülenemedi">
                                <div class="portfolio-info">
                                    <a class="preview" href="images/portfolio/<%#Eval("kapakurl")%>" rel="prettyPhoto"><i class="fa fa-search"></i></a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="section-header">
            <h3 class="section-title text-center wow fadeInDown"><a href="kategori.aspx" class="btn btn-success">Diğer İlanlar</a></h3>
            <p class="text-center wow fadeInDown"></p>
        </div>
        <!--/.container-->
    </section>
    <!--/#portfolio-->
    <section id="our-team">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title text-center wow fadeInDown">Diğer Hizmetlerimiz</h2>
                <p class="text-center wow fadeInDown">
                    Sembol emlak olarak sizlere sunduğumuz diğer hizmetlerimiz.<br />
                </p>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-6 container">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="0ms">
                        <div class="team-img">
                            <img class="img-responsive" src="images/team/01.jpg" alt="">
                        </div>
                        <div class="team-info">
                            <h3>Temel Su İzalasyonu</h3>
                            <a href="#contact-us" class="btn btn-primary" name="temelsuizo">İletişim</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="100ms">
                        <div class="team-img">
                            <img class="img-responsive" src="images/team/02.jpg" alt="">
                        </div>
                        <div class="team-info">
                            <h3>Teras Enjeksiyon</h3>
                            <a href="#contact-us" class="btn btn-primary" name="terasenjeksiyon">İletişim</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="200ms">
                        <div class="team-img">
                            <img class="img-responsive" src="images/team/03.jpg" alt="">
                        </div>
                        <div class="team-info">
                            <h3>Negatif Pozitif İzolasyon</h3>
                            <a href="#contact-us" class="btn btn-primary" name="megatifpozitigizo">İletişim</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="300ms">
                        <div class="team-img">
                            <img class="img-responsive" src="images/team/04.jpg" alt="">
                        </div>
                        <div class="team-info">
                            <h3>İnşaat Tadilat</h3>
                            <a href="#contact-us" class="btn btn-primary" name="insaattadilat">İletişim</a>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-md-3 col-sm-6">
                <div class="team-member wow fadeInUp" data-wow-duration="400ms" data-wow-delay="0ms">
                    <div class="team-img">
                        <img class="img-responsive" src="images/team/01.jpg" alt="">
                    </div>
                    <div class="team-info">
                        <h3>Dekorasyon</h3>
                        <a href="#contact-us" class="btn btn-primary" name="dekorasyon">İletişim</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#our-team-->
    <section id="contact-us">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title text-center wow fadeInDown">İletişim Bilgileri</h2>
            </div>
        </div>
    </section>
    <section id="contact">
        <div class="container-wrapper">
            <div class="container contact-info">
                <div class="row">
                    <div class="col-sm-4 col-md-4">
                        <div class="contact-form">
                            <address>
                                <strong>Pendik/İstanbul</strong><br>
                                Cd 32 A, 34899<br>
                                Çamçeşme, Kemalpaşa<br>
                                <abbr title="Telefon">Telefon No:</abbr>
                                (+90) 216 396 26 58 
                            </address>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="location">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title text-center wow fadeInDown">Konum</h2>
            </div>
        </div>
    </section>
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3016.8768747303116!2d29.267001715409915!3d40.87457617931455!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x8b5016976eee08ef!2sSembol%20Emlak!5e0!3m2!1str!2str!4v1610459375515!5m2!1str!2str"
        width="100%" height="500px" tabindex="0"></iframe>
    <!--/#bottom-->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="https://maps.google.com/maps/api/js?sensor=true"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/mousescroll.js"></script>
    <script src="js/smoothscroll.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/jquery.inview.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="contact/jqBootstrapValidation.js"></script>
    <script src="contact/contact_me.js"></script>
    <script src="js/contact.js"></script>
    <script src="js/custom-scripts.js"></script>
</asp:Content>
