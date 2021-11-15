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
            if(!Convert.ToBoolean(Session["isAdmin"])) {
                Response.Redirect("Default.aspx");
            }
            lblRevenue.Text = getTotalLifetimeRevenue();
            lblCustomerCount.Text = getCustomerCount();
            getFoodCount("BURGER");
            getFoodCount("CHICKEN");
            getFoodCount("DESSERT");
            getFoodCount("DRINKS");
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

        void getFoodCount(string foodCategory) {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connMcDonalds"].ConnectionString);

            SqlCommand cmd = new SqlCommand("spGetMax", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@foodcategory", foodCategory);

            try {
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count > 0) {
                    if (foodCategory == "BURGER") {
                        lblBurgerName.Text = dt.Rows[0]["FoodName"].ToString();
                        lblBurgerCount.Text = dt.Rows[0]["QuantitySold"].ToString();
                    }
                    else if(foodCategory == "CHICKEN"){
                        lblChickenName.Text = dt.Rows[0]["FoodName"].ToString();
                        lblChickenCount.Text = dt.Rows[0]["QuantitySold"].ToString();
                    }
                    else if (foodCategory == "DESSERT") {
                        lblDessertName.Text = dt.Rows[0]["FoodName"].ToString();
                        lblDessertCount.Text = dt.Rows[0]["QuantitySold"].ToString();
                    }
                    else if (foodCategory == "DRINKS") {
                        lblDrinkName.Text = dt.Rows[0]["FoodName"].ToString();
                        lblDrinkCount.Text = dt.Rows[0]["QuantitySold"].ToString();
                    }
                }
                else {
                    lblError.Text = "No result in one of the queries.";
                }

            }
            catch (SqlException e){
                lblError.Text = e.ToString();
            }
        }

        
    }
}