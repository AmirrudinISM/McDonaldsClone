using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace McDonaldClone {
    public partial class Register : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            lblStatus.Text = "";
        }

        protected void btnRegister_Click(object sender, EventArgs e) {
            string password = txtPassword.Text;
            PBKDF2Hash hash = new PBKDF2Hash(password);
            string passwordHash = hash.HashedPassword;
            bool isAdmin = false;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connMcDonalds"].ConnectionString);
            string sql = @"INSERT INTO Users VALUES (@username, @passwordhash, @role)";

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@username", txtUserName.Text);
            cmd.Parameters.AddWithValue("@passwordhash", passwordHash);
            cmd.Parameters.AddWithValue("@role", isAdmin);

            try {
                conn.Open();
                cmd.ExecuteNonQuery();
                lblStatus.Text = "Status: Data successfully saved.";
                lblStatus.CssClass = "alert alert-success";

            }
            catch (SqlException ex) {
                lblStatus.Text = ex.Message;
                lblStatus.CssClass = "alert alert-danger";
            }
            finally {
                conn.Close();
            }
        }
    }
}