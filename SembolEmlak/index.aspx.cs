using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
namespace SembolEmlak
{
    public partial class Anasayfa : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection(WebConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            baglan.Open();
            SqlCommand getirilan = new SqlCommand("select top 8 * from tbl_emlak where silid=1 order by rand()", baglan);
            SqlDataAdapter sda = new SqlDataAdapter(getirilan);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeater2.DataSourceID = null;
            Repeater2.DataSource = dt;
            Repeater2.DataBind();
            baglan.Close();
        }
    }
}