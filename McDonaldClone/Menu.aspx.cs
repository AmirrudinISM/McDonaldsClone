
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace McDonaldClone {
    public partial class Menu : System.Web.UI.Page {
        static double subtotal;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connMcDonalds"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e) {
            if (Convert.ToBoolean(Session["isAdmin"])) {
                Response.Redirect("Orders.aspx");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e) {
            lblSelectedItem_ID.Text = GridView1.SelectedRow.Cells[1].Text;
            lblSelectedItem_Name.Text = GridView1.SelectedRow.Cells[2].Text;
            lblSelectedItem_Price.Text = GridView1.SelectedRow.Cells[3].Text;
            lblErrorMessage1.Text = "";
        }

        protected void addToCart_Click(object sender, EventArgs e) {
            if(lblSelectedItem_ID.Text != ""){
                lblErrorMessage2.Text = "";
                insertIntoCart();
                GridViewCart.DataBind();
                CalculateCost();
            }
            else {
                lblErrorMessage1.Text = "Please select food item.";
            }

            
        }

        void insertIntoCart() {
            SqlCommand cmd = new SqlCommand("spAddItemToCart", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@foodid", lblSelectedItem_ID.Text);
            cmd.Parameters.AddWithValue("@quantity", txtQuantity.Text);
            cmd.Parameters.AddWithValue("@orderid", "");

            try {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex){
                lblErrorMessage1.Text = ex.Message;
            }
            finally {
                conn.Close();
            }
            txtQuantity.Text = "0";

        }

        void CalculateCost() {
            double serviceCharge;
            double serviceTax;
            double amountAfterServiceAndTaxCharge;
            double rounding;
            double grandTotal;

            SqlCommand cmd = new SqlCommand("spGetOrderPrice", conn);

            // Set command object for stored procedure execution
            cmd.CommandType = CommandType.StoredProcedure;

            try {
                // Open connection
                conn.Open();
                subtotal = (double)cmd.ExecuteScalar();
                serviceCharge = 0.1 * subtotal;
                serviceTax = 0.06 * subtotal;
                amountAfterServiceAndTaxCharge = subtotal + serviceCharge + serviceTax;
                grandTotal = Math.Round(amountAfterServiceAndTaxCharge,1);
                rounding = grandTotal - amountAfterServiceAndTaxCharge;
                lblSubtotal.Text = subtotal.ToString("c2");
                lblServiceCharge.Text = serviceCharge.ToString("c2");
                lblServiceTax.Text = serviceTax.ToString("c2");
                lblBeforeRounding.Text = amountAfterServiceAndTaxCharge.ToString("c2");
                lblRounding.Text = rounding.ToString("c2");
                lblGrandTotal.Text = grandTotal.ToString("c2");
            }
            catch (SqlException ex) {
                lblErrorMessage2.Text = ex.Message;
            }
            finally {
                conn.Close();
            }
        }
        void ClearReceipt() {
            lblSubtotal.Text = "RM0.00";
            lblServiceCharge.Text = "RM0.00";
            lblServiceTax.Text = "RM0.00";
            lblBeforeRounding.Text = "RM0.00";
            lblRounding.Text = "RM0.00";
            lblGrandTotal.Text = "RM0.00";
            lblSelectedItem_ID.Text = "";
            lblSelectedItem_Name.Text = "";
            lblSelectedItem_Price.Text = "";
        }
        void ClearCart() {
            subtotal = 0;
            SqlCommand cmd = new SqlCommand("spClearCart", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            try {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException ex) {
                lblErrorMessage2.Text = ex.Message;
            }
            finally {
                conn.Close();
            }
        }

        void ConfirmPurchase() {
            
            string hexTicks = DateTime.Now.Ticks.ToString("X");
            string salesId = hexTicks.Substring(hexTicks.Length - 15, 9);

            SqlCommand cmd = new SqlCommand("spConfirmOrder", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@orderid", salesId);
            cmd.Parameters.AddWithValue("@orderdatetime", DateTime.Now);
            cmd.Parameters.AddWithValue("@orderprice", subtotal);
          
            if(Session["UserID"] != null) {
                cmd.Parameters.AddWithValue("@customerid", Convert.ToInt32(Session["UserID"]));
            }
            else {
                cmd.Parameters.AddWithValue("@customerid", DBNull.Value);
            }

            try {
                conn.Open();
                cmd.ExecuteNonQuery();
                if (Session["UserID"] != null) {
                    lblErrorMessage2.Text = "Order placed! Redirecting to your account page...";
                    lblErrorMessage2.Style.Add("color", "green");
                    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
                   "setTimeout(function() { window.location.replace('MyAccount.aspx') }, 3000);", true);
                }
                else {
                    lblErrorMessage2.Text = "Order placed!";
                    lblErrorMessage2.Style.Add("color", "green");
                }
                

            }
            catch (Exception ex) {
                lblErrorMessage2.Text = ex.Message;
            }
            finally {
                conn.Close();
            }

        }

        protected void btnConfirm_Click(object sender, EventArgs e) {
            if(GridViewCart.Rows.Count == 0) {
                lblErrorMessage2.Text = "Please add items to cart!";
                lblErrorMessage2.Style.Add("color", "red");
            }
            else {
                ConfirmPurchase();
                GridViewCart.DataBind();
                ClearReceipt();
            }
           

        }

        protected void btnClearCart_Click(object sender, EventArgs e) {
            ClearCart();
            GridViewCart.DataBind();
            ClearReceipt();
        }
    }
}