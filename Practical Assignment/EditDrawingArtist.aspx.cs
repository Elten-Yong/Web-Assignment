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
    public partial class EditDrawingArtist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con;
            string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strcon);
            con.Open();

            string drawID = Session["EditDrawID"].ToString();

            string strSelect = "Select * FROM Gallery WHERE DrawID = " + drawID;

            SqlCommand cmdSelect = new SqlCommand(strSelect, con);

            SqlDataReader dtrGallery = cmdSelect.ExecuteReader();

            while (dtrGallery.Read())
            {
                byte[] imgBytes = (byte[])dtrGallery["Image"];
                string strBase64 = Convert.ToBase64String(imgBytes);
                DrawImg.ImageUrl = "data:image/png;base64," + strBase64;

                ArtName.Text = dtrGallery["Name"].ToString();
                ArtDescription.Text = dtrGallery["Description"].ToString();
                Price.Text = dtrGallery["Price"].ToString();
            }

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strcon);
            con.Open();

            string drawID = Session["EditDrawID"].ToString();

            string strUpdate = "Update into Gallery SET Name = @Name, Description = @Description, Price = @Price, Total = @Total WHERE DrawID = " + drawID;

            SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);
            cmdUpdate.Parameters.AddWithValue("@DrawID", drawID);
            cmdUpdate.Parameters.AddWithValue("@Name", ArtName.Text);
            cmdUpdate.Parameters.AddWithValue("@Description", ArtDescription.Text);
            cmdUpdate.Parameters.AddWithValue("@Price", Price.Text);
            cmdUpdate.Parameters.AddWithValue("@Total", TotalArt.SelectedValue);
            int numRowAffected = cmdUpdate.ExecuteNonQuery();

            if (numRowAffected > 0)
            {
                // return insert success
            }
            else
            {
                // return insert failed
            }
            con.Close();
            Response.Redirect("GalleryArtist.aspx");
        }
    }
}