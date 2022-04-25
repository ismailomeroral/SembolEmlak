<%@ Page Language="C#" title="Admin Kontrol Panel" AutoEventWireup="true" MasterPageFile="~/SembolEmlak.Master" CodeBehind="adminkontrolpanel.aspx.cs" Inherits="SembolEmlak.admin.adminkontrolpanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/admin.css" />

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
                    <a class="navbar-brand" href="index.html">
                        <img src="images/sembollogo.png" width="200" height="50" alt="logo"></a>
                </div>

                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li class="scroll active"><a href="index.aspx">Anasayfa</a></li>
                        <li class="scroll"><a href="#about">Hakkımızda</a></li>
                        <li class="scroll"><a href="#home">İlan Ekle</a></li>
                        <li class="scroll"><a href="#menu1">Düzenle</a></li>
                        <li class="scroll"><a href="#menu2">Silinen İlanlar</a></li> 
                        <li class="scroll"><a href="#menu3">Favori ilan işlemleri</a></li>
                    </ul>
                </div>
            </div>
            <!--/.container-->
        </nav>
        <!--/nav-->
    </header>

    <!--/#hero-text-->
    <section id="about">
        <div class="container">

            <div class="section-header">
                <h2 class="section-title text-center wow fadeInDown">Hakkımızda</h2>

            </div>

            <div class="row">
                <div class="col-sm-6 wow fadeInLeft">
                    <img class="img-responsive" src="images/about.png" alt="">
                </div>

                <div class="col-sm-6 wow fadeInRight">

                    <label for="w3review">Hakkımızda Kısmını Düzenle</label>
                    <br />
                    <asp:TextBox id="txthakkimizda" TextMode="multiline"  runat="server"  Height="250" Width="600">
       </asp:TextBox>
                    <br>
                   
                    <asp:Button ID="btnhakkimizda" OnClick="btnhakkimizda_Click" runat="server" Text="Kaydet" class="btn btn-primary" />
                </div>
            </div>
        </div>
    </section>
    <!--/#about-->
    <!--/emlak-->



    <section id="home">
    <div  class="container">
         
        <div  class="section-header">
            <h3  class="section-title text-center wow fadeInDown">Yeni İlan Ekle</h3>
            <p class="text-center wow fadeInDown"></p>
        </div>
       

            <div  class="fa-border">

                <table id="customers" class="auto-style2">
                    <tr>
                        <th class="auto-style1">Bilgi</th>
                        <th>Doldur</th>

                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label1" runat="server" Text="En fazla 8 fotoğraf seç:"></asp:Label></td>
                        <td>
                            <asp:FileUpload ID="FileUpload1" class="btn btn-success btn-sm" AllowMultiple="true" runat="server" />
                        </td>

                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label2" runat="server" Text="Kapak fotoğrafını Seç:"></asp:Label></td>
                        <td>
                            <asp:FileUpload ID="FileUpload2" class="btn btn-success btn-sm" AllowMultiple="false" runat="server" /></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label14" runat="server" Text="İl"></asp:Label></td>
                        <td>

                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" AutoPostBack="True" DataTextField="sehir" DataValueField="sehir" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:baglanti %>" SelectCommand="SELECT [sehir] FROM [iller]"></asp:SqlDataSource>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label18" runat="server" Text="İlçe"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="DropDownList3" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label20" runat="server" Text="Adres"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtadres" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label3" runat="server" Text="Emlak Tipi Seçiniz"></asp:Label></td>
                        <td>
                            <asp:DropDownList class="btn btn-success dropdown-toggle" ID="DDLemlaktip" runat="server">
                                <asp:ListItem>Daire</asp:ListItem>
                                <asp:ListItem>Mustakil Ev</asp:ListItem>
                                <asp:ListItem>Dükkan</asp:ListItem>
                                <asp:ListItem>Rezidans</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label25" runat="server" Text="Satılık/Kiralık Seçiniz"></asp:Label></td>
                        <td>
                            <asp:DropDownList class="btn btn-success dropdown-toggle" ID="DropDownList1" runat="server">

                                <asp:ListItem>Satılık</asp:ListItem>
                                <asp:ListItem>Kiralık</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label19" runat="server" Text="Fiyat"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtfiyat" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label4" runat="server" Text="m²Brüt"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtmkarebrut" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label5" runat="server" Text="m²net"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtmkarenet" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label6" runat="server" Text="Oda Sayısı"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtodasayi" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label7" runat="server" Text="Salon Sayısı"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtsalonsayi" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label10" runat="server" Text="Banyo Sayisi"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtbanyosayi" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label8" runat="server" Text="Bina Yaşı"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtbinayasi" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label22" runat="server" Text="Balkon"></asp:Label></td>
                        <td>
                            <asp:DropDownList class="btn btn-success dropdown-toggle" ID="DDLbalkon" runat="server">

                                <asp:ListItem>Yok</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label9" runat="server" Text="Isıtma tipi"></asp:Label></td>
                        <td>
                            <asp:DropDownList class="btn btn-success dropdown-toggle" ID="DDLisitma" runat="server">

                                <asp:ListItem>Soba</asp:ListItem>
                                <asp:ListItem>Doğalgaz</asp:ListItem>
                                <asp:ListItem>Merkezi</asp:ListItem>
                            </asp:DropDownList></td>

                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label11" runat="server" Text="Eşya"></asp:Label></td>
                        <td>
                            <asp:DropDownList class="btn btn-success dropdown-toggle" ID="DDLesya" runat="server">
                                <asp:ListItem>Yok</asp:ListItem>
                                <asp:ListItem>Var</asp:ListItem>

                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label13" runat="server" Text="Site İçerisinde"></asp:Label></td>
                        <td>
                            <asp:DropDownList class="btn btn-success dropdown-toggle" ID="DDLsitedurum" runat="server">

                                <asp:ListItem>evet</asp:ListItem>
                                <asp:ListItem>hayır</asp:ListItem>

                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label23" runat="server" Text="Ses Yalıtım"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DDLsesyalitim" class="btn btn-success dropdown-toggle" runat="server">
                                <asp:ListItem>Yok</asp:ListItem>
                                <asp:ListItem>Var</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label24" runat="server" Text="Isı Yalıtım"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DDLisiyalitim" class="btn btn-success dropdown-toggle" runat="server">
                                <asp:ListItem>Yok</asp:ListItem>
                                <asp:ListItem>Var</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label15" runat="server" Text="Aidat"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtaidat" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label16" runat="server" Text="Diyafon"></asp:Label></td>
                        <td>
                            <asp:DropDownList class="btn btn-success dropdown-toggle" ID="DDLgoruntuluarama" runat="server">
                                <asp:ListItem>yok</asp:ListItem>
                                <asp:ListItem>Sesli Diyafon</asp:ListItem>
                                <asp:ListItem>Görüntülü Diyafon</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label17" runat="server" Text="Cephe"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DDLcephe" class="btn btn-success dropdown-toggle" runat="server">
                                <asp:ListItem>Batı</asp:ListItem>
                                <asp:ListItem>Doğu</asp:ListItem>
                                <asp:ListItem>Güney</asp:ListItem>
                                <asp:ListItem>Kuzey</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="Label21" runat="server" Text="İlan Açıklama"></asp:Label></td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txtacıklama" runat="server"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <asp:Button class="btn btn-success btn-sx center-block" ID="btnekle" runat="server" OnClick="btnekle_Click" Text="Ekle" Width="202px" /></td>
                    </tr>
                </table>
            </div>
        </div>
        </section>
    <section id="menu1"><div class="container">
            <div  class="fa-border">
                 <div class="section-header">
            <h3 class="section-title text-center wow fadeInDown">Düzenle</h3>
            <p class="text-center wow fadeInDown"></p>
        </div>
             </div>
                <br />
                <div class="container">
                    <asp:GridView ID="GridView1" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ilanid" DataSourceID="dataemlak" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand" Height="200px">
                        <AlternatingRowStyle BackColor="White" />
                          
                        <Columns>
                        
                            <asp:BoundField DataField="ilanid" HeaderText="ilanid" InsertVisible="False" ReadOnly="True" SortExpression="ilanid" />
                            <asp:BoundField DataField="kapakurl" HeaderText="kapakurl"  SortExpression="kapakurl" />
                            <asp:BoundField DataField="emlaktipi" HeaderText="emlaktipi" SortExpression="emlaktipi" />
                            <asp:BoundField DataField="ilandurum" HeaderText="ilandurum" SortExpression="ilandurum" />
                            <asp:BoundField DataField="fiyat" HeaderText="f yat" SortExpression="fiyat" />
                            <asp:CommandField SelectText="Düzenle" ShowCancelButton="False" ShowSelectButton="True" />
                        </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#48AF49" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#48AF49" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#48AF49" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#48AF49" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="dataemlak" runat="server" ConnectionString="<%$ ConnectionStrings:baglanti %>" SelectCommand="SELECT [ilanid], [kapakurl], [emlaktipi], [ilandurum], [fiyat] FROM [tbl_emlak] WHERE ([silid] = 1)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="silid" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </div>


              
                <br />
                <div class="container">
                <table id="customers1">
                    <tr>
                        <th>İsimler</th>
                        <th>Düzenle</th>
                    </tr>
                    <tr>
                        <td class="auto-style1" colspan="2">
                            <asp:Label ID="lblilansayi" runat="server" Text="seçili ilan yok"></asp:Label></td>

                    </tr>
                    <tr>
                        <td>
                            <asp:Image ID="imgdkapakfoto" runat="server" /></td>
                        <td>
                            <asp:FileUpload ID="fileuploadkapakdüzenle" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label12" runat="server" Text="İl"></asp:Label></td>
                        <td>
                            <asp:Button ID="btnilal" runat="server" Enabled="false" CssClass="btn btn-success" Text="il" />
                            <asp:DropDownList class="btn btn-success dropdown-toggle" ID="DDLdil" DataSourceID="SqlDataSource1" AutoPostBack="True" DataTextField="sehir" DataValueField="sehir" OnSelectedIndexChanged="DDLdil_SelectedIndexChanged" runat="server">
                            </asp:DropDownList>

                        </td>


                    </tr>

                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label26" runat="server" Text="İlçe"></asp:Label></td>
                        <td>
                            <asp:Button ID="btnilceal" runat="server" Enabled="false" CssClass="btn btn-success" Text="ilce" />
                            <asp:DropDownList class="btn btn-success dropdown-toggle" ID="DDLdilce" runat="server">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:baglanti %>" SelectCommand="SELECT [sehir] FROM [iller]"></asp:SqlDataSource>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label27" runat="server" Text="Adres"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtdadres" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label28" runat="server" Text="Emlak Tipini Seçiniz"></asp:Label></td>
                        <td>
                            <asp:DropDownList class="btn btn-success dropdown-toggle" ID="DDLdemlaktipi" runat="server">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label39" runat="server" Text="Satılık/Kiralık Seçiniz"></asp:Label></td>
                        <td>
                            <asp:DropDownList class="btn btn-success dropdown-toggle" ID="DDLdilandurum" runat="server">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label29" runat="server" Text="Fiyat"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtdfiyat" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label30" runat="server" Text="m²Brüt"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtdmbrut" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label31" runat="server" Text="m²net"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtmnet" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label32" runat="server" Text="Oda Sayısı"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtdodasayi" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label33" runat="server" Text="Salon Sayısı"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtdsalonsayi" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label34" runat="server" Text="Banyo Sayisi"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtdbanyosayi" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label35" runat="server" Text="Bina Yaşı"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtdbinayasi" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label36" runat="server" Text="Balkon"></asp:Label></td>
                        <td>
                            <asp:DropDownList class="btn btn-success dropdown-toggle" ID="DDLdbalkon" runat="server">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label37" runat="server" Text="Isıtma tipi"></asp:Label></td>
                        <td>
                            <asp:DropDownList class="btn btn-success dropdown-toggle" ID="DDLdisitmatipi" runat="server">
                            </asp:DropDownList></td>

                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label38" runat="server" Text="Eşya"></asp:Label></td>
                        <td>
                            <asp:DropDownList class="btn btn-success dropdown-toggle" ID="DDLdesya" runat="server">
                            </asp:DropDownList></td>
                    </tr>

                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label40" runat="server" Text="Site İçerisinde"></asp:Label></td>
                        <td>
                            <asp:DropDownList class="btn btn-success dropdown-toggle" ID="DDLdsitedurum" runat="server">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label class="radio-inline" ID="Label41" runat="server" Text="Ses Yalıtım"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DDLdsesyalitim" class="btn btn-success dropdown-toggle" runat="server">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label class="radio-inline" ID="Label42" runat="server" Text="Isı Yalıtım"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DDLdisiyalitim" class="btn btn-success dropdown-toggle" runat="server">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label43" runat="server" Text="aidat"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtdaidat" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label44" runat="server" Text="Diyafon"></asp:Label></td>
                        <td>
                            <asp:DropDownList class="btn btn-success dropdown-toggle" ID="DDLddiafon" runat="server">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label45" runat="server" Text="Cephe"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DDLdcephe" class="btn btn-success dropdown-toggle" runat="server">
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="Label46" runat="server" Text="İlan Açıklama"></asp:Label></td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txtdilanaciklama" runat="server"></asp:TextBox></td>
                    </tr>

                    <tr>

                        <td>
                            <asp:Button class="btn btn-success btn-sx center-block" ID="btnkaydet" runat="server" Text="Kaydet" PostBackUrl="~/adminkontrolpanel.aspx" OnClick="btnkaydet_Click" Width="202px" /></td>
                        <td>
                            <asp:Button class="btn btn-warning btn-sx center-block" ID="btsil" runat="server" Text="sil" OnClick="btsil_Click" Width="202px" /></td>

                    </tr>

                </table>
                    </div>
                </div></section>
    <br /><br />
    <section id="menu2"><div class="container">
        <div  class="section-header">
            <h3 class="section-title text-center wow fadeInDown">Silinen İlanlar</h3>
            <p class="text-center wow fadeInDown"></p>
        </div>
  
            <div  class="border"  >
                <asp:GridView ID="GridView2" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ilanid" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" OnRowCommand="GridView2_RowCommand" Height="200">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ilanid" HeaderText="ilanid" InsertVisible="False" ReadOnly="True" SortExpression="ilanid" />
                        <asp:BoundField DataField="kapakurl" HeaderText="kapakurl" SortExpression="kapakurl" />
                        <asp:BoundField DataField="emlaktipi" HeaderText="emlaktipi" SortExpression="emlaktipi" />
                        <asp:BoundField DataField="ilandurum" HeaderText="ilandurum" SortExpression="ilandurum" />
                        <asp:BoundField DataField="fiyat" HeaderText="fiyat" SortExpression="fiyat" />
                        <asp:CommandField SelectText="Geri Getir" ShowCancelButton="False" ShowSelectButton="True" />
                    </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#48AF49" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#48AF49" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#48AF49" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#48AF49" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:baglanti %>" SelectCommand="SELECT [ilanid], [kapakurl], [emlaktipi], [ilandurum], [fiyat] FROM [tbl_emlak] WHERE ([silid] = @silid)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="silid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div></section>
    <!--/#emlak-->
    <!--/düzenle-->

    <br />
    <br />
    <section id="menu3"><div class="conatiner">
     <div class="section-header" >
            <h3 class="section-title text-center wow fadeInDown">Favori ürünleri Düzenle</h3>
            <p class="text-center wow fadeInDown"></p>
        </div>
    
        <br />
       
    <div class="container" >
        <asp:GridView ID="GridView3" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ilanid" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" OnRowCommand="GridView3_RowCommand" Height="200">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ilanid" HeaderText="ilanid" InsertVisible="False" ReadOnly="True" SortExpression="ilanid" />
                <asp:BoundField DataField="kapakurl" HeaderText="kapakurl" SortExpression="kapakurl" />
                <asp:BoundField DataField="emlaktipi" HeaderText="emlaktipi" SortExpression="emlaktipi" />
                <asp:BoundField DataField="ilandurum" HeaderText="ilandurum" SortExpression="ilandurum" />
                <asp:BoundField DataField="fiyat" HeaderText="fiyat" SortExpression="fiyat" />
                <asp:CommandField SelectText="favoriyi sil" ShowCancelButton="False" ShowSelectButton="True" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#48AF49" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#48AF49" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#48AF49" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#48AF49" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:baglanti %>" SelectCommand="  SELECT tble.[ilanid], tble.[kapakurl], tble.[emlaktipi], tble.[ilandurum], tble.[fiyat] FROM [tbl_emlak] tble inner join [tbl_favilan] tblf on tble.ilanid=tblf.ilanid ">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="silid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <br />
        <br />
        <table id="amanb" class="auto-style5">
             <tr>
                <th class="auto-style6"><asp:DropDownList ID="DDlflilan" AutoPostBack="true" CssClass="btn-success btn-lg" runat="server" OnSelectedIndexChanged="DDlflilan_SelectedIndexChanged"></asp:DropDownList></th>
                <th class="auto-style7"> <asp:Image ID="Image1" Width="150" Height="105" runat="server" /></th>
                <th class=""><asp:TextBox ID="txtfilantip" Enabled="false" ForeColor="Green" Class="text-success" runat="server"></asp:TextBox></th>
                <th class=""> <asp:TextBox ID="txtfilandurum" Enabled="false" ForeColor="Green" Class="text-success" runat="server"></asp:TextBox></th>
                <th class=""> <asp:TextBox ID="txtffiyat" Enabled="false" ForeColor="Green" Class="text-success" runat="server"></asp:TextBox></th>
                <th class=""> <asp:TextBox ID="txtfil" Enabled="false" ForeColor="Green" Class="text-success" runat="server"></asp:TextBox></th>
                <th class=""> <asp:TextBox ID="txtfilce" Enabled="false"  ForeColor="Green" Class="text-success" runat="server"></asp:TextBox></th>
                <th class=""><asp:Button ID="btnfavoriekle" runat="server" OnClick="btnfavoriekle_Click" CssClass="btn btn-success btn-lg" Text="Favori ilan ekle" /></th>
             
            </tr>
        </table>

    </div>
        </div></section>
    <!--/#düzenle-->

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
                        <div class="contact">
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
    <br />
    <br />
    <br />
    <!--/#bottom-->
    <script>
        var modal = document.getElementById('id01');

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>

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
