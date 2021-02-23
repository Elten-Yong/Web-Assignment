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
            Global.accountType = "a";
            Session["Value"] = "AR0001";

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
                        lblEmail.Text = dtr["Email"].ToString();
                        lblPhone.Text = dtr["PhoneNumber"].ToString();
                        lblAddress.Text = "";

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
                        lblEmail.Text = dtr["Email"].ToString();
                        lblPhone.Text = dtr["PhoneNumber"].ToString();
                        lblAddress.Text = dtr["Address"].ToString();
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
                        txtUsername.Text = dtr["Username"].ToString();
                        txtEmail.Text = dtr["Email"].ToString();
                        txtPassword.Text = dtr["Password"].ToString();
                        txtPhone.Text = dtr["PhoneNumber"].ToString();
                        txtAddress.Text = "";

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
                        txtUsername.Text = dtr["Username"].ToString();
                        txtEmail.Text = dtr["Email"].ToString();
                        txtPassword.Text = dtr["Password"].ToString();
                        txtPhone.Text = dtr["PhoneNumber"].ToString();
                        txtAddress.Text = dtr["Address"].ToString();
                    }
                }
                con.Close();
            }
            EditPageMultiview.ActiveViewIndex = 1;
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            Boolean duplicate = false;

            SqlConnection con;
            string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strcon);
            con.Open();

            

            if (Global.accountType == "a")
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
                            
                        }
                    }
                }
            }

            con.Close();

            if (!duplicate)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Password Successfully Changed!" + "');", true);

                if (Global.accountType == "a")
                {
                    con.Open();
                    string strUpdate = "UPDATE [Artist] SET Username = @Username, Password = @password, Email = @Email, PhoneNumber = @PhoneNumber WHERE ArtistID = @ArtistID";

                    SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);

                    cmdUpdate.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmdUpdate.Parameters.AddWithValue("@password", txtPassword.Text);
                    cmdUpdate.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmdUpdate.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text);
                    cmdUpdate.Parameters.AddWithValue("@ArtistID", Session["Value"]);

                    int n = cmdUpdate.ExecuteNonQuery();

                    if (n > 0) // Use to check whether the value have been insert into the database
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Password Successfully Changed!" + "');", true);

                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Opps, Password failed to change..." + "');", true);
                    }
                    con.Close();
                }
                else
                {
                    if (Global.accountType == "c")
                    {
                        con.Open();
                        string strUpdate = "UPDATE [Customer] SET Username = @Username, Password = @password, Email = @Email, PhoneNumber = @PhoneNumber, Address = @Address WHERE CustomerID = @CustomerID";

                        SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);

                        cmdUpdate.Parameters.AddWithValue("@Username", txtUsername.Text);
                        cmdUpdate.Parameters.AddWithValue("@password", txtPassword.Text);
                        cmdUpdate.Parameters.AddWithValue("@Email", txtEmail.Text);
                        cmdUpdate.Parameters.AddWithValue("@PhoneNumber", txtPhone.Text);
                        cmdUpdate.Parameters.AddWithValue("@PhoneNumber",txtAddress.Text);
                        cmdUpdate.Parameters.AddWithValue("@ArtistID", Session["Value"]);

                        int n = cmdUpdate.ExecuteNonQuery();

                        if (n > 0) // Use to check whether the value have been insert into the database
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Password Successfully Changed!" + "');", true);

                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Opps, Password failed to change..." + "');", true);
                        }
                        con.Close();
                    }
                }

            }
            EditPageMultiview.ActiveViewIndex = 1;
        }

        protected void btnCancelLogIn_Click(object sender, EventArgs e)
        {
            EditPageMultiview.ActiveViewIndex = 0;
        }
    }
}