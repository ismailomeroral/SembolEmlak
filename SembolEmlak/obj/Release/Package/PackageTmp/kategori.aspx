<%@ Page Title="Kategori" Language="C#" MasterPageFile="~/SembolEmlak.Master" AutoEventWireup="true" CodeBehind="kategori.aspx.cs" Inherits="SembolEmlak.kategori" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="css/kategori.css" />
    <style type="text/css">
        .auto-style1 {
            left: 3em;
            top: 117px;
            width: 16%;
        }
    </style>
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
                        <img src="images/sembollogo.png" alt="logo" width="200" height="50"></a>
                </div>
                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li class="scroll active"><a href="index.aspx">Anasayfa</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <!--/.container-->
    <!-- Filter-->
    <div>
        <div id="filter" class="">
            <div class="fiyat-araligi">
                <span>Fiyat Aralığı : </span>
                <asp:DropDownList ID="DropDownList4" runat="server" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Value="0">--Seçiniz--</asp:ListItem>
                    <asp:ListItem>500 ₺ - 1500 ₺</asp:ListItem>
                    <asp:ListItem>1500 ₺ - 3000 ₺</asp:ListItem>
                    <asp:ListItem>3000 ₺ -  8000 ₺</asp:ListItem>
                    <asp:ListItem>8000 ₺ - 15.000 ₺</asp:ListItem>
                    <asp:ListItem>15.000 ₺ - 25.000 ₺</asp:ListItem>
                    <asp:ListItem>25.000 ₺ - 50.000 ₺</asp:ListItem>
                    <asp:ListItem>50.000 ₺ - 125.000 ₺</asp:ListItem>
                    <asp:ListItem>125.000 ₺ - 200.000 ₺</asp:ListItem>
                    <asp:ListItem>200.000 ₺ - 350.000 ₺</asp:ListItem>
                    <asp:ListItem>350.000 ₺ - ∞</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="odasayi">
                <span>Oda/Salon : </span>
                <asp:DropDownList ID="DropdownList3" runat="server" DataSourceID="odasayi" AutoPostBack="True" OnSelectedIndexChanged="DropdownList3_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="lokasyonfilter">
                <span>İl</span>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Value="83">--Seçiniz--</asp:ListItem>
                    <asp:ListItem Value="1">ADANA</asp:ListItem>
                    <asp:ListItem Value="2">ADIYAMAN</asp:ListItem>
                    <asp:ListItem Value="3">AFYONKARAHİSAR</asp:ListItem>
                    <asp:ListItem Value="4">AĞRI</asp:ListItem>
                    <asp:ListItem Value="5">AMASYA</asp:ListItem>
                    <asp:ListItem Value="6">ANKARA</asp:ListItem>
                    <asp:ListItem Value="7">ANTALYA</asp:ListItem>
                    <asp:ListItem Value="8">ARTVİN</asp:ListItem>
                    <asp:ListItem Value="9">AYDIN</asp:ListItem>
                    <asp:ListItem Value="10">BALIKESİR</asp:ListItem>
                    <asp:ListItem Value="11">BİLECİK</asp:ListItem>
                    <asp:ListItem Value="12">BİNGÖL</asp:ListItem>
                    <asp:ListItem Value="13">BİTLİS</asp:ListItem>
                    <asp:ListItem Value="14">BOLU</asp:ListItem>
                    <asp:ListItem Value="15">BURDUR</asp:ListItem>
                    <asp:ListItem Value="16">BURSA</asp:ListItem>
                    <asp:ListItem Value="17">ÇANAKKALE</asp:ListItem>
                    <asp:ListItem Value="18">ÇANKIRI</asp:ListItem>
                    <asp:ListItem Value="19">ÇORUM</asp:ListItem>
                    <asp:ListItem Value="20">DENİZLİ</asp:ListItem>
                    <asp:ListItem Value="21">DİYARBAKIR</asp:ListItem>
                    <asp:ListItem Value="22">EDİRNE</asp:ListItem>
                    <asp:ListItem Value="23">ELAZIĞ</asp:ListItem>
                    <asp:ListItem Value="24">ERZİNCAN</asp:ListItem>
                    <asp:ListItem Value="25">ERZURUM</asp:ListItem>
                    <asp:ListItem Value="26">ESKİŞEHİR</asp:ListItem>
                    <asp:ListItem Value="27">GAZİANTEP</asp:ListItem>
                    <asp:ListItem Value="28">GİRESUN</asp:ListItem>
                    <asp:ListItem Value="29">GÜMÜŞHANE</asp:ListItem>
                    <asp:ListItem Value="30">HAKKARİ</asp:ListItem>
                    <asp:ListItem Value="31">HATAY</asp:ListItem>
                    <asp:ListItem Value="32">ISPARTA</asp:ListItem>
                    <asp:ListItem Value="33">MERSİN</asp:ListItem>
                    <asp:ListItem Value="34">İSTANBUL</asp:ListItem>
                    <asp:ListItem Value="35">İZMİR</asp:ListItem>
                    <asp:ListItem Value="36">KARS</asp:ListItem>
                    <asp:ListItem Value="37">KASTAMONU</asp:ListItem>
                    <asp:ListItem Value="38">KAYSERİ</asp:ListItem>
                    <asp:ListItem Value="39">KIRKLARELİ</asp:ListItem>
                    <asp:ListItem Value="40">KIRŞEHİR</asp:ListItem>
                    <asp:ListItem Value="41">KOCAELİ</asp:ListItem>
                    <asp:ListItem Value="42">KONYA</asp:ListItem>
                    <asp:ListItem Value="43">KÜTAHYA</asp:ListItem>
                    <asp:ListItem Value="44">MALATYA</asp:ListItem>
                    <asp:ListItem Value="45">MANİSA</asp:ListItem>
                    <asp:ListItem Value="46">KAHRAMANMARAS</asp:ListItem>
                    <asp:ListItem Value="47">Mardin</asp:ListItem>
                    <asp:ListItem Value="48">MUĞLA</asp:ListItem>
                    <asp:ListItem Value="49">MUŞ</asp:ListItem>
                    <asp:ListItem Value="50">NEVŞEHİR</asp:ListItem>
                    <asp:ListItem Value="51">NİĞDE</asp:ListItem>
                    <asp:ListItem Value="52">ORDU</asp:ListItem>
                    <asp:ListItem Value="53">RİZE</asp:ListItem>
                    <asp:ListItem Value="54">SAKARYA</asp:ListItem>
                    <asp:ListItem Value="55">SAMSUN</asp:ListItem>
                    <asp:ListItem Value="56">SİİRT</asp:ListItem>
                    <asp:ListItem Value="57">SİNOP</asp:ListItem>
                    <asp:ListItem Value="58">SİVAS</asp:ListItem>
                    <asp:ListItem Value="59">TEKİRDAĞ</asp:ListItem>
                    <asp:ListItem Value="60">TOKAT</asp:ListItem>
                    <asp:ListItem Value="61">TRABZON</asp:ListItem>
                    <asp:ListItem Value="62">TUNCELİ</asp:ListItem>
                    <asp:ListItem Value="63">ŞANLIURFA</asp:ListItem>
                    <asp:ListItem Value="64">UŞAK</asp:ListItem>
                    <asp:ListItem Value="65">VAN</asp:ListItem>
                    <asp:ListItem Value="66">YOZGAT</asp:ListItem>
                    <asp:ListItem Value="67">ZONGULDAK</asp:ListItem>
                    <asp:ListItem Value="68">AKSARAY</asp:ListItem>
                    <asp:ListItem Value="69">BAYBURT</asp:ListItem>
                    <asp:ListItem Value="70">KARAMAN</asp:ListItem>
                    <asp:ListItem Value="71">KIRIKKALE</asp:ListItem>
                    <asp:ListItem Value="72">BATMAN</asp:ListItem>
                    <asp:ListItem Value="73">ŞIRNAK</asp:ListItem>
                    <asp:ListItem Value="74">BARTIN</asp:ListItem>
                    <asp:ListItem Value="75">ARDAHAN</asp:ListItem>
                    <asp:ListItem Value="76">IĞDIR</asp:ListItem>
                    <asp:ListItem Value="77">YALOVA</asp:ListItem>
                    <asp:ListItem Value="78">KARABÜK</asp:ListItem>
                    <asp:ListItem Value="79">KİLİS</asp:ListItem>
                    <asp:ListItem Value="80">OSMANİYE</asp:ListItem>
                    <asp:ListItem Value="81">DÜZCE</asp:ListItem>
                </asp:DropDownList>
                <span>İlçe</span>
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="kir-sat">
                <span>Satılık/Kiralık</span>
                <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged">
                    <asp:ListItem>-- Değer Seçiniz --</asp:ListItem>
                    <asp:ListItem>Kiralik</asp:ListItem>
                    <asp:ListItem>Satilik</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <!--/nav-->
        <div id="kategorisol" class="auto-style1">
            <div class="baslik">
                <h2 class="section-title text-center wow fadeInDown" style="color: black">Kategori</h2>
            </div>
            <ul class="kategori">
                <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                        <a href="kategori.aspx?kategori=<%#Eval("kategori_ad") %>" class="buton">
                            <li><%#Eval("kategori_ad") %></li>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <div id="icerik" style="background-image: url(images/arkaplan.jpg); background-position: center; background-size: cover; background-repeat: no-repeat; background-attachment: fixed;">
            <section id="icerik2">
                <asp:Label ID="Label1" runat="server" Text="Label" Height="500px" ForeColor="Black" Font-Size="Larger"></asp:Label>
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="kategoriliste">
                    <ItemTemplate>
                        <div class="item col-lg-2 cl-md-4 cl-sm-6">
                            <a href="urun.aspx?urun=<%#Eval("ilanid") %>">
                                <img src="images/kapakfoto/<%#Eval("kapakurl") %>" class="image" />
                                <div class="bilgi">
                                    <span class="oda">Oda/Salon : <%#Eval("odasayi") %></span>
                                    <span class="banyo">Banyo : <%#Eval("banyosayi") %></span>
                                    <span class="ucret">Ücret : <%#Eval("fiyat") %> TL</span>
                                    <span class="lokasyon">Lokasyon : <%#Eval("il") %>/<%#Eval("ilce") %></span>
                                </div>
                            </a>
                            <button class="btn btn-info button" onclick="goster" type="button">Özellikler</button>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="kategoriliste" runat="server" ConnectionString="<%$ ConnectionStrings:baglanti %>" SelectCommand="SELECT * FROM [tbl_emlak] WHERE ([emlaktipi] = @emlaktipi and silid=1)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="emlaktipi" QueryStringField="kategori" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </section>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
    <script>
        function goster() {
            var goster = document.getElementById('deneme');
            goster.style.display = goster.style.display === 'block' ? 'none' : 'block';
        }
    </script>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
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
