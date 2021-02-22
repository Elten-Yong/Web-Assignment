using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Data.SqlClient;
//using System.Configuration;

namespace Practical_Assignment
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //SqlConnection con;
            //string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //con = new SqlConnection(strcon);
            //con.Open();

            ////retrieve data
            //string strSelect = "SELECT ArtistID, Username FROM [Artist]";
            ////specify what is the command , what is the connection string
            //SqlCommand cmdSelect = new SqlCommand(strSelect, con);

            //SqlDataReader dtr = cmdSelect.ExecuteReader();

            //lblUsername = (Label)dtr["Username"];
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignIn.aspx");
        }
    }
}