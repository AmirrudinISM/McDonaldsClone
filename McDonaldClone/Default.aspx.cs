using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace McDonaldClone {
    public partial class Default : System.Web.UI.Page {

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connMcDonalds"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e) {
            if(Session["CustomerName"] != null) {
                lblloginName.Text = "Hello, "+Session["CustomerName"].ToString();
            }
            
        }
         
        protected void btnLogin_Click(object sender, EventArgs e) {
            SqlCommand cmd = new SqlCommand("spLoginUser", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@customerName", txtUserName.Text);
            cmd.Parameters.AddWithValue("@customerPassword", txtPassword.Text);

            try {
                conn.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read()) {
                    Session["CustomerName"] = txtUserName.Text;
                    Session["CustomerID"] = txtPassword.Text;
                    Server.Transfer("Default.aspx");

                }
                else {
                    Response.Write("User does not exist or incorrect password");
                }
            }
            catch {

            }
            finally {
                conn.Close();
            }

        }
    }
}