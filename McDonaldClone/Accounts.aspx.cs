using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace McDonaldClone {
    public partial class Accounts : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!Convert.ToBoolean(Session["isAdmin"])) {
                Response.Redirect("Default.aspx");
            }
        }

        protected void GridViewCustomers_SelectedIndexChanged(object sender, EventArgs e) {
            lblUserName.Text = GridViewCustomers.SelectedRow.Cells[2].Text;
            detail.Attributes.Add("style", "display:none");
        }

        protected void GridViewOrders_SelectedIndexChanged(object sender, EventArgs e) {
            lblOrderID.Text = GridViewOrders.SelectedRow.Cells[1].Text;
            detail.Attributes.Add("style", "display:block");
        }
    }
}