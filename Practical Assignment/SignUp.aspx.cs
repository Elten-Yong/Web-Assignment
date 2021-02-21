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
        Char accountType;
        Boolean duplicate = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            SignUpMultiView.ActiveViewIndex = 0;
        }

        protected void btnArtist_Click(object sender, EventArgs e)
        {
            accountType = 'a';
            changeView();
        }

        protected void btnCustomer_Click(object sender, EventArgs e)
        {
            accountType = 'c';
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

            if(accountType == 'a')
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

            con.Open();
            if (!duplicate) //no repeated username
            {
                if(accountType == 'a')
                {

                    string strInsert = "INSERT INTO [Artist] (ArtistID, Username, Password, Email, SecurityQuestion, SecurityAnswer) VALUES (@ArtistID, @Username, @Password, @Email,@SecurityQuestion,@SecurityAnswer)";

                    SqlCommand cmdInsert = new SqlCommand(strInsert, con);

                    

                }



           
            }
            con.Close();

          
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignIn.aspx");
        }
    }
}