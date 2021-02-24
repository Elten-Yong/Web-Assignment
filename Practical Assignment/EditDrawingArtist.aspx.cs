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
	public partial class EditDrawingArtist : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            DataRowView datarow = (DataRowView)e.Item.DataItem;
            string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])datarow["Image"]);
            (e.Item.FindControl("Image1") as Image).ImageUrl = imageUrl;
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ConfirmEdit")
            {
                SqlConnection con;
                string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strcon);

                string selectedDraw = e.CommandArgument.ToString();
                con.Open();

                string strUpdate = "Update Gallery SET Name=@Name, Description=@Description, Total=@Total, Price=@Price WHERE DrawID=@DrawID";
                SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);

                cmdUpdate.Parameters.AddWithValue("@DrawID", selectedDraw);
                cmdUpdate.Parameters.AddWithValue("@Name", NameTxt.Text);
                cmdUpdate.Parameters.AddWithValue("@Description", DescriptionTxt.Text);
                cmdUpdate.Parameters.AddWithValue("@Total", QuantityTxt.Text);
                cmdUpdate.Parameters.AddWithValue("@Price", PriceTxt.Text);

                int numRowAffected = cmdUpdate.ExecuteNonQuery();

                if (numRowAffected > 0)
                {
                    // return insert success
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Edited! " + "');", true);
                    Response.Redirect("GalleryArtist.aspx");
                }
                else
                {
                    // return insert failed
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Edit failed! " + "');", true);
                }
                con.Close();


            }
        }

        
    }
}