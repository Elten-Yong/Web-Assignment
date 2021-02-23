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
           
            
            //SqlConnection con;
            //string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //con = new SqlConnection(strcon);

            //con.Open();

            //string strSelect = "Select * from Gallery where DrawID=@DrawID";

            //SqlCommand cmdSelect = new SqlCommand(strSelect, con);

            //cmdSelect.Parameters.AddWithValue("@DrawID", "DR1");

            //SqlDataReader dtrGallery = cmdSelect.ExecuteReader();

            //String msg = "";

            //for (int count = 0; count < 2; count++)
            //{

            //    if (dtrGallery.HasRows)
            //    {
            //        while (dtrGallery.Read())
            //        {
            //            msg = "Draw Name = " + dtrGallery["Name"].ToString();
            //            byte[] imgBytes = (byte[])dtrGallery["Image"];
            //            string strBase64 = Convert.ToBase64String(imgBytes);
                       
            //        }
            //    }
            //}
            //con.Close();
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
                    Response.Redirect("confirmOrder.aspx?id=" + e.CommandArgument);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "log in first! " + "');", true);
                }
            }
            else
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
                    string strSelectChecking = "Select * from WishlistGallery Where DrawID=@DrawID and CustomerID = @CustomerID";
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
                                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Already added! " + "');", true);
                            }
                        }
                    }

                    con.Close();

                    //insert value
                    if (!duplicate)
                    {
                        con.Open();

                        string strInsert = "Insert into WishlistGallery (CustomerID, DrawID,Date) Values (@CustomerID, @DrawID,@Date)";

                        SqlCommand cmdInsert = new SqlCommand(strInsert, con);
                        cmdInsert.Parameters.AddWithValue("@CustomerID", Session["Value"]);
                        cmdInsert.Parameters.AddWithValue("@DrawID", addedDraw);
                        cmdInsert.Parameters.AddWithValue("@Date", DateTime.Now);

                        int numRowAffected = cmdInsert.ExecuteNonQuery();
                        if (numRowAffected > 0)
                        {
                            // return insert success
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Added successfully! " + "');", true);
                        }
                        else
                        {
                            // return insert failed
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "update failed! " + "');", true);
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
        }
    }
}