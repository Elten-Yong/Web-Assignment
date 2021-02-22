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
    public partial class GalleryArtist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //LoadImages();
        }
        /*
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
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

        protected void GridView1_RowCommand(Object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "DeleteRow")
            {
                string DrawID = (string)e.CommandArgument;
                SqlConnection con = new SqlConnection(cs);
                string cmdText = "DELETE FROM Gallery WHERE DrawID=@DrawID";
                SqlCommand cmd = new SqlCommand(cmdText, con);
                cmd.Parameters.AddWithValue("@DrawID", DrawID);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }

        }
        */
    }
}