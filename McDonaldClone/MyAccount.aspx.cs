﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace McDonaldClone {
    public partial class MyAccount : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void GridViewMyOrders_SelectedIndexChanged(object sender, EventArgs e) {
            double subtotal = Convert.ToDouble(GridViewMyOrders.SelectedRow.Cells[3].Text);
            double serviceCharge = 0.1 * subtotal;
            double serviceTax = 0.06 * subtotal;
            double amountAfterServiceAndTaxCharge = subtotal + serviceCharge + serviceTax;
            double grandTotal = Math.Round(amountAfterServiceAndTaxCharge, 1);
            double rounding = grandTotal - amountAfterServiceAndTaxCharge;

            lblSubtotal.Text = subtotal.ToString("c2");
            lblServiceCharge.Text = serviceCharge.ToString("c2");
            lblServiceTax.Text = serviceTax.ToString("c2");
            lblTotalBeforeRounding.Text = amountAfterServiceAndTaxCharge.ToString("c2");
            lblRounding.Text = rounding.ToString("c2");
            lblGrandTotal.Text = grandTotal.ToString("c2");

        }
    }
}