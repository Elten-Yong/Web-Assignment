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
    public partial class SignIn : System.Web.UI.Page
    {

        class Global // Global variable
        {
            public static string accountType;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            SignInMultiView.ActiveViewIndex = 0;
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
            SignInMultiView.ActiveViewIndex = 1; // Use to change the view to register form
        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strcon);
     
            
            if(Global.accountType == "a")
            {
                
                con.Open();
                string strSelect = "SELECT * FROM [Artist] WHERE Username = @Username";

                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@Username", txtUsername.Text); //supply value to @Username

                SqlDataReader dtr = cmdSelect.ExecuteReader();

                if (dtr.HasRows)
                {
                    while (dtr.Read())
                    {
                        if (txtUsername.Text.Equals(dtr["Username"]))
                        {
                            if (dtr["Password"].ToString().Equals(txtPassword.Text))
                            {

                                Response.Redirect("HomePage.aspx");
                                
                            }
                            else
                            {
                                txtPassword.Text = "";
                                lblError.Text = "Incorrect Password";
                                SignInMultiView.ActiveViewIndex = 1; //stay in current view

                            }
                        }
                    }
                }
                else
                {
                    txtPassword.Text = "";
                    txtUsername.Text = "";
                    lblError.Text = "Username not existed.";
                    SignInMultiView.ActiveViewIndex = 1; //stay in current view

                }
                con.Close();
            }
            else
            {
                con.Open();
                string strSelect = "SELECT * FROM [Customer] WHERE Username = @Username";

                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@Username", txtUsername.Text); //supply value to @Username

                SqlDataReader dtr = cmdSelect.ExecuteReader();

                if (dtr.HasRows)
                {
                    while (dtr.Read())
                    {
                        if (txtUsername.Text.Equals(dtr["Username"]))
                        {
                            if (dtr["Password"].Equals(txtPassword.Text))
                            {
 
                                Response.Redirect("HomePage.aspx");


                            }
                            else
                            {
                                txtPassword.Text = "";
                                lblError.Text = "Incorrect Password";
                                SignInMultiView.ActiveViewIndex = 1; //stay in current view

                            }
                        }

                    }
                }
                else
                {
                    txtPassword.Text = "";
                    txtUsername.Text = "";
                    lblError.Text = "Username not existed.";
                    SignInMultiView.ActiveViewIndex = 1; //stay in current view
                }
                con.Close();
            }

            

        }

        protected void btnCancelLogIn_Click(object sender, EventArgs e)
        {
            SignInMultiView.ActiveViewIndex = 0;
        }
    }
}