<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admingiris.aspx.cs" Inherits="SembolEmlak.admin.admingirirs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Giriş</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: seagreen;
        }

        form {
            border: 3px solid #f1f1f1;
            background-color: whitesmoke;
            margin-top: 150px;
            box-shadow: #084824 10px 10px 10px 10px;
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        Button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

            Button:hover {
                opacity: 0.8;
            }

        .cancelbtn {
            width: auto;
            padding: 10px 18px;
            background-color: #f44336;
        }

        .imgcontainer {
            text-align: center;
            margin: 24px 0 12px 0;
        }

        img.avatar {
            width: 40%;
            border-radius: 50%;
        }

        .container {
            padding: 16px;
        }

        span.psw {
            float: right;
            padding-top: 16px;
        }

        /* Change styles for span and cancel button on extra small screens */
        @media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }

            .cancelbtn {
                width: 100%;
            }
        }
    </style>
    <link rel="shortcut icon" type="image/png" href="images/favicon.png" />
</head>
<body>

    <section class="container">

        <div class="container">
            <form method="post" runat="server">


                <div class="container">
                    <label for="uname"><b>Kullanıcı Adı</b></label>
                    <asp:TextBox ID="TextBox1" runat="server" placeholder="KullanıcıAdı Giriniz"></asp:TextBox>
                    <label for="psw"><b>Şifre</b></label>
                    <asp:TextBox ID="TextBox2" runat="server" placeholder="Şifre Giriniz"></asp:TextBox>

                    <asp:Button ID="Button1" runat="server" Text="Giriş Yap" OnClick="Button1_Click" />

                </div>

                <div class="container" style="background-color: #f1f1f1">
                    <a href="/index.aspx">Anasayfa'ya dön</a>

                </div>
            </form>

        </div>
    </section>
</body>
</html>
