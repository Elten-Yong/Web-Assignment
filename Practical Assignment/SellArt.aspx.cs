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
    public partial class SellArt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["Value"] = "AR1";
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
           
            SqlConnection con;
            string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strcon);

            con.Open();
            string strSelect = "Select count(DrawID) from Gallery";
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);
            int total = (int)cmdSelect.ExecuteScalar();
            con.Close();

            int newIndex = total + 1;
             
            string drawID = "DR" + newIndex.ToString();

            con.Open();
            string strSelect1 = "Select DrawID from Gallery";
            SqlCommand cmdSelect1 = new SqlCommand(strSelect1, con);
            SqlDataReader dtr = cmdSelect1.ExecuteReader();

            if (dtr.HasRows)
            {
                while (dtr.Read())
                {
                   
                    if (drawID.Equals(dtr["DrawID"]))
                    {
                        newIndex += 1; 
                        drawID = "DR" + newIndex.ToString();
                        
                    }
                }
            }
            con.Close();

            con.Open();
            int length = Drawing.PostedFile.ContentLength;
            byte[] pic = new byte[length];
            Drawing.PostedFile.InputStream.Read(pic, 0, length);

            string strInsert = "Insert into Gallery (DrawID, ArtistID, Name, Description, Price, Total, Image,Category) Values (@DrawID, @ArtistID, @Name, @Description, @Price, @Total, @Image,@Category)";

            SqlCommand cmdInsert = new SqlCommand(strInsert, con);
            cmdInsert.Parameters.AddWithValue("@DrawID", drawID);
            cmdInsert.Parameters.AddWithValue("@ArtistID", Session["Value"]);
            cmdInsert.Parameters.AddWithValue("@Name", ArtName.Text);
            cmdInsert.Parameters.AddWithValue("@Description", ArtDescription.Text);
            cmdInsert.Parameters.AddWithValue("@Price", Price.Text);
            cmdInsert.Parameters.AddWithValue("@Total", TotalArt.SelectedValue);
            cmdInsert.Parameters.AddWithValue("@Image", pic);
            cmdInsert.Parameters.AddWithValue("@Category", CategoryList.SelectedValue);
            int numRowAffected = cmdInsert.ExecuteNonQuery();
            con.Close();

            if (numRowAffected > 0)
            {
                // return insert success
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Added! " + "');", true);
                        
            }
            else
            {
                // return insert failed
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Added failed! " + "');", true);
            }
                
  
        }

 
    }
}