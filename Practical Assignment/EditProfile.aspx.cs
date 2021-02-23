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

    public partial class EditProfile : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            EditPageMultiview.ActiveViewIndex = 0;
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
                        lblUsername.Text = dtr["Username"].ToString();
                        lblUsername0.Text = dtr["Username"].ToString();
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
                        lblUsername.Text = dtr["Username"].ToString();
                        lblUsername0.Text = dtr["Username"].ToString();

                    }
                }
                con.Close();
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
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
                        
                        txtEmail.Text = dtr["Email"].ToString();
                        txtPassword.Text = dtr["Password"].ToString();
                        txtPhone.Text = dtr["PhoneNumber"].ToString();

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
                        
                        txtEmail.Text = dtr["Email"].ToString();
                        txtPassword.Text = dtr["Password"].ToString();
                        txtPhone.Text = dtr["PhoneNumber"].ToString();
                        txtAddress.Text = dtr["Address"].ToString();
                    }
                }
                con.Close();
            }

            if (Global.accountType == "a")
            {
                con.Open();
                string strSelect = "SELECT Password FROM [Artist] WHERE Username = @Username";

                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@Username", lblUsername.Text); //supply value to @Username

                SqlDataReader dtr = cmdSelect.ExecuteReader();

                while (dtr.Read())
                {
                    if (dtr["Password"].ToString().Equals(txtConfirmPassword.Text))
                    {

                        EditPageMultiview.ActiveViewIndex = 1;

                    }
                    else
                    {
                        lblError.Text = "Incorrect Password.";
                        txtPassword.Text = "";
                        EditPageMultiview.ActiveViewIndex = 0; //stay in current view

                    }
                }
                con.Close();
            }
            else
            {
                con.Open();
                string strSelect = "SELECT Password FROM [Customer] WHERE Username = @Username";

                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@Username", lblUsername.Text); //supply value to @Username

                SqlDataReader dtr = cmdSelect.ExecuteReader();

                while (dtr.Read())
                {
                    if (dtr["Password"].ToString().Equals(txtConfirmPassword.Text))
                    {

                        EditPageMultiview.ActiveViewIndex = 1;

                    }
                    else
                    {
                        lblError.Text = "Incorrect Password.";
                        txtPassword.Text = "";
                        EditPageMultiview.ActiveViewIndex = 0; //stay in current view

                    }
                }
                con.Close();
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //Boolean duplicate = false;

            SqlConnection con;
            string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strcon);

            if (Global.accountType == "a")
            {
                con.Open();
                string strUpdate = "UPDATE [Artist] SET Password = @password, Email = @Email, PhoneNumber = @PhoneNumber WHERE ArtistID = @ArtistID";

                SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);

                cmdUpdate.Parameters.AddWithValue("@password", txtPassword.Text);
                cmdUpdate.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmdUpdate.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text);
                cmdUpdate.Parameters.AddWithValue("@ArtistID", Session["Value"]);

                int n = cmdUpdate.ExecuteNonQuery();
                if (n > 0) // Use to check whether the value have been insert into the database
                {
                     ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Edit Account Successfully Created!" + "');", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Failed!" + "');", true);
                }
                con.Close();
            }
            else
            {
                if (Global.accountType == "c")
                {
                    con.Open();
                    string strUpdate = "UPDATE [Customer] SET Password = @password, Email = @Email, PhoneNumber = @PhoneNumber, Address = @Address WHERE CustomerID = @CustomerID";

                    SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);

                    cmdUpdate.Parameters.AddWithValue("@password", txtPassword.Text);
                    cmdUpdate.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmdUpdate.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text);
                    cmdUpdate.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmdUpdate.Parameters.AddWithValue("@CustomerID", Session["Value"]);

                    int n = cmdUpdate.ExecuteNonQuery();

                    if (n > 0) // Use to check whether the value have been insert into the database
                    {

                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Customer Account Successfully Created!" + "');", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Failed!" + "');", true);
                    }

                    con.Close();
                }
            }

            
            Response.Redirect("Profile.aspx");

        }

        protected void btnCancelLogIn_Click(object sender, EventArgs e)
        {
            EditPageMultiview.ActiveViewIndex = 0;
        }

        protected void btnCancelEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }
    }
}



