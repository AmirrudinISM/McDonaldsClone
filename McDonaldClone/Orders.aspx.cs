using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace McDonaldClone {
    public partial class Orders : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void GridViewOrderList_SelectedIndexChanged(object sender, EventArgs e) {
            double subtotal = Convert.ToDouble(GridViewOrderList.SelectedRow.Cells[3].Text);
            double serviceCharge = 0.1 * subtotal;
            double serviceTax = 0.06 * subtotal;
            double grandTotal = subtotal + serviceCharge + serviceTax;

            lblSubtotal.Text = subtotal.ToString("c2");
            lblServiceCharge.Text = serviceCharge.ToString("c2");
            lblServiceTax.Text = serviceTax.ToString("c2");
            lblGrandTotal.Text = grandTotal.ToString("c2");
        }
    }
}