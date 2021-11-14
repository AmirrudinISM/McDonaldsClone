using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace McDonaldClone.UserControls {
    public partial class LoginStatus : System.Web.UI.UserControl {
        protected void Page_Load(object sender, EventArgs e) {
           if (Session["UserName"] != null && Session["isAdmin"] != null) {
                HyperLink1.Visible = false;
                HyperLink2.Visible = false;
                btnLogout.Visible = true;
                lblUserName.Text = "Hello," + Session["UserName"].ToString() + "!";
           }
            else {
                HyperLink1.Visible = true;
                HyperLink2.Visible = true;
                btnLogout.Visible = false;
                lblUserName.Text = "You are not logged in.";
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e) {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }
    }
}