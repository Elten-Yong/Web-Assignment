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
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con;
            string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strcon);

            con.Open();

            string strSelect = "Select * from Gallery where DrawID=@DrawID";

            SqlCommand cmdSelect = new SqlCommand(strSelect, con);

            cmdSelect.Parameters.AddWithValue("@DrawID", "DR1");

            SqlDataReader dtrGallery = cmdSelect.ExecuteReader();

            LoadImages();
        }

        /*
        private void LoadImages()
        {
            SqlConnection con;
            string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strcon);
            con.Open();

            string strSelect = "Select * from Gallery";
            SqlCommand cmd = new SqlCommand(strSelect, con);
            

            SqlDataReader rdr = cmd.ExecuteReader();
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            
        }
        */
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string DrawID = "";
        protected void GridView1_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            /*
            if (e.CommandName == "DeleteRow")
            {
                DrawID = (string)e.CommandArgument;
                SqlConnection con = new SqlConnection(cs);
                string cmdText = "DELETE FROM Gallery WHERE DrawID=@DrawID";
                SqlCommand cmd = new SqlCommand(cmdText, con);
                cmd.Parameters.AddWithValue("@DrawID", DrawID);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }
            */
            if (e.CommandName == "EditRow")
            {
                DrawID = (string)e.CommandArgument;
                //Session["EditDrawID"] = DrawID;
                //Response.Redirect("EditDrawingArtist.aspx");
            }

        }

        private void LoadImages()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string strCmd = "SELECT Image, Name, Description, Price, Total, ArtistID, DrawID FROM Gallery WHERE ArtistID = '" + "AR1" + "'";
                SqlCommand cmd = new SqlCommand(strCmd, con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                GridView1.DataSource = rdr;
                GridView1.DataBind();
                con.Close();
            }
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignIn.aspx");
        }
    }
}