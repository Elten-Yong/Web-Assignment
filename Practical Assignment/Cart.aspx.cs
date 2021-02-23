using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;


namespace Practical_Assignment
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignIn.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
                if (Session["Value"] != null && Session["Value"] != "0")
                {
                    SqlConnection con;
                    string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    con = new SqlConnection(strcon);
                    //string addedDraw = e.CommandArgument.ToString();
                    Boolean duplicate = false;
                    //checking value
                    con.Open();
                    string strSelectChecking = "Select * from CartGallery Where CustomerID = @CustomerID and DrawID =@DrawID";
                    SqlCommand cmdSelect = new SqlCommand(strSelectChecking, con);

                    cmdSelect.Parameters.AddWithValue("@CustomerID", Session["Value"]);
                    //cmdSelect.Parameters.AddWithValue("@DrawID", DrawID);

                SqlDataReader dtr = cmdSelect.ExecuteReader();

                    if (dtr.HasRows)
                    {
                        while (dtr.Read())
                        {
                            if (Session["Value"].Equals(dtr["CustomerID"]))
                            {
                                duplicate = true;
                                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Already in cart! " + "');", true);
                            }
                        }
                    }

                    con.Close();

                    //insert value
                    if (!duplicate)
                    {
                        con.Open();

                        string strInsert = "Insert into CartGallery (CustomerID, DrawID, Name, Price, Image) Values (@CustomerID, @DrawID, @Name, @Price, @Image)";

                        SqlCommand cmdInsert = new SqlCommand(strInsert, con);
                        cmdInsert.Parameters.AddWithValue("@CustomerID", Session["Value"]);
                        //cmdInsert.Parameters.AddWithValue("@DrawID", addedDraw);
                        
                        int numRowAffected = cmdInsert.ExecuteNonQuery();
                        if (numRowAffected > 0)
                        {
                            // return insert success
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Added successfully! " + "');", true);
                        }
                        else
                        {
                            // return insert failed
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "update failed! " + "');", true);
                        }
                        con.Close();
                    }
                }
                else
                {
                    // not allow to add, please sign in first
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "log in first! " + "');", true);
                }
      

        }
    }
}