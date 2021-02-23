using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Practical_Assignment
{
    public partial class confirmOrder : System.Web.UI.Page
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
            if (e.CommandName == "BuyDrawing")
            {
                if (Session["Value"] != null && Session["Value"] != "0")
                {
                    SqlConnection con;
                    string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    con = new SqlConnection(strcon);
                    string addedDraw = e.CommandArgument.ToString();
                    Boolean duplicate = false;
                    //checking value
                    con.Open();
                    string strSelectChecking = "Select * from CartGallery Where DrawID=@DrawID and CustomerID = @CustomerID";
                    SqlCommand cmdSelect = new SqlCommand(strSelectChecking, con);

                    cmdSelect.Parameters.AddWithValue("@CustomerID", Session["Value"]);
                    cmdSelect.Parameters.AddWithValue("@DrawID", addedDraw);

                    SqlDataReader dtr = cmdSelect.ExecuteReader();

                    if (dtr.HasRows)
                    {
                        while (dtr.Read())
                        {
                            if (addedDraw.Equals(dtr["DrawID"]) && Session["Value"].Equals(dtr["CustomerID"]))
                            {
                                duplicate = true;
                                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Already bought! " + "');", true);
                            }
                        }
                    }

                    con.Close();

                    //insert value
                    if (!duplicate)
                    {
                        con.Open();

                        string strInsert = "Insert into CartGallery (CustomerID, DrawID, Name, Price, Image) Values (@CustomerID, @DrawID, @Name, @Price, @Image)";

                        SqlCommand cmdInsert = new SqlCommand(strInsert, con);
                        cmdInsert.Parameters.AddWithValue("@CustomerID", Session["Value"]);
                        cmdInsert.Parameters.AddWithValue("@DrawID", addedDraw);
                        cmdInsert.Parameters.AddWithValue("@Name", "Name");
                        cmdInsert.Parameters.AddWithValue("@Price", "Price");
                        cmdInsert.Parameters.AddWithValue("@Image", "Image");
                        int numRowAffected = cmdInsert.ExecuteNonQuery();
                        if (numRowAffected > 0)
                        {
                            // return insert success
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Bought successfully! " + "');", true);
                        }
                        else
                        {
                            // return insert failed
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Bought failed! " + "');", true);
                        }
                        con.Close();
                    }
                }
                else
                {
                    // not allow to add, please sign in first
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "log in first! " + "');", true);
                }
            }
            else
            {
                Response.Redirect("Gallery.aspx");
            }
        }
    }
}