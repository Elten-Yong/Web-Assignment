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
    public partial class SignUp : System.Web.UI.Page
    {
        class Global // Global variable
        {
            public static string accountType;
        }
        Boolean duplicate = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            SignUpMultiView.ActiveViewIndex = 0;
        }

        protected void btnArtist_Click(object sender, EventArgs e)
        {
            Global.accountType = "a";
            changeView();
        }

        protected void btnCustomer_Click(object sender, EventArgs e)
        {
            Global.accountType = "c";
            changeView();
        }
        protected void changeView()
        {
            SignUpMultiView.ActiveViewIndex = 1; // Use to change the view to register form
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //create connection
            SqlConnection con;
            string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strcon);
            con.Open();

            if(Global.accountType == "a")
            {
                //retrieve data
                string strSelect = "SELECT ArtistID, Username FROM [Artist]";
                //specify what is the command , what is the connection string
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);

                SqlDataReader dtr = cmdSelect.ExecuteReader();

                
                if (dtr.HasRows)
                {
                    while (dtr.Read())
                    {
                        if (txtUsername.Text.Equals(dtr["Username"]))
                        {
                            duplicate = true;
                            lblDuplicate.Text = "Username existed, please use another username.";
                            SignUpMultiView.ActiveViewIndex = 1; //stay in current page
                        }
                    }
                }
            }
            else
            {
                //retrieve data
                string strSelect = "SELECT CustomerID, Username FROM [Customer]";
                //specify what is the command , what is the connection string
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);

                SqlDataReader dtr = cmdSelect.ExecuteReader();

                if (dtr.HasRows)
                {
                    while (dtr.Read())
                    {
                        if (txtUsername.Text.Equals(dtr["Username"]))
                        {
                            duplicate = true;
                            lblDuplicate.Text = "Username existed, please use another username.";
                            SignUpMultiView.ActiveViewIndex = 1; //stay in current page
                        }
                    }
                }
            }

            con.Close();



            if (!duplicate) //no repeated username
            {
                SqlConnection newCon;
                string newStrCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                newCon = new SqlConnection(newStrCon);

                if (Global.accountType == "a")
                {

                    newCon.Open();

                    string strSelect = "Select count(ArtistID) from Artist";
                    SqlCommand cmdSelect = new SqlCommand(strSelect, newCon);

                    int total = (int)cmdSelect.ExecuteScalar() + 1;
                    newCon.Close();

                    string artistID = "AR" + total.ToString();
                    newCon.Open();

                    string strInsert = "INSERT INTO [Artist] (ArtistID, Username, Password, Email, SecurityQuestion, SecurityAnswer) VALUES (@ArtistID, @Username, @Password, @Email,@SecurityQuestion,@SecurityAnswer)";

                    SqlCommand cmdInsert = new SqlCommand(strInsert, newCon);
                    cmdInsert.Parameters.AddWithValue("@ArtistID", artistID );
                    cmdInsert.Parameters.AddWithValue("@Username", txtUsername.Text.ToString());
                    cmdInsert.Parameters.AddWithValue("@Password", txtPassword.Text.ToString());
                    cmdInsert.Parameters.AddWithValue("@Email", txtEmail.Text.ToString());
                    cmdInsert.Parameters.AddWithValue("@SecurityQuestion", ddlQuestion.Text.ToString());
                    cmdInsert.Parameters.AddWithValue("@SecurityAnswer", txtQuestion.Text.ToString());
                    int n = cmdInsert.ExecuteNonQuery();

                    if (n > 0) // Use to check whether the value have been insert into the database
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Art Account Successfully Created!" + "');", true);
                        
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Failed! " + "');", true);
                    }

                    newCon.Close();
                }
                else
                {
                    newCon.Open();

                    string strSelect = "Select count(CustomerID) from Customer";
                    SqlCommand cmdSelect = new SqlCommand(strSelect, newCon);

                    int total = (int)cmdSelect.ExecuteScalar() + 1;
                    newCon.Close();

                    string customerID = "CS" + total.ToString();
                    newCon.Open();

                    string strInsert = "INSERT INTO [Customer] (CustomerID, Username, Password, Email, SecurityQuestion, SecurityAnswer) VALUES (@CustomerID, @Username, @Password, @Email,@SecurityQuestion,@SecurityAnswer)";
                    
                    SqlCommand cmdInsert = new SqlCommand(strInsert, newCon);
                    cmdInsert.Parameters.AddWithValue("@CustomerID", customerID);
                    cmdInsert.Parameters.AddWithValue("@Username", txtUsername.Text.ToString());
                    cmdInsert.Parameters.AddWithValue("@Password", txtPassword.Text.ToString());
                    cmdInsert.Parameters.AddWithValue("@Email", txtEmail.Text.ToString());
                    cmdInsert.Parameters.AddWithValue("@SecurityQuestion", ddlQuestion.Text.ToString());
                    cmdInsert.Parameters.AddWithValue("@SecurityAnswer", txtQuestion.Text.ToString());
                    int n = cmdInsert.ExecuteNonQuery();

                    if (n > 0) // Use to check whether the value have been insert into the database
                    {
                        
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Customer Account Successfully Created!" + "');", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Failed!" + "');", true);
                    }

                    newCon.Close();
                }




            }
            

          
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignIn.aspx");
        }
    }
}