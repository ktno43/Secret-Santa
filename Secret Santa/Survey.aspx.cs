using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Secret_Santa
{
    public partial class Survey : System.Web.UI.Page
    {
        private string g_sqlConn = ConfigurationManager.ConnectionStrings["devDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                GetInfo();
        }

        public void Connect(SqlConnection sqlConn)
        {
            if (sqlConn.State == ConnectionState.Closed)
                sqlConn.Open();
        }

        public void Disconnect(SqlConnection sqlConn)
        {
            if (sqlConn.State == ConnectionState.Open)
                sqlConn.Close();
        }

        protected void ButtonSecretSanta_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(g_sqlConn))
            {
                Connect(conn);

                try
                {
                    String sSecretID = "";
                    using (SqlCommand cmd2 = new SqlCommand(String.Format("SELECT TOP 1 ID from tblSanta WHERE ID<>{0} AND HasSecretSanta=0 ORDER BY NEWID()", Session["_CurrentID"]), conn))
                    {
                        SqlDataReader sdr = cmd2.ExecuteReader();

                        while (sdr.Read())
                        {
                            sSecretID = sdr[0].ToString();
                        }
                        sdr.Close();

                    }

                    int nSecretID = -1;

                    if (!String.IsNullOrEmpty(sSecretID))
                    {
                        nSecretID = Int32.Parse(sSecretID);
                    }



                    using (SqlCommand cmd = new SqlCommand("UPDATE tblSanta SET SecretSanta=@Name WHERE ID=@ID AND SecretSanta IS NULL", conn))
                    {
                        if (nSecretID != -1)
                        {
                            cmd.Parameters.AddWithValue("@Name", nSecretID);
                            cmd.Parameters.AddWithValue("@ID", Session["_CurrentID"]);

                            int nRowsAffected = cmd.ExecuteNonQuery();

                            if (nRowsAffected > 0)
                            {
                                using (SqlCommand cmd2 = new SqlCommand("UPDATE tblSanta SET HasSecretSanta=1 WHERE ID=@ID AND HasSecretSanta=0", conn))
                                {
                                    cmd2.Parameters.AddWithValue("@ID", nSecretID);
                                    cmd2.ExecuteNonQuery();
                                }
                            }
                        }
                    }

                }
                catch (Exception ex)
                {
                    Response.Write(String.Format("Error while executing query...{0}", ex.ToString()));
                }

                finally
                {
                    Disconnect(conn);
                }
            }

            using (SqlConnection conn = new SqlConnection(g_sqlConn))
            {
                Connect(conn);

                try
                {
                    using (SqlCommand cmd = new SqlCommand(String.Format("SELECT SecretSanta FROM tblSanta WHERE ID={0}", Session["_CurrentID"]), conn))
                    {
                        SqlDataReader sdr = cmd.ExecuteReader();

                        while (sdr.Read())
                        {
                            Session["_SecretID"] = sdr[0].ToString();
                        }
                        sdr.Close();
                    }

                    using (SqlCommand cmd = new SqlCommand(String.Format("SELECT Name,ShirtSize,FavoriteColor,FavoriteStores,Wishlist FROM tblSanta WHERE ID={0}", Session["_SecretID"]), conn))
                    {
                        SqlDataReader sdr = cmd.ExecuteReader();

                        while (sdr.Read())
                        {
                            this.TextBoxSecretSanta.Text = sdr[0].ToString();
                            this.TextBoxSecretColor.Text = sdr[1].ToString();
                            this.TextBoxSecretShirt.Text = sdr[2].ToString();
                            this.TextBoxSecretStore.Text = sdr[3].ToString();
                            this.TextBoxSecretWishlist.Text = sdr[4].ToString();
                        }
                        sdr.Close();
                    }
                }

                catch (Exception ex)
                {
                    Response.Write(String.Format("Error while executing query...{0}", ex.ToString()));
                }

                finally
                {
                    Disconnect(conn);
                }

            }

            this.LabelSecretSanta.Visible = true;
            this.TextBoxSecretSanta.Visible = true;

            this.LabelSecretColor.Visible = true;
            this.TextBoxSecretColor.Visible = true;

            this.LabelSecretShirt.Visible = true;
            this.TextBoxSecretShirt.Visible = true;

            this.LabelSecretStore.Visible = true;
            this.TextBoxSecretStore.Visible = true;

            this.LabelSecretWishlist.Visible = true;
            this.TextBoxSecretWishlist.Visible = true;
        }

        private void GetInfo()
        {
            using (SqlConnection conn = new SqlConnection(g_sqlConn))
            {
                Connect(conn);
                using (SqlCommand cmd2 = new SqlCommand(String.Format("SELECT Name,ShirtSize,FavoriteColor,FavoriteStores,Wishlist FROM tblSanta WHERE ID={0}",
                    Session["_CurrentID"]), conn))
                {
                    SqlDataReader sdr = cmd2.ExecuteReader();
                    String sFullName = "";
                    while (sdr.Read())
                    {
                        sFullName = sdr[0].ToString();
                        this.TextBoxShirt.Text = sdr[1].ToString();
                        this.TextBoxColor.Text = sdr[2].ToString();
                        this.TextBoxStores.Text = sdr[3].ToString();
                        this.TextBoxWishlist.Text = sdr[4].ToString();
                    }

                    var fullName = sFullName.Split(' ');
                    String firstName = fullName[0];
                    String lastName = fullName[1];
                    LabelFirstName.Text = firstName;
                    sdr.Close();
                }
                Disconnect(conn);
            }
        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(g_sqlConn))
            {
                Connect(conn);
                try
                {
                    using (SqlCommand cmd = new SqlCommand("UPDATE tblSanta SET ShirtSize=@Shirt, FavoriteColor=@Color,FavoriteStores=@Store,Wishlist=@Wish WHERE ID=@ID", conn))
                    {
                        cmd.Parameters.AddWithValue("@ID", Session["_CurrentID"]);
                        cmd.Parameters.AddWithValue("@Shirt", TextBoxShirt.Text);
                        cmd.Parameters.AddWithValue("@Color", TextBoxColor.Text);
                        cmd.Parameters.AddWithValue("@Store", TextBoxStores.Text);
                        cmd.Parameters.AddWithValue("@Wish", TextBoxWishlist.Text);

                        cmd.ExecuteNonQuery();
                    }
                }

                catch (Exception ex)
                {
                    Response.Write(String.Format("Error while executing query...{0}", ex.ToString()));
                }

                finally
                {
                    Disconnect(conn);
                }
            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Answers saved!')", true);
        }
    }
}