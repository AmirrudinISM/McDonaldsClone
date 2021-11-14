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
    public partial class ExecutiveSummary : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            lblRevenue.Text = getTotalLifetimeRevenue();
            lblCustomerCount.Text = getCustomerCount();
        }

        string getTotalLifetimeRevenue() {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connMcDonalds"].ConnectionString);
            string sql = @"SELECT SUM(OrderPrice) FROM Orders;";
            SqlCommand cmd = new SqlCommand(sql, conn);

            try {
                conn.Open();
                double subtotal = Convert.ToDouble(cmd.ExecuteScalar());
                double serviceCharge = subtotal * 0.1;
                double serviceTax = subtotal * 0.06;
                double grandTotalBeforeRounding = subtotal + serviceCharge + serviceTax;
                double grandTotal = Math.Round(grandTotalBeforeRounding, 1);
                return grandTotal.ToString("c2");

            }
            catch {
                return "Error reading from database";
            }
        }

        string getCustomerCount() {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connMcDonalds"].ConnectionString);
            string sql = @"SELECT COUNT(UserID) FROM Users WHERE IsAdmin = 0";
            SqlCommand cmd = new SqlCommand(sql, conn);

            try {
                conn.Open();
                int customerCount = Convert.ToInt32(cmd.ExecuteScalar());
                
                return customerCount.ToString();

            }
            catch {
                return "Error reading from database";
            }
        }
    }
}