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
    public partial class ForgetPassword : System.Web.UI.Page
    {
        class Global
        {
            public static string accountType;
            public static string artistID;
            public static string customerID;
            public static string answer;
            public static int attempt;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            initialView(); // load initial page
        }

        protected void btnCancelForgot_Click(object sender, EventArgs e)
        {
            initialView();
        }

        protected void btnCancelForgot2_Click(object sender, EventArgs e)
        {
            changeView1();
        }

        protected void btnCancelForgot3_Click(object sender, EventArgs e)
        {
            changeView2();
        }
        
        protected void btnProceed_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);

            if (Global.accountType == "a")
            {
                con.Open();

                string strSelect = "SELECT * FROM [Artist] WHERE Username = @Username";

                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@Username", txtUsername.Text);

                SqlDataReader dtr = cmdSelect.ExecuteReader();

                if (dtr.HasRows)
                {
                    while (dtr.Read())
                    {
                        if (txtUsername.Text.Equals(dtr["Username"]))
                        {

                            Global.artistID = dtr["ArtistID"].ToString();
                            lblQuestion.Text = dtr["SecurityQuestion"].ToString();
                            Global.answer = dtr["SecurityAnswer"].ToString();
                            txtUsername.Text = "";
                            lblUsernameError.Text = "";
                            changeView2();
                        }
                    }
                }
                else
                {
                    txtUsername.Text = "";
                    lblUsernameError.Text = "Username not exist, please try again!";
                    changeView1(); //stay in vieww 1
                }
                con.Close();


            }
            else
            {
                con.Open();

                string strSelect = "SELECT * FROM [Customer] WHERE Username = @Username";

                SqlCommand cmdSelect = new SqlCommand(strSelect, con);
                cmdSelect.Parameters.AddWithValue("@Username", txtUsername.Text);

                SqlDataReader dtr = cmdSelect.ExecuteReader();

                if (dtr.HasRows)
                {
                    while (dtr.Read())
                    {
                        if (txtUsername.Text.Equals(dtr["Username"]))
                        {

                            Global.customerID = dtr["CustomerID"].ToString();
                            lblQuestion.Text = dtr["SecurityQuestion"].ToString();
                            Global.answer = dtr["SecurityAnswer"].ToString();
                            txtUsername.Text = "";
                            lblUsernameError.Text = "";
                            changeView2();
                        }
                    }
                }
                else
                {
                    txtUsername.Text = "";
                    lblUsernameError.Text = "Username not exist, please try again!";
                    changeView1(); //stay in vieww 1
                }
                con.Close();
            }
        }

        protected void btnProceed2_Click(object sender, EventArgs e)
        {

            if (Global.attempt <= 4)
            {

                if (txtAnswerQuestion.Text.Equals(Global.answer))
                {
                    lblQuestion.Text = "";
                    txtAnswerQuestion.Text = "";
                    changeView3();
                }
                else
                {
                    Global.attempt++;
                    txtAnswerQuestion.Text = "";
                    lblSecurityQuestion.Text = "Security answer incorrect, please try again.";
                    changeView2();
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Too many unsuccessful attempts!" + "');", true);
                Global.attempt = 0;
                initialView();
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            con = new SqlConnection(strCon);

            
            if(Global.accountType == "a")
            {
                con.Open();
                string strUpdate = "UPDATE [Artist] SET Password = @password WHERE ArtistID = @ArtistID";

                SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);

                cmdUpdate.Parameters.AddWithValue("@password", txtNewPassword.Text.ToString());
                cmdUpdate.Parameters.AddWithValue("@ArtistID", Global.artistID);

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
                con.Open();
                string strUpdate = "UPDATE [Customer] SET Password = @password WHERE CustomerID = @CustomerID";

                SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);

                cmdUpdate.Parameters.AddWithValue("@password", txtNewPassword.Text.ToString());
                cmdUpdate.Parameters.AddWithValue("@CustomerID", Global.customerID);

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



            initialView(); //stay in view 1
        }
        protected void changeView1()
        {
            ForgetPasswordMultiView.ActiveViewIndex = 1; // Use to change the view 
        }

        protected void changeView2()
        {
            ForgetPasswordMultiView.ActiveViewIndex = 2; // Use to change the view 
        }
        protected void changeView3()
        {
            ForgetPasswordMultiView.ActiveViewIndex = 3; // Use to change the view 
        }

        protected void initialView()
        {
            ForgetPasswordMultiView.ActiveViewIndex = 0; // Use to change the view 
        }
        protected void btnArtist_Click(object sender, EventArgs e)
        {
            Global.accountType = "a";
            changeView1();

        }

        protected void btnCustomer_Click(object sender, EventArgs e)
        {
            Global.accountType = "c";
            changeView1();
        }



 
    }
}