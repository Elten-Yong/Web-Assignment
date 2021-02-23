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

    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Value"]!= null && Session["Value"] != "0")
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
                            ArtistUsername.Text = dtr["Username"].ToString();
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
                            CustomerUsername.Text = dtr["Username"].ToString();
                        }
                    }
                    con.Close();
                    
                }
            }
        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {

        }

        protected void ltnButton1_Click(object sender, EventArgs e)
        {
            Session["Value"] = "0";
            Response.Redirect("HomePage.aspx");
            Global.i = 0;  // homepage checking
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Session["Value"] = "0";
            Response.Redirect("HomePage.aspx");
            Global.i = 0;  // homepage checking
        }
    }
}