<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admingiris.aspx.cs" Inherits="SembolEmlak.admin.admingirirs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Giriş</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="css/admingiris.css" />
    <link rel="shortcut icon" type="image/png" href="images/favicon.png" />
</head>
<body>
    <section class="container">
        <div class="container boyut">
            <form method="post" runat="server">
                <div class="container">
                    <label for="uname"><b>Kullanıcı Adı</b></label>
                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Kullanıcı Adı Giriniz"></asp:TextBox>
                    <label for="psw"><b>Şifre</b></label>
                    <asp:TextBox ID="TextBox2" runat="server" placeholder="Şifre Giriniz" TextMode="Password"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Giriş Yap" OnClick="Button1_Click" CssClass="button" />
                    <asp:Label ID="Label1" runat="server" Text="Label" CssClass="uyarı"></asp:Label>
                </div>
                <div class="container" style="background-color: #f1f1f1">
                    <a href="/index.aspx" class="link">Anasayfa'ya dön</a>
                </div>
            </form>
        </div>
    </section>
</body>
</html>
