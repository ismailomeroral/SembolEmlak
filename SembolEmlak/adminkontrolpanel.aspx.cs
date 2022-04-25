using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SembolEmlak.admin
{
    public partial class adminkontrolpanel : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection(WebConfigurationManager.ConnectionStrings["baglanti"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            btnkaydet.Enabled = false;
            btsil.Enabled = false;
            Button1.Enabled = false;
            Button2.Enabled = false;
            if (Session["uye"] == null)
            {
                Response.Redirect("index.aspx");
            }
            else
            {
                if (Session["yetki"].ToString() != "admin")
                {
                    Response.Redirect("admingiris.aspx");
                }
            }
            if (IsPostBack == false)
            {
                string quary = "select * from tbl_emlak";
                SqlCommand komut = new SqlCommand(quary, baglan);
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(komut);
                da.Fill(dt);
                baglan.Close();
                txthakkimizda.Text = "";

                string quaryh = "select * from tbl_aciklama";
                baglan.Open();
                SqlCommand komuth = new SqlCommand(quaryh, baglan);
                DataTable dth = new DataTable();
                SqlDataAdapter dah = new SqlDataAdapter(komuth);
                dah.Fill(dth);
                txthakkimizda.Text = dth.Rows[0]["aciklama"].ToString();
                baglan.Close();
            }
            if (IsPostBack == false)
            {
                int il = 1;
                baglan.Open();
                SqlCommand oku = new SqlCommand("select * from ilceler where sehir=@sehir", baglan);
                oku.Parameters.AddWithValue("@sehir", il);
                SqlDataReader dr = oku.ExecuteReader();
                while (dr.Read())
                {
                    if (Convert.ToInt32(dr["sehir"]) == il)
                    {
                        DDLdilce.Items.Add(dr["ilce"].ToString());
                    }
                }
                baglan.Close();
            }
            if (IsPostBack == false)
            {
                DropDownList3.Items.Clear();
                int il = 1;

                baglan.Open();
                SqlCommand oku = new SqlCommand("select * from ilceler where sehir=@sehir", baglan);
                oku.Parameters.AddWithValue("@sehir", il);
                SqlDataReader dr = oku.ExecuteReader();
                while (dr.Read())
                {
                    if (Convert.ToInt32(dr["sehir"]) == il)
                    {
                        DropDownList3.Items.Add(dr["ilce"].ToString());
                    }
                }

                baglan.Close();
            }
        }
        int fotoid = 1;
        protected void btnekle_Click(Object sender, EventArgs e)
        {
            baglan.Open();
            string quary = "Insert Into tbl_emlak (kapakurl,emlaktipi,mkarebrut,mkarenet,odasayi,binayasi,isitma,banyosayi,balkon,esya,sitedurum,aidat,goruntuludiafon,fiyat,il,ilce,adres,ilanaciklama,cephe,isiyalitim,sesyalitim,ilandurum,silid,ilantarih) values " +
              " (@kapakurl,@emlaktipi,@mkarebrut,@mkarenet,@odasayi,@binayasi,@isitma,@banyosayi,@balkon,@esya,@sitedurum,@aidat,@goruntuludiafon,@fiyat,@il,@ilce,@adres,@ilanaciklama,@cephe,@isiyalitim,@sesyalitim,@ilandurum,@silid,@ilantarih)";
            SqlCommand komut = new SqlCommand(quary, baglan);
            SqlCommand okuId = new SqlCommand("select top 1 ilanid from tbl_emlak order by ilanid desc", baglan);
            SqlDataReader dr = okuId.ExecuteReader();
            if (dr.Read())
            {
                fotoid = Convert.ToInt32(dr["ilanid"]);
                fotoid++;
            }
            baglan.Close();
            baglan.Open();
            if (FileUpload1.HasFiles)
            {
                foreach (HttpPostedFile uploadedFile in FileUpload1.PostedFiles)
                {
                    string quaryfoto = "insert into tbl_fotograflar(fotoid,fotourl)values(@fotoid,@fotourl)";
                    SqlCommand komutf = new SqlCommand(quaryfoto, baglan);
                    uploadedFile.SaveAs(System.IO.Path.Combine(Server.MapPath("~/images/ilanfoto"), uploadedFile.FileName));
                    komutf.Parameters.AddWithValue("@fotourl", String.Format(uploadedFile.FileName));
                    komutf.Parameters.AddWithValue("@fotoid", fotoid);
                    komutf.ExecuteNonQuery();
                }

            }
            if (FileUpload2.HasFiles)
            {
                FileUpload2.SaveAs(System.IO.Path.Combine(Server.MapPath("~/images/kapakfoto"), FileUpload2.FileName));
            }
            string emlaktip = DDLemlaktip.SelectedItem.Text;
            int fiyat = Convert.ToInt32(txtfiyat.Text);
            string brutkare = (txtmkarebrut.Text);
            string netkare = (txtmkarenet.Text);
            string odasayi = txtodasayi.Text + " + " + txtsalonsayi.Text;
            string banyosayi = txtbanyosayi.Text;
            string balkon = DDLbalkon.SelectedItem.Text;
            string esya = DDLesya.SelectedItem.Text;
            string sitedurum = DDLsitedurum.SelectedItem.Text;
            string aidat = txtaidat.Text;
            string goruntuara = DDLgoruntuluarama.SelectedItem.Text;
            string binayas = txtbinayasi.Text;
            string isitma = DDLisitma.SelectedItem.Text;
            string cephe = DDLcephe.SelectedItem.Text;
            string ilanaciklama = txtacıklama.Text;
            string kapakurl = String.Format(FileUpload2.FileName);
            string il = DropDownList2.SelectedItem.Text;
            string ilce = DropDownList3.SelectedItem.Text;
            string adres = txtadres.Text;
            string isiyalitim = DDLisiyalitim.SelectedItem.Text;
            string sesyalitim = DDLsesyalitim.SelectedItem.Text;
            string ilandurum = DropDownList1.SelectedItem.Text;

            komut.Parameters.AddWithValue("@kapakurl", kapakurl);
            komut.Parameters.AddWithValue("@emlaktipi", emlaktip);
            komut.Parameters.AddWithValue("@mkarebrut", brutkare);
            komut.Parameters.AddWithValue("@mkarenet", netkare);
            komut.Parameters.AddWithValue("@odasayi", odasayi);
            komut.Parameters.AddWithValue("@binayasi", binayas);
            komut.Parameters.AddWithValue("@isitma", isitma);
            komut.Parameters.AddWithValue("@banyosayi", banyosayi);
            komut.Parameters.AddWithValue("@balkon", balkon);
            komut.Parameters.AddWithValue("@esya", esya);
            komut.Parameters.AddWithValue("@sitedurum", sitedurum);
            komut.Parameters.AddWithValue("@aidat", aidat);
            komut.Parameters.AddWithValue("@goruntuludiafon", goruntuara);
            komut.Parameters.AddWithValue("@fiyat", fiyat);
            komut.Parameters.AddWithValue("@il", il);
            komut.Parameters.AddWithValue("@ilce", ilce);
            komut.Parameters.AddWithValue("@adres", adres);
            komut.Parameters.AddWithValue("@ilanaciklama", ilanaciklama);
            komut.Parameters.AddWithValue("@cephe", cephe);
            komut.Parameters.AddWithValue("@isiyalitim", isiyalitim);
            komut.Parameters.AddWithValue("@sesyalitim", sesyalitim);
            komut.Parameters.AddWithValue("@ilandurum", ilandurum);
            komut.Parameters.AddWithValue("@ilantarih", DateTime.Now.ToString("dd/MM/yyyy"));
            komut.Parameters.AddWithValue("@silid", 1);
            komut.ExecuteNonQuery();
            baglan.Close();
            Response.Redirect("adminkontrolpanel.aspx");
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            ililce();
        }

        public void ililce()
        {
            DropDownList3.Items.Clear();
            int il = DropDownList2.SelectedIndex + 1;
            baglan.Open();
            SqlCommand oku = new SqlCommand("select * from ilceler where sehir=@sehir", baglan);
            oku.Parameters.AddWithValue("@sehir", il);
            SqlDataReader dr = oku.ExecuteReader();
            while (dr.Read())
            {
                if (Convert.ToInt32(dr["sehir"]) == il)
                {
                    DropDownList3.Items.Add(dr["ilce"].ToString());
                }
            }
            baglan.Close();
        }
        public void dililce()
        {
            DDLdilce.Items.Clear();
            int il = DDLdil.SelectedIndex + 1;

            baglan.Open();
            SqlCommand oku = new SqlCommand("select * from ilceler where sehir=@sehir", baglan);
            oku.Parameters.AddWithValue("@sehir", il);
            SqlDataReader dr = oku.ExecuteReader();
            while (dr.Read())
            {
                if (Convert.ToInt32(dr["sehir"]) == il)
                {
                    DDLdilce.Items.Add(dr["ilce"].ToString());
                }
            }
            baglan.Close();
            baglan.Close();
        }
        //güncelle ilan
        protected void btnkaydet_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(lblilansayi.Text);
            string quaryup = "update tbl_emlak set emlaktipi=@emlaktipi,mkarebrut=@mkarebrut,mkarenet=@mkarenet,odasayi=@odasayi,binayasi=@binayasi,isitma=@isitma" +
             ",banyosayi=@banyosayi,balkon=@balkon,esya=@esya,sitedurum=@sitedurum,aidat=@aidat,goruntuludiafon=@diafon,fiyat=@fiyat,il=@il,ilce=@ilce,adres=@adres,ilanaciklama=@ilanaciklama" +
             ",cephe=@cephe,isiyalitim=@isiyalitim,sesyalitim=@sesyalitim,ilandurum=@ilandurum,kapakurl=@kapakurl where ilanid=@ilanid";
            SqlCommand komut = new SqlCommand(quaryup, baglan);

            SqlCommand idgetir = new SqlCommand("select tblf.fotoid from tbl_fotograflar tblf inner join tbl_emlak tble on tble.ilanid=tblf.fotoid", baglan);
            DataTable dtid = new DataTable();
            SqlDataAdapter daid = new SqlDataAdapter(idgetir);
            daid.Fill(dtid);
            int fotoid = Convert.ToInt32(dtid.Rows[id][0]);

            SqlCommand komuty = new SqlCommand("select id from tbl_fotograflar where fotoid=@fotoid", baglan);
            komuty.Parameters.AddWithValue("@fotoid", fotoid);
            SqlCommand komutup = new SqlCommand("update tbl_fotograflar set fotourl=@fotourl where id=@id", baglan);
            DataTable dtf = new DataTable();
            SqlDataAdapter daf = new SqlDataAdapter(komuty);
            daf.Fill(dtf);
            if (ckbffotodüzeno.Checked == true)
            {
                for (int i = 0; i < dtf.Rows.Count; i++)
                {
                    if (i == 0)
                    {
                        komutup.Parameters.AddWithValue("@fotourl", Image1.ImageUrl.Substring(19));
                    }
                    else if (i == 1)
                    {
                        komutup.Parameters.AddWithValue("@fotourl", Image2.ImageUrl.Substring(19));
                    }
                    else if (i == 2)
                    {
                        komutup.Parameters.AddWithValue("@fotourl", Image3.ImageUrl.Substring(19));

                    }
                    else if (i == 3)
                    {
                        komutup.Parameters.AddWithValue("@fotourl", Image4.ImageUrl.Substring(19));
                    }
                    else if (i == 4)
                    {
                        komutup.Parameters.AddWithValue("@fotourl", Image5.ImageUrl.Substring(19));
                    }
                    else if (i == 5)
                    {
                        komutup.Parameters.AddWithValue("@fotourl", Image6.ImageUrl.Substring(19));
                    }
                    else if (i == 6)
                    {
                        komutup.Parameters.AddWithValue("@fotourl", Image7.ImageUrl.Substring(19));
                    }
                    else if (i == 7)
                    {
                        komutup.Parameters.AddWithValue("@fotourl", Image8.ImageUrl.Substring(19));

                    }
                }

            }
            else
            {
                for (int i = 0; i < dtf.Rows.Count; i++)
                {
                    if (i == 0 && fu1.HasFiles)
                    {
                        baglan.Open();
                        SqlCommand komutupfoto = new SqlCommand("update tbl_fotograflar set fotourl=@fotourl where id=@id", baglan);
                        fu1.SaveAs(System.IO.Path.Combine(Server.MapPath("~/images/ilanfoto"), fu1.FileName));
                        komutupfoto.Parameters.AddWithValue("@fotourl", String.Format(fu1.FileName));
                        komutupfoto.Parameters.AddWithValue("@id", dtf.Rows[i][0]);
                        Label56.Text = String.Format(fu1.FileName);
                        baglan.Close();

                    }
                    else if (i == 1 && fu2.HasFiles)
                    {
                        baglan.Open();
                        SqlCommand komutupfoto = new SqlCommand("update tbl_fotograflar set fotourl=@fotourl where id=@id", baglan);

                        fu2.SaveAs(System.IO.Path.Combine(Server.MapPath("~/images/ilanfoto"), fu2.FileName));
                        komutupfoto.Parameters.AddWithValue("@fotourl", String.Format(fu2.FileName));
                        komutupfoto.Parameters.AddWithValue("@id", dtf.Rows[i][0]);

                        baglan.Close();

       
                    }
                    else if (i == 2 && fu3.HasFiles)
                    {
                        baglan.Open();
                        SqlCommand komutupfoto = new SqlCommand("update tbl_fotograflar set fotourl=@fotourl where id=@id", baglan);

                        fu3.SaveAs(System.IO.Path.Combine(Server.MapPath("~/images/ilanfoto"), fu3.FileName));
                        komutupfoto.Parameters.AddWithValue("@fotourl", String.Format(fu3.FileName));
                        komutupfoto.Parameters.AddWithValue("@id", dtf.Rows[i][0]);

                        baglan.Close();

                    }
                    else if (i == 3 && fu4.HasFiles)
                    {
                        baglan.Open();
                        SqlCommand komutupfoto = new SqlCommand("update tbl_fotograflar set fotourl=@fotourl where id=@id", baglan);

                        fu4.SaveAs(System.IO.Path.Combine(Server.MapPath("~/images/ilanfoto"), fu4.FileName));
                        komutupfoto.Parameters.AddWithValue("@fotourl", String.Format(fu4.FileName));
                        komutupfoto.Parameters.AddWithValue("@id", dtf.Rows[i][0]);

                        baglan.Close();

                    }
                    else if (i == 4 && fu5.HasFiles)
                    {
                        baglan.Open();
                        SqlCommand komutupfoto = new SqlCommand("update tbl_fotograflar set fotourl=@fotourl where id=@id", baglan);

                        fu5.SaveAs(System.IO.Path.Combine(Server.MapPath("~/images/ilanfoto"), fu5.FileName));
                        komutupfoto.Parameters.AddWithValue("@fotourl", String.Format(fu5.FileName));
                        komutupfoto.Parameters.AddWithValue("@id", dtf.Rows[i][0]);

                        baglan.Close();

                    }
                    else if (i == 5 && fu6.HasFiles)
                    {
                        baglan.Open();
                        SqlCommand komutupfoto = new SqlCommand("update tbl_fotograflar set fotourl=@fotourl where id=@id", baglan);

                        fu6.SaveAs(System.IO.Path.Combine(Server.MapPath("~/images/ilanfoto"), fu6.FileName));
                        komutupfoto.Parameters.AddWithValue("@fotourl", String.Format(fu6.FileName));
                        komutupfoto.Parameters.AddWithValue("@id", dtf.Rows[i][0]);
                        baglan.Close();

                    }
                    else if (i == 6 && fu7.HasFiles)
                    {
                        baglan.Open();
                        SqlCommand komutupfoto = new SqlCommand("update tbl_fotograflar set fotourl=@fotourl where id=@id", baglan);

                        fu7.SaveAs(System.IO.Path.Combine(Server.MapPath("~/images/ilanfoto"), fu7.FileName));
                        komutupfoto.Parameters.AddWithValue("@fotourl", String.Format(fu7.FileName));
                        komutupfoto.Parameters.AddWithValue("@id", dtf.Rows[i][0]);
                        baglan.Close();

                    }
                    else if (i == 7 && fu8.HasFiles)
                    {
                        baglan.Open();
                        SqlCommand komutupfoto = new SqlCommand("update tbl_fotograflar set fotourl=@fotourl where id=@id", baglan);

                        fu8.SaveAs(System.IO.Path.Combine(Server.MapPath("~/images/ilanfoto"), fu8.FileName));
                        komutupfoto.Parameters.AddWithValue("@fotourl", String.Format(fu8.FileName));
                        komutupfoto.Parameters.AddWithValue("@id", dtf.Rows[i][0]);
                        baglan.Close();

                    }
                }
            }
            baglan.Open();
            komuty.Parameters.AddWithValue("@fotoid", id);
            if (ckbfotodüzenleonay.Checked == true)
            {
                komut.Parameters.AddWithValue("@kapakurl", imgdkapakfoto.ImageUrl.Substring(19));
            }
            else
            {
                fileuploadkapakdüzenle.SaveAs(System.IO.Path.Combine(Server.MapPath("~/images/kapakfoto"), fileuploadkapakdüzenle.FileName));
                komut.Parameters.AddWithValue("@kapakurl", String.Format(fileuploadkapakdüzenle.FileName));

            }
            komut.Parameters.AddWithValue("@emlaktipi", DDLdemlaktipi.SelectedValue);
            komut.Parameters.AddWithValue("@mkarebrut", txtdmbrut.Text);
            komut.Parameters.AddWithValue("@mkarenet", txtmnet.Text);
            komut.Parameters.AddWithValue("@odasayi", txtdodasayi.Text + "+" + txtdsalonsayi.Text);
            komut.Parameters.AddWithValue("@binayasi", txtdbinayasi.Text);
            komut.Parameters.AddWithValue("@isitma", DDLdisitmatipi.SelectedValue);
            komut.Parameters.AddWithValue("@banyosayi", txtdbanyosayi.Text);
            komut.Parameters.AddWithValue("@balkon", DDLdbalkon.SelectedValue);
            komut.Parameters.AddWithValue("@esya", DDLdesya.SelectedValue);
            komut.Parameters.AddWithValue("@sitedurum", DDLdsitedurum.SelectedValue);
            komut.Parameters.AddWithValue("@aidat", txtdaidat.Text);
            komut.Parameters.AddWithValue("@diafon", DDLddiafon.SelectedValue);
            komut.Parameters.AddWithValue("@fiyat", txtdfiyat.Text);
            komut.Parameters.AddWithValue("@il", DDLdil.SelectedValue);
            komut.Parameters.AddWithValue("@ilce", DDLdilce.SelectedValue);
            komut.Parameters.AddWithValue("@adres", txtdadres.Text);
            komut.Parameters.AddWithValue("@ilanaciklama", txtdilanaciklama.Text);
            komut.Parameters.AddWithValue("@cephe", DDLdcephe.SelectedValue);
            komut.Parameters.AddWithValue("@isiyalitim", DDLdisiyalitim.SelectedValue);
            komut.Parameters.AddWithValue("@sesyalitim", DDLdsesyalitim.SelectedValue);
            komut.Parameters.AddWithValue("@ilandurum", DDLdilandurum.SelectedValue);
            komut.Parameters.AddWithValue("@ilanid", id);
            komut.ExecuteNonQuery();
            baglan.Close();
            Response.Redirect("adminkontrolpanel.aspx");
        }

        protected void DDLdil_SelectedIndexChanged(object sender, EventArgs e)
        {

            dililce();


        }
        protected void btsil_Click(object sender, EventArgs e)
        {
            int ida = Convert.ToInt32(lblilansayi.Text);
            baglan.Open();
            SqlCommand komut = new SqlCommand("update tbl_emlak set silid=@silid where ilanid=@id", baglan);
            komut.Parameters.AddWithValue("@silid", 0);
            komut.Parameters.AddWithValue("@id", ida);
            komut.ExecuteNonQuery();
            baglan.Close();
            Response.Redirect("adminkontrolpanel.aspx");
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int secid = Convert.ToInt32(e.CommandArgument);
            int id = Convert.ToInt32(GridView2.Rows[secid].Cells[0].Text);
            baglan.Open();
            SqlCommand komut = new SqlCommand("update tbl_emlak set silid=@silid where ilanid=@id", baglan);
            komut.Parameters.AddWithValue("@silid", 1);
            komut.Parameters.AddWithValue("@id", id);
            komut.ExecuteNonQuery();
            baglan.Close();
            Response.Redirect("adminkontrolpanel.aspx");
        }
        protected void btnhakkimizda_Click(object sender, EventArgs e)
        {
            string quary = "update tbl_aciklama set aciklama=@aciklama where id=1";
            baglan.Open();
            SqlCommand komut = new SqlCommand(quary, baglan);
            komut.Parameters.AddWithValue("aciklama", txthakkimizda.Text);
            komut.ExecuteNonQuery();
            baglan.Close();
            Response.Redirect("adminkontrolpanel.aspx");
        }

        protected void ddlkategori_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void GridView5_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Image1.ImageUrl = "";
            Image2.ImageUrl = "";
            Image3.ImageUrl = "";
            Image4.ImageUrl = "";
            Image5.ImageUrl = "";
            Image6.ImageUrl = "";
            Image7.ImageUrl = "";
            Image8.ImageUrl = "";
            int id = Convert.ToInt32(e.CommandArgument);
            baglan.Open();
            SqlCommand komut = new SqlCommand("select * from tbl_emlak", baglan);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(komut);
            da.Fill(dt);
            DDLdemlaktipi.Items.Clear();
            int ilanid = Convert.ToInt32(GridView5.Rows[id].Cells[0].Text);
            lblilansayi.Text = id.ToString();
            imgdkapakfoto.ImageUrl = "~/images/kapakfoto/" + GridView5.Rows[id].Cells[1].Text;
            DDLdemlaktipi.Items.Add(dt.Rows[id][3].ToString());
            if (dt.Rows[id][3].ToString() == "Daire")
            {
                DDLdemlaktipi.Items.Add("Mustekil Ev");
                DDLdemlaktipi.Items.Add("Rezidans");
                DDLdemlaktipi.Items.Add("Dükkan");
            }
            else if (dt.Rows[id][3].ToString() == "Mustakil Ev")
            {
                DDLdemlaktipi.Items.Add("Daire");
                DDLdemlaktipi.Items.Add("Rezidans");
                DDLdemlaktipi.Items.Add("Dükkan");
            }
            else if (dt.Rows[id][3].ToString() == "Rezidans")
            {
                DDLdemlaktipi.Items.Add("Daire");
                DDLdemlaktipi.Items.Add("Mustakil Ev");
                DDLdemlaktipi.Items.Add("Dükkan");
            }
            else if (dt.Rows[id][3].ToString() == "Dükkan")
            {
                DDLdemlaktipi.Items.Add("Daire");
                DDLdemlaktipi.Items.Add("Rezidans");
                DDLdemlaktipi.Items.Add("Mustakil Ev");
            }
            else
            {
                DDLdemlaktipi.Items.Add("Daire");
                DDLdemlaktipi.Items.Add("Rezidans");
                DDLdemlaktipi.Items.Add("Mustakil Ev");
                DDLdemlaktipi.Items.Add("Dükkan");
            }
            txtdmbrut.Text = dt.Rows[id][4].ToString();
            txtmnet.Text = dt.Rows[id][5].ToString();
            string[] odasayi = dt.Rows[id][6].ToString().Split('+');
            txtdodasayi.Text = odasayi[0].ToString();
            txtdsalonsayi.Text = odasayi[1].ToString();
            txtdbinayasi.Text = dt.Rows[id][7].ToString();
            DDLdisitmatipi.Items.Clear();
            DDLdisitmatipi.Items.Add(dt.Rows[id][8].ToString());
            if (dt.Rows[id][8].ToString() == "Soba")
            {
                DDLdisitmatipi.Items.Add("Doğalgaz");
                DDLdisitmatipi.Items.Add("Merkezi");
            }
            else if (dt.Rows[id][8].ToString() == "Doğalgaz")
            {
                DDLdisitmatipi.Items.Add("Soba");
                DDLdisitmatipi.Items.Add("Merkezi");
            }
            else if (dt.Rows[id][8].ToString() == "Merkezi")
            {
                DDLdisitmatipi.Items.Add("Doğalgaz");
                DDLdisitmatipi.Items.Add("Soba");
            }
            else
            {
                DDLdisitmatipi.Items.Add("Doğalgaz");
                DDLdisitmatipi.Items.Add("Soba");
                DDLdisitmatipi.Items.Add("Merkezi");
            }
            txtdbanyosayi.Text = dt.Rows[id][9].ToString();
            DDLdbalkon.Items.Clear();
            DDLdbalkon.Items.Add(dt.Rows[id][10].ToString());
            if (dt.Rows[id][10].ToString() == "Yok")
            {
                DDLdbalkon.Items.Add("1");
                DDLdbalkon.Items.Add("2");
                DDLdbalkon.Items.Add("3");
                DDLdbalkon.Items.Add("4");
            }
            else if (dt.Rows[id][10].ToString() == "1")
            {
                DDLdbalkon.Items.Add("Yok");
                DDLdbalkon.Items.Add("2");
                DDLdbalkon.Items.Add("3");
                DDLdbalkon.Items.Add("4");
            }
            else if (dt.Rows[id][10].ToString() == "2")
            {
                DDLdbalkon.Items.Add("1");
                DDLdbalkon.Items.Add("Yok");
                DDLdbalkon.Items.Add("3");
                DDLdbalkon.Items.Add("4");
            }
            else if (dt.Rows[id][10].ToString() == "3")
            {
                DDLdbalkon.Items.Add("1");
                DDLdbalkon.Items.Add("2");
                DDLdbalkon.Items.Add("Yok");
                DDLdbalkon.Items.Add("4");
            }
            else if (dt.Rows[id][10].ToString() == "4")
            {
                DDLdbalkon.Items.Add("1");
                DDLdbalkon.Items.Add("2");
                DDLdbalkon.Items.Add("3");
                DDLdbalkon.Items.Add("Yok");
            }
            else
            {
                DDLdbalkon.Items.Add("Yok");
                DDLdbalkon.Items.Add("1");
                DDLdbalkon.Items.Add("2");
                DDLdbalkon.Items.Add("3");
                DDLdbalkon.Items.Add("4");
            }
            DDLdesya.Items.Clear();
            DDLdesya.Items.Add(dt.Rows[id][11].ToString());
            if (dt.Rows[id][11].ToString() == "Var")
            {
                DDLdesya.Items.Add("Yok");
            }
            else if (dt.Rows[id][11].ToString() == "Yok")
            {
                DDLdesya.Items.Add("Var");
            }

            DDLdsitedurum.Items.Clear();
            DDLdsitedurum.Items.Add(dt.Rows[id][12].ToString());
            if (dt.Rows[id][12].ToString() == "Var")
            {
                DDLdsitedurum.Items.Add("Yok");
            }
            else if (dt.Rows[id][11].ToString() == "Yok")
            {
                DDLdsitedurum.Items.Add("Var");
            }
            else
            {
                DDLdsitedurum.Items.Add("Yok");
                DDLdsitedurum.Items.Add("Var");
            }
            txtdaidat.Text = dt.Rows[id][13].ToString();
            DDLddiafon.Items.Clear();
            DDLddiafon.Items.Add(dt.Rows[id][14].ToString());
            if (dt.Rows[id][14].ToString() == "Yok")
            {
                DDLddiafon.Items.Add("Sesli Diafon");
                DDLddiafon.Items.Add("Görüntülü Diafon");
            }
            else if (dt.Rows[id][14].ToString() == "Sesli Diafon")
            {
                DDLddiafon.Items.Add("Yok");
                DDLddiafon.Items.Add("Görüntülü Diafon");
            }
            else
            {
                DDLddiafon.Items.Add("Yok");
                DDLddiafon.Items.Add("Sesli Diafon");
                DDLddiafon.Items.Add("Görüntülü Diafon");
            }
            txtdfiyat.Text = dt.Rows[id][15].ToString();

            btnilal.Text = (dt.Rows[id][16].ToString());
            btnilceal.Text = (dt.Rows[id][17].ToString());
            txtdadres.Text = dt.Rows[id][18].ToString();
            txtdilanaciklama.Text = dt.Rows[id][19].ToString();
            DDLdcephe.Items.Clear();
            DDLdcephe.Items.Add(dt.Rows[id][20].ToString());
            if (dt.Rows[id][20].ToString() == "Doğu")
            {
                DDLdcephe.Items.Add("Kuzey");
                DDLdcephe.Items.Add("Batı");
                DDLdcephe.Items.Add("Güney");
            }
            else if (dt.Rows[id][20].ToString() == "Kuzey")
            {
                DDLdcephe.Items.Add("Doğu");
                DDLdcephe.Items.Add("Batı");
                DDLdcephe.Items.Add("Güney");
            }
            else if (dt.Rows[id][20].ToString() == "Batı")
            {
                DDLdcephe.Items.Add("Doğu");
                DDLdcephe.Items.Add("Kuzey");
                DDLdcephe.Items.Add("Güney");
            }
            else if (dt.Rows[id][20].ToString() == "Güney")
            {
                DDLdcephe.Items.Add("Doğu");
                DDLdcephe.Items.Add("Batı");
                DDLdcephe.Items.Add("Kuzey");
            }
            else
            {
                DDLdcephe.Items.Add("Doğu");
                DDLdcephe.Items.Add("Batı");
                DDLdcephe.Items.Add("Kuzey");
                DDLdcephe.Items.Add("Güney");
            }
            DDLdisiyalitim.Items.Clear();
            DDLdisiyalitim.Items.Add(dt.Rows[id][21].ToString());
            if (dt.Rows[id][21].ToString() == "Yok")
            {
                DDLdsesyalitim.Items.Add("Var");
            }
            else if (dt.Rows[id][21].ToString() == "Yok")
            {
                DDLdsesyalitim.Items.Add("Yok");
            }
            else
            {
                DDLdsesyalitim.Items.Add("Yok");
                DDLdsesyalitim.Items.Add("Var");
            }

            DDLdsesyalitim.Items.Clear();
            DDLdsesyalitim.Items.Add(dt.Rows[id][22].ToString());
            if (dt.Rows[id][22].ToString() == "Var")
            {
                DDLdisiyalitim.Items.Add("Yok");
            }
            else if (dt.Rows[id][22].ToString() == "Yok")
            {
                DDLdisiyalitim.Items.Add("Var");
            }
            else
            {
                DDLdisiyalitim.Items.Add("Var");
                DDLdisiyalitim.Items.Add("Yok");
            }
            DDLdilandurum.Items.Clear();
            DDLdilandurum.Items.Add(dt.Rows[id][23].ToString());
            if (dt.Rows[id][23].ToString() == "Satılık")
            {
                DDLdilandurum.Items.Add("Kiralık");
            }
            else if (dt.Rows[id][23].ToString() == "Kiralık")
            {
                DDLdilandurum.Items.Add("Satılık");
            }
            else
            {
                DDLdilandurum.Items.Add("Kiralık");
                DDLdilandurum.Items.Add("Satılık");
            }

            komut.ExecuteNonQuery();
            baglan.Close();
            baglan.Open();
            SqlCommand komutf = new SqlCommand("select tblf.fotourl from tbl_fotograflar tblf inner join tbl_emlak tble on tblf.fotoid=tble.ilanid where ilanid=@ilanid", baglan);
            komutf.Parameters.AddWithValue("@ilanid", ilanid);
            DataTable dtf = new DataTable();
            SqlDataAdapter daf = new SqlDataAdapter(komutf);
            daf.Fill(dtf);
            for (int i = 0; i < dtf.Rows.Count; i++)
            {
                if (i == 0)
                {
                    Image1.ImageUrl = "~/images/ilanfoto/" + dtf.Rows[i]["fotourl"].ToString();
                    fu1.Enabled = true;
                }
                else if (i == 1)
                {
                    Image2.ImageUrl = "~/images/ilanfoto/" + dtf.Rows[i]["fotourl"].ToString();
                    fu2.Enabled = true;
                }
                else if (i == 2)
                {
                    Image3.ImageUrl = "~/images/ilanfoto/" + dtf.Rows[i]["fotourl"].ToString();
                    fu3.Enabled = true;
                }
                else if (i == 3)
                {
                    Image4.ImageUrl = "~/images/ilanfoto/" + dtf.Rows[i]["fotourl"].ToString();
                    fu4.Enabled = true;
                }
                else if (i == 4)
                {
                    Image5.ImageUrl = "~/images/ilanfoto/" + dtf.Rows[i]["fotourl"].ToString();
                    fu5.Enabled = true;
                }
                else if (i == 5)
                {
                    Image6.ImageUrl = "~/images/ilanfoto/" + dtf.Rows[i]["fotourl"].ToString();
                    fu6.Enabled = true;
                }
                else if (i == 6)
                {
                    Image7.ImageUrl = "~/images/ilanfoto/" + dtf.Rows[i]["fotourl"].ToString();
                    fu7.Enabled = true;
                }
                else if (i == 7)
                {
                    Image8.ImageUrl = "~/images/ilanfoto/" + dtf.Rows[i]["fotourl"].ToString();
                    fu8.Enabled = true;
                }
            }
            btnkaydet.Enabled = true;
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int secilen = Convert.ToInt32(e.CommandArgument);
            baglan.Open();
            SqlCommand komut = new SqlCommand("select * from tbl_kategori", baglan);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(komut);
            da.Fill(dt);
            int ilanid = Convert.ToInt32(GridView5.Rows[secilen].Cells[0].Text) - 1;
            Label47.Text = dt.Rows[ilanid][0].ToString();
            TextBox1.Text = dt.Rows[ilanid][1].ToString();
            baglan.Close();
            Button1.Enabled = true;
            Button2.Enabled = true;

        }
        //kategori kaydet
        protected void Button1_Click(object sender, EventArgs e)
        {
            baglan.Open();
            SqlCommand updatekat = new SqlCommand("update tbl_kategori set kategori_ad=@ad where kategori_id=@id", baglan);
            updatekat.Parameters.AddWithValue("@ad", TextBox1.Text);
            updatekat.Parameters.AddWithValue("@id", Convert.ToInt32(Label47.Text));
            updatekat.ExecuteNonQuery();
            baglan.Close();
            Response.Redirect("adminkontrolpanel.aspx");
        }
        //kategori sil
        protected void Button2_Click(object sender, EventArgs e)
        {
            baglan.Open();
            SqlCommand deletekat = new SqlCommand("delete from tbl_kategori where kategori_id=@id", baglan);
            deletekat.Parameters.AddWithValue("@id", Convert.ToInt32(Label47.Text));
            deletekat.ExecuteNonQuery();
            baglan.Close();
            Response.Redirect("adminkontrolpanel.aspx");
        }
        //kategori ekle
        protected void Button3_Click(object sender, EventArgs e)
        {
            baglan.Open();
            SqlCommand eklekat = new SqlCommand("insert into tbl_kategori (kategori_ad)values(@katad)", baglan);
            eklekat.Parameters.AddWithValue("@katad", TextBox2.Text);
            eklekat.ExecuteNonQuery();
            baglan.Close();
            Response.Redirect("adminkontrolpanel.aspx");
        }
    }
}