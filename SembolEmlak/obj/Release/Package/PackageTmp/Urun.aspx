<%@ Page Title="Ürün" Language="C#" MasterPageFile="~/SembolEmlak.Master" AutoEventWireup="true" CodeBehind="Urun.aspx.cs" Inherits="SembolEmlak.Urun" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/urun.css" />
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
                        <li class="scroll"><a href="kategori.aspx">İlanlar</a></li>
                    </ul>
                </div>
            </div>
            <!--/.container-->
        </nav>
        <!--/nav-->
    </header>
    <div class="container">
        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                <img class="resim img-responsive img-rounded" src="images/kapakfoto/<%#Eval("kapakurl") %>" />
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:baglanti %>" SelectCommand="SELECT * FROM [tbl_emlak] WHERE ([ilanid] = @fotoid)">
            <SelectParameters>
                <asp:QueryStringParameter Name="fotoid" QueryStringField="urun" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <section id="portfolio">
        <div class="section-header">
            <h2 class="section-title text-center wow fadeInDown">Fotoğraflar</h2>
        </div>
        <div class="container">
            <div class="portfolio-items">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <div class="portfolio-item ">
                            <div class="portfolio-item-inner">
                                <img class="img-responsive" style="width: 275px; height: 200px;" src="images/ilanfoto/<%#Eval("fotourl") %>" alt="" />
                                <div class="portfolio-info">
                                    <a class="preview" href="images/ilanfoto/<%#Eval("fotourl") %>" rel="prettyPhoto"><i class="fa fa-search"></i></a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:baglanti %>" SelectCommand="SELECT top 8 * FROM [tbl_fotograflar] WHERE ([fotoid] = @fotoid)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="fotoid" QueryStringField="urun" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <!--/.portfolio-item-->
            </div>
        </div>
        <!--/.container-->
    </section>
    <div id="ozellikler" class="container">
        <div class="section-header">
            <h2 class="section-title text-center wow fadeInDown">Özellikler</h2>
        </div>
        <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
            <ItemTemplate>
                <p class="aciklama container"><%#Eval("ilanaciklama") %></p>
                <table id="customers">
                    <tr>
                        <th>Özellik Adı</th>
                        <th>Özellikler</th>
                    </tr>
                    <tr>
                        <td>İlan Tarihi :</td>
                        <td><%# Eval("ilantarih")%></td>
                    </tr>
                    <tr>
                        <td>Emlak Tipi :</td>
                        <td><%#Eval("emlaktipi")%> </td>
                    </tr>
                    <tr>
                        <td>m² Brüt :</td>
                        <td><%# Eval("mkarebrut")%></td>
                    </tr>
                    <tr>
                        <td>m² Net : </td>
                        <td><%#Eval("mkarenet")%></td>
                    </tr>
                    <tr>
                        <td>Oda/Salon :</td>
                        <td><%#Eval("odasayi")%></td>
                    </tr>
                    <tr>
                        <td>Tuvalet/Banyo :</td>
                        <td><%#Eval("banyosayi")%></td>
                    </tr>
                    <tr>
                        <td>Kullanım Durumu : </td>
                        <td><%#Eval("ilandurum")%></td>
                    </tr>
                    <tr>
                        <td>Balkon : </td>
                        <td><%#Eval("balkon")%></td>
                    </tr>
                    <tr>
                        <td>Ücret :</td>
                        <td><%#Eval("fiyat")%> TL</td>
                    </tr>
                    <tr>
                        <td>Bina Yaşı :</td>
                        <td><%#Eval("binayasi")%> Yıl</td>
                    </tr>
                    <tr>
                        <td>Isıtma : </td>
                        <td><%#Eval("isitma")%></td>
                    </tr>
                    <tr>
                        <td>Eşya : </td>
                        <td><%#Eval("esya")%></td>
                    </tr>
                    <tr>
                        <td>Site İçi :</td>
                        <td><%#Eval("sitedurum")%> </td>
                    </tr>
                    <tr>
                        <td>Cephe : </td>
                        <td><%#Eval("cephe")%> Cephesi</td>
                    </tr>
                    <tr>
                        <td>Aidat :</td>
                        <td><%#Eval("aidat")%> TL</td>
                    </tr>
                    <tr>
                        <td>Diafon :</td>
                        <td><%#Eval("goruntuludiafon")%></td>
                    </tr>
                    <tr>
                        <td>Konum :</td>
                        <td><%#Eval("il")%> / <%#Eval("ilce")%></td>
                    </tr>
                    <tr>
                        <td>Açık Adres :</td>
                        <td><%#Eval("adres")%></td>
                    </tr>
                    <tr>
                        <td>Isı Yalıtımı :</td>
                        <td><%#Eval("isiyalitim")%></td>
                    </tr>
                    <tr>
                        <td>Ses Yalıtımı :</td>
                        <td><%#Eval("sesyalitim")%></td>
                    </tr>

                </table>



                </div>
            </ItemTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:baglanti %>" SelectCommand="SELECT * FROM [tbl_emlak] WHERE ([ilanid] = @urunid)">
            <SelectParameters>
                <asp:QueryStringParameter Name="urunid" QueryStringField="urun" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
    <div class="clearfix"></div>

</asp:Content>
