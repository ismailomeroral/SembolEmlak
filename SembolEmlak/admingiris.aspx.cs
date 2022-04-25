using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace SembolEmlak.admin
{
    public partial class admingirirs : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection(WebConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Visible = false;
            baglan.Open();
            SqlCommand oku = new SqlCommand("select * from tbl_admin where kulad=@k and sifre=@p", baglan);
            oku.Parameters.AddWithValue("@k", TextBox1.Text);
            oku.Parameters.AddWithValue("@p", TextBox2.Text);
            SqlDataReader dr = oku.ExecuteReader();
            if (dr.Read() == true)
            {
                Session["uye"] = dr[0].ToString();
                Session["kadi"] = dr[1].ToString();
                Session["yetki"] = dr[3].ToString();
                Response.Redirect("adminkontrolpanel.aspx");
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "Kullanıcı adı veya parola yanlış";
            }
            baglan.Close();

        }
    }
}