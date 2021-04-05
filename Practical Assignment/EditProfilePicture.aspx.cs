using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;

namespace Practical_Assignment
{
    public partial class EditProfilePicture : System.Web.UI.Page
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
                }
                else
                {
                    //profile pic command
                    SqlDataSource1.SelectCommand = "SELECT [ProfilePicture] FROM [Customer] WHERE CustomerID = @CustomerID";
                }

            }
        }

        //ITEM BOUND
        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {

            DataRowView datarow = (DataRowView)e.Item.DataItem;
            string imageUrl = (datarow["ProfilePicture"]).ToString();
            (e.Item.FindControl("Image1") as Image).ImageUrl = imageUrl;

        }

        protected void EditProfilePic_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfilePicture.aspx");
        }

        protected void EditProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfile.aspx");
        }


        protected void btnProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        protected void Change_Click(object sender, EventArgs e)
        {
            SqlConnection con;
            string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strcon);

            

            int length = FileUpload1.PostedFile.ContentLength;
            byte[] pic = new byte[length];
            FileUpload1.PostedFile.InputStream.Read(pic, 0, length);

            if(Global.accountType == "a")
            {
                con.Open();

                string strUpdate = "UPDATE [Artist] SET ProfilePicture = @ProfilePicture WHERE ArtistID = @ArtistID";

                SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);

                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string filePath = "ProfilePic/" + fileName;
                FileUpload1.PostedFile.SaveAs(Server.MapPath(filePath));

                try
                {
                    cmdUpdate.Parameters.AddWithValue("@ProfilePicture", filePath);
                    cmdUpdate.Parameters.AddWithValue("@ArtistID", Session["Value"]);
                    int n = cmdUpdate.ExecuteNonQuery();
                }
                catch(Exception ex)
                {
                    Console.WriteLine("Something went wrong.");
                }

                
               

                

                con.Close();

                
            }
            else
            {
                con.Open();

                string strUpdate = "UPDATE [Customer] SET ProfilePicture = @ProfilePicture WHERE CustomerID = @CustomerID";

                SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);

                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string filePath = "ProfilePic/" + fileName;
                FileUpload1.PostedFile.SaveAs(Server.MapPath(filePath));

                try
                {
                    cmdUpdate.Parameters.AddWithValue("@ProfilePicture", filePath);
                    cmdUpdate.Parameters.AddWithValue("@CUstomerID", Session["Value"]);
                    int n = cmdUpdate.ExecuteNonQuery();

                }
                catch (Exception ex)
                {
                    Console.WriteLine("Something went wrong.");
                }

                
                con.Close();
            }

            Response.Redirect("EditProfilePicture.aspx");
        }
    }
}