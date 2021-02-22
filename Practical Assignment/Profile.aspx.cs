using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Practical_Assignment
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Session["Value"].ToString();

            if (Session["Value"] != "0")
            {

                SqlConnection con;
                string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strcon);
                if (Global.accountType == "a")
                {
                    con.Open();
                    string strSelect = "SELECT * FROM [Artist] WHERE ArtistID = @ArtistID";

                    SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                    cmdSelect.Parameters.AddWithValue("@ArtistID", Session["Value"]);
                    SqlDataReader dtr = cmdSelect.ExecuteReader();

                    if (dtr.HasRows)
                    {
                        while (dtr.Read())
                        {
                            lblUsername.Text = dtr["ArtistID"].ToString();
                            lblEmail.Text = dtr["Email"].ToString();
                            lblPassword.Text = dtr["Password"].ToString();
                        }
                    }
                    con.Close();
                }
                else
                {
                    con.Open();
                    string strSelect = "SELECT * FROM [Customer] WHERE CustomerID = @CustomerID";

                    SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                    cmdSelect.Parameters.AddWithValue("@CustomerID", Session["Value"]);
                    SqlDataReader dtr = cmdSelect.ExecuteReader();

                    if (dtr.HasRows)
                    {
                        while (dtr.Read())
                        {
                            lblUsername.Text = dtr["CustomerID"].ToString();
                            lblEmail.Text = dtr["Email"].ToString();
                            lblPassword.Text = dtr["Password"].ToString();
                        }
                    }
                    con.Close();
                }
            }
        
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session["Value"] = "0";
            Response.Redirect("SignIn.aspx");
            Global.i = 0;  // homepage checking
            Response.Redirect("HomePage.aspx");
        }
    }
}