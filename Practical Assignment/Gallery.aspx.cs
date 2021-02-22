using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace Practical_Assignment
{
    public partial class Gallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            SqlConnection con;
            string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strcon);

            con.Open();

            string strSelect = "Select * from Gallery where DrawID=@DrawID";

            SqlCommand cmdSelect = new SqlCommand(strSelect, con);

            cmdSelect.Parameters.AddWithValue("@DrawID", "DR0001");

            SqlDataReader dtrGallery = cmdSelect.ExecuteReader();

            String msg = "";

            if (dtrGallery.HasRows)
            {
                while (dtrGallery.Read())
                {
                    msg = "Draw Name = " + dtrGallery["Name"].ToString();
                    byte[] imgBytes = (byte[])dtrGallery["Image"];
                    string strBase64 = Convert.ToBase64String(imgBytes);

                }
            }       

            con.Close();
            

            

        }
        
    }
}