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
    public partial class Login : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void btnLogin_Click(object sender, EventArgs e) {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connMcDonalds"].ConnectionString);
            string sql = @"SELECT * FROM Users WHERE UserName = @username";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@username", txtUserName.Text);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0) {
                Object UserID = dt.Rows[0]["UserID"];
                Object objPasswordHash = dt.Rows[0]["UserPasswordHash"];
                Object objRole = dt.Rows[0]["IsAdmin"];

                string password = txtPassword.Text;
                string storedPasswordHash = objPasswordHash.ToString();
                PBKDF2Hash hash = new PBKDF2Hash(password, storedPasswordHash);
                bool passwordCorrect = hash.PasswordCheck;
                bool isAdmin = Convert.ToBoolean(objRole);

                if (passwordCorrect) {
                    Session["UserID"] = Convert.ToInt32(UserID);
                    Session["UserName"] = txtUserName.Text;
                    Session["isAdmin"] = objRole;
                    if (isAdmin) {
                        Response.Redirect("Orders.aspx");
                    }
                    else {
                        Response.Redirect("Menu.aspx");
                    }
                }
                else {
                    lblloginStatus.Text = "Incorrect Password";
                    lblloginStatus.CssClass = "alert alert-danger";
                }
            }
            else {
                lblloginStatus.Text = "User not found.";
                lblloginStatus.CssClass = "alert alert-danger";
            }
        }
    }
}