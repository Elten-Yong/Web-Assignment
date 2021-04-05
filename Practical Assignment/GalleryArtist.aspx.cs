using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Practical_Assignment
{
    public partial class GalleryArtist : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Value"] = "AR1";
            SqlConnection con;
            string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strcon);

            con.Open();
            string strSelect = "SELECT count(*) from Gallery Where ArtistID = @ArtistID";
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);

            cmdSelect.Parameters.AddWithValue("@ArtistID", Session["Value"]);

            int numRowAffected = (int)cmdSelect.ExecuteScalar();

            if (numRowAffected > 0)
            {
                // return insert success
                // ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Delete successfully! " + "');", true);


            }
            else
            {
                Label1.Text = "No record found";
            }
            con.Close();
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
             
            DataRowView datarow = (DataRowView)e.Item.DataItem;
            string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])datarow["Image"]);
            (e.Item.FindControl("Image1") as Image).ImageUrl = imageUrl;

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                //validation for delete(needed)
                SqlConnection con;
                string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strcon);

                try
                {
                    string selectedDraw = e.CommandArgument.ToString();
                    con.Open();
                    string strSelect = "DELETE from Gallery Where DrawID=@DrawID and ArtistID = @ArtistID";
                    SqlCommand cmdSelect = new SqlCommand(strSelect, con);

                    cmdSelect.Parameters.AddWithValue("@ArtistID", Session["Value"]);
                    cmdSelect.Parameters.AddWithValue("@DrawID", selectedDraw);

                    int numRowAffected = cmdSelect.ExecuteNonQuery();


                    if (numRowAffected > 0)
                    {
                        // return insert success
                        // ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Delete successfully! " + "');", true);
                        Response.Redirect("GalleryArtist.aspx");
                    }
                    else
                    {
                        // return insert failed
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Delete failed! " + "');", true);
                    }
                    con.Close();
                }catch(Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Cannot be deleted! " + "');", true);
                }
                
            }
            else if (e.CommandName == "Edit")
            {
                
                Response.Redirect("EditDrawingArtist.aspx?id=" + e.CommandArgument.ToString());

            }
            else
            {
                Response.Redirect("CustomerArtManagement.aspx?id=" + e.CommandArgument.ToString());
            }
        }
    }
}