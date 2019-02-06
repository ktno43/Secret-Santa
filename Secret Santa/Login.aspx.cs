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
    public partial class Login : System.Web.UI.Page
    {
        private string g_sqlConn = ConfigurationManager.ConnectionStrings["devDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void ButtonModalSignUp_Click(object sender, EventArgs e)
        {
            if (TextBoxModalUser.Text.Length == 0 || TextBoxModalPass.Text.Length == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                    "alertMessage",
                    "alert('You didn't enter a username or password...');", true);
            }

            else if (TextBoxModalFirst.Text.Length == 0 || TextBoxModalLast.Text.Length == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                    "alertMessage",
                    "alert('You didn't enter your name?!?!');", true);
            }

            else
            {
                using (SqlConnection conn = new SqlConnection(g_sqlConn))
                {
                    Connect(conn);
                    using (SqlCommand cmd = new SqlCommand("insert into tblSanta(Username,Password,Name,HasSecretSanta) values(@Username, @Password, @Name,@HasSanta)", conn))
                    {
                        try
                        {
                            String sFullName = TextBoxModalFirst.Text + " " + TextBoxModalLast.Text;
                            cmd.Parameters.AddWithValue("@Username", TextBoxModalUser.Text);
                            cmd.Parameters.AddWithValue("@Password", TextBoxModalPass.Text);
                            cmd.Parameters.AddWithValue("@Name", sFullName);
                            cmd.Parameters.AddWithValue("@HasSanta", 0);

                            cmd.ExecuteNonQuery();

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
                }
            }
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            LabelLoginMsg.Visible = true;

            if (Authenticate(TextBoxUser.Text, TextBoxPass.Text))
            {
                Response.Redirect("Survey.aspx");
            }

            else
            {
                LabelLoginMsg.ForeColor = System.Drawing.Color.Red;
                LabelLoginMsg.Font.Bold = true;
            }
        }

        private bool Authenticate(String sUserName, String sPassword)
        {
            bool bAuthenticate = false;

            using (SqlConnection conn = new SqlConnection(g_sqlConn))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(String.Format("SELECT ID, Username, Password from tblSanta WHERE Username='{0}'", sUserName), conn))
                {
                    DataSet ds = new DataSet();
                    sda.Fill(ds, "tblSanta");

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        if (sPassword == ds.Tables[0].Rows[0]["Password"].ToString())
                        {
                            bAuthenticate = true;
                            Session["_CurrentID"] = ds.Tables[0].Rows[0]["ID"].ToString();
                        }

                        else
                        {
                            LabelLoginMsg.Text = "Incorrect password";
                            bAuthenticate = false;
                        }
                    }

                    else
                    {
                        LabelLoginMsg.Text = "User does not exist";
                        bAuthenticate = false;
                    }
                }
            }

            return bAuthenticate;
        }
    }
}