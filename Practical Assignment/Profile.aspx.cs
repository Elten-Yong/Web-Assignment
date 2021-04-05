using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Practical_Assignment
{
    public partial class Profile : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Value"] != "0" && Session["Value"] != null)
            {

                SqlConnection con;
                string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strcon);
                if (Global.accountType == "a")
                {
                    //profile pic command
                    SqlDataSource1.SelectCommand = "SELECT [ProfilePicture] FROM [Artist] WHERE ArtistID = @ArtistID";
                    
                    

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
                            lblPhoneNo.Text = dtr["PhoneNumber"].ToString();
                            lblAddress.Text = "";

                        }
                    }
                    con.Close();
                }
                else 
                {
                    //profile pic command
                    SqlDataSource1.SelectCommand = "SELECT [ProfilePicture] FROM [Customer] WHERE CustomerID = @CustomerID";

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
                            lblPhoneNo.Text = dtr["PhoneNumber"].ToString();
                            lblAddress.Text = dtr["Address"].ToString();
                        }
                    }
                    con.Close();
                }
            }
        
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            
                DataRowView datarow = (DataRowView)e.Item.DataItem;
                string imageUrl = (datarow["ProfilePicture"]).ToString() ;
                (e.Item.FindControl("Image1") as Image).ImageUrl = imageUrl;
        
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session["Value"] = "0";
            Response.Redirect("HomePage.aspx");
            Global.i = 0;  // homepage checking
            
        }

        protected void EditProfile_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("EditProfile.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignIn.aspx");
        }

        protected void EditProfilePic_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfilePicture.aspx");
        }

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }
    }
}