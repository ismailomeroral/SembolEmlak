using System;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
namespace SembolEmlak
{
    public partial class kategori : System.Web.UI.Page
    {

        SqlConnection baglan = new SqlConnection(WebConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
            if (Request.QueryString["kategori"] == null)
            {
                baglan.Open();
                SqlCommand oku = new SqlCommand("select * from tbl_emlak where silid=1", baglan);
                SqlDataAdapter sda = new SqlDataAdapter(oku);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                Repeater1.DataSourceID = null;
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                baglan.Close();
            }
            if (!Page.IsPostBack)
            {
                SqlCommand okuoda = new SqlCommand("SELECT distinct[odasayi] FROM [tbl_emlak] where silid=1", baglan);

                SqlCommand okukat = new SqlCommand("SELECT * FROM [tbl_kategori]", baglan);
                baglan.Open();
                SqlDataAdapter sdak = new SqlDataAdapter(okukat);
                DataTable dtk = new DataTable();
                sdak.Fill(dtk);
                Repeater2.DataSourceID = null;
                Repeater2.DataSource = dtk;
                Repeater2.DataBind();

                SqlDataAdapter sda = new SqlDataAdapter(okuoda);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                DropdownList3.DataTextField = "odasayi";
                DropdownList3.DataValueField = "odasayi";
                DropdownList3.DataSourceID = null;
                DropdownList3.DataSource = dt;
                DropdownList3.DataBind();
                baglan.Close();
                DropdownList3.Items.Insert(0, new ListItem("--Seçiniz--", "0"));


            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList2.Items.Clear();
            int il = Convert.ToInt32(DropDownList1.SelectedIndex + 2);
            string ill = DropDownList1.SelectedItem.Text;

            baglan.Open();
            SqlCommand oku = new SqlCommand("select * from ilceler where sehir=@sehir", baglan);
            oku.Parameters.AddWithValue("@sehir", il);
            SqlDataReader dr = oku.ExecuteReader();
            while (dr.Read())
            {
                if (Convert.ToInt32(dr["sehir"]) == il)
                {
                    DropDownList2.Items.Add(dr["ilce"].ToString());
                }
            }
            baglan.Close();

            baglan.Open();
            SqlCommand filtreil = new SqlCommand("select * from tbl_emlak where il=@il and silid=1", baglan);
            filtreil.Parameters.AddWithValue("@il", ill);
            SqlDataAdapter sda = new SqlDataAdapter(filtreil);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSourceID = null;
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            if (dt.Rows.Count == 0)
            {
                Label1.Visible = true;
                Label1.Text = "Aradığınız Değerde İlan Bulunamadı !";
            }
            DropDownList2.Items.Insert(0, new ListItem("--Seçiniz--", "0"));
            baglan.Close();

        }
        public static string[] fiyatsec(int secilenfiyat, string[] fiyat)
        {
            if (secilenfiyat == 0)
            {
                fiyat[0] = "500";
                fiyat[1] = "1499";
            }
            else if (secilenfiyat == 1)
            {
                fiyat[0] = "1500";
                fiyat[1] = "2999";
            }
            else if (secilenfiyat == 2)
            {
                fiyat[0] = "3000";
                fiyat[1] = "7999";
            }
            else if (secilenfiyat == 3)
            {
                fiyat[0] = "8000";
                fiyat[1] = "1499";
            }
            else if (secilenfiyat == 4)
            {
                fiyat[0] = "15000";
                fiyat[1] = "24999";
            }
            else if (secilenfiyat == 5)
            {
                fiyat[0] = "25000";
                fiyat[1] = "49999";
            }
            else if (secilenfiyat == 6)
            {
                fiyat[0] = "50000";
                fiyat[1] = "124999";
            }
            else if (secilenfiyat == 7)
            {
                fiyat[0] = "125000";
                fiyat[1] = "199999";
            }
            else if (secilenfiyat == 8)
            {
                fiyat[0] = "200000";
                fiyat[1] = "349999";
            }
            else if (secilenfiyat == 9)
            {
                fiyat[0] = "350000";
                fiyat[1] = "100000000";
            }
            return fiyat;
        }
        //fiyat
        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            int secilenfiyat = DropDownList4.SelectedIndex;
            string[] fiyat = new string[2];
            fiyatsec(secilenfiyat, fiyat);
            baglan.Open();
            SqlCommand filtrele = new SqlCommand("select * from tbl_emlak where fiyat between @deger1 and @deger2 and silid=1", baglan);
            filtrele.Parameters.AddWithValue("@deger1", fiyat[0]);
            filtrele.Parameters.AddWithValue("@deger2", fiyat[1]);
            SqlDataAdapter sda = new SqlDataAdapter(filtrele);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSourceID = null;
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            if (dt.Rows.Count == 0)
            {
                Label1.Visible = true;
                Label1.Text = "Aradığınız Değerde İlan Bulunamadı !";
            }
            baglan.Close();
        }

        //oda salon
        protected void DropdownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            string oda = DropdownList3.SelectedItem.Text;
            baglan.Open();
            SqlCommand filtreleoda = new SqlCommand("select * from tbl_emlak where odasayi=@odasayi and silid=1", baglan);
            filtreleoda.Parameters.AddWithValue("@odasayi", oda);
            SqlDataAdapter sda = new SqlDataAdapter(filtreleoda);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSourceID = null;
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            if (dt.Rows.Count == 0)
            {
                Label1.Visible = true;
                Label1.Text = "Aradığınız Değerde İlan Bulunamadı !";
            }
            baglan.Close();
        }

        protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {
            string satkir = DropDownList5.SelectedItem.Text;
            baglan.Open();
            SqlCommand filtrelsatkir = new SqlCommand("select * from tbl_emlak where ilandurum=@satkir and silid=1", baglan);
            filtrelsatkir.Parameters.AddWithValue("@satkir", satkir);
            SqlDataAdapter sda = new SqlDataAdapter(filtrelsatkir);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSourceID = null;
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            if (dt.Rows.Count == 0)
            {
                Label1.Visible = true;
                Label1.Text = "Aradığınız Değerde İlan Bulunamadı !";
            }
            baglan.Close();
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ilce = DropDownList2.SelectedItem.Text;
            baglan.Open();
            SqlCommand filtreilce = new SqlCommand("select * from tbl_emlak where ilce=@ilce and silid=1", baglan);
            filtreilce.Parameters.AddWithValue("@ilce", ilce);
            SqlDataAdapter sda = new SqlDataAdapter(filtreilce);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater1.DataSourceID = null;
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

            if (dt.Rows.Count == 0)
            {
                Label1.Visible = true;
                Label1.Text = "Aradığınız Değerde İlan Bulunamadı !";
            }
            baglan.Close();
        }

    }
}