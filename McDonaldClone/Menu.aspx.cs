
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
            if (!IsPostBack) {
                
                GenerateSalesId();
            }
            
        }

        void GenerateSalesId() {
            string hexTicks = DateTime.Now.Ticks.ToString("X");
            string salesId = hexTicks.Substring(hexTicks.Length - 15, 9);
            string dateTime = DateTime.Now.ToString();
           
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e) {
            lblSelectedItem_ID.Text = GridView1.SelectedRow.Cells[1].Text;
            lblSelectedItem_Name.Text = GridView1.SelectedRow.Cells[2].Text;
            lblSelectedItem_Price.Text = GridView1.SelectedRow.Cells[3].Text;
            lblErrorMessage1.Text = "";
        }

        protected void addToCart_Click(object sender, EventArgs e) {
            if(lblSelectedItem_ID.Text != ""){
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
                grandTotal = subtotal + serviceCharge + serviceTax;
                lblSubtotal.Text = subtotal.ToString("c2");
                lblServiceCharge.Text = serviceCharge.ToString("c2");
                lblServiceTax.Text = serviceTax.ToString("c2");
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
            lblGrandTotal.Text = "RM0.00";
            lblSelectedItem_ID.Text = "";
            lblSelectedItem_Name.Text = "";
            lblSelectedItem_Price.Text = "";
        }
        void ClearCart() {
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
            string dateTime = DateTime.Now.ToString();

            SqlCommand cmd = new SqlCommand("spConfirmOrder", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@orderid", salesId);
            cmd.Parameters.AddWithValue("@orderdatetime", dateTime);
            cmd.Parameters.AddWithValue("@orderprice", subtotal);
            cmd.Parameters.AddWithValue("@customerid", DBNull.Value);
            
            

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

        protected void btnConfirm_Click(object sender, EventArgs e) {
            ConfirmPurchase();
            GridViewCart.DataBind();
            ClearReceipt();

        }

        protected void btnClearCart_Click(object sender, EventArgs e) {
            ClearCart();
            GridViewCart.DataBind();
            ClearReceipt();
        }
    }
}