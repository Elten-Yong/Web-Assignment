using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Practical_Assignment
{
    public partial class GalleryInsert : System.Web.UI.Page
    {
        public void BindGrid()
        {
            SqlConnection con = new SqlConnection("Data Source=localhost;Initial Catalog=ArtGallery;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("Select DrawID, DrawName, Draw from Images", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;
            GridView1.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindGrid();
            }
        }

        private void SaveImage()
        {
            if (FileUpload1.HasFile)
            {
                int imagefilelenth = FileUpload1.PostedFile.ContentLength;
                byte[] imgarray = new byte[imagefilelenth];
                HttpPostedFile image = FileUpload1.PostedFile;
                image.InputStream.Read(imgarray, 0, imagefilelenth);
                SqlConnection con = new SqlConnection("Data Source=localhost;Initial Catalog=ArtGallery;Integrated Security=True");

                SqlCommand cmd = new SqlCommand("Insert into Gallery (DrawName, Draw) values (@DrawName, @Draw)", con);
                con.Open();
                cmd.Parameters.AddWithValue("@DrawName", SqlDbType.VarChar).Value = TextBox1.Text;
                cmd.Parameters.AddWithValue("@Draw", SqlDbType.Image).Value = imgarray;
                cmd.ExecuteNonQuery();
                BindGrid();
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            SaveImage();
        }
    }
}