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
                //Session["Value"] = "CS2";
                
                SqlConnection con;
                string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strcon);
                con.Open();

                string strSelect = "SELECT count(*) FROM [Order]";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);

                int total = (int)cmdSelect.ExecuteScalar() + 1;
                con.Close();
                //Label7.Text = e.CommandArgument.ToString();

                string orderID = "OR" + total.ToString();
                //Response.Redirect("confirmOrder.aspx?id=" + e.CommandArgument.ToString());
                
                con.Open();
                string strInsert = "Insert into [Order] (OrderID,CustomerID,DrawID,Date) Values (@OrderID,@CustomerID,@DrawID,@Date)";
                SqlCommand cmdInsert = new SqlCommand(strInsert, con);

                cmdInsert.Parameters.AddWithValue("@OrderID", orderID);
                cmdInsert.Parameters.AddWithValue("@CustomerID", Session["Value"]);
                cmdInsert.Parameters.AddWithValue("@DrawID", e.CommandArgument.ToString());
                cmdInsert.Parameters.AddWithValue("@Date", DateTime.Now);

                int numRowAffected = cmdInsert.ExecuteNonQuery();

                if (numRowAffected > 0)
                {
                    //extract item quantity 
                    SqlConnection conn;
                    string strconn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    conn = new SqlConnection(strconn);
                    conn.Open();
                    string strSelectTotal = "SELECT Total FROM [Gallery] Where DrawID = @DrawID1";
                    SqlCommand cmdSelectTotal= new SqlCommand(strSelectTotal, conn);
                    cmdSelectTotal.Parameters.AddWithValue("@DrawID1", e.CommandArgument.ToString());
                    int totalQuantity = (int)cmdSelectTotal.ExecuteScalar() - 1;
                    conn.Close();

                    //delete and update the item quantity
                    conn.Open();
                    string strSelectUpdate = "UPDATE [Gallery] SET Total = @Total WHERE DrawID = @DrawID2";
                    SqlCommand cmdSelectUpdate = new SqlCommand(strSelectUpdate, conn);
                    cmdSelectUpdate.Parameters.AddWithValue("@DrawID2", e.CommandArgument.ToString());
                    cmdSelectUpdate.Parameters.AddWithValue("@Total", totalQuantity);
                    int n = cmdSelectUpdate.ExecuteNonQuery();
                    conn.Close();

                    // return insert success
                    //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Successfully bought! " + "');", true);
                    Response.Redirect("OrderHistory.aspx");
                }
                else
                {
                    // return insert failed
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Bought Failed! " + "');", true);
                }
                con.Close();
            }
            else
            {
                Response.Redirect("Gallery.aspx");
            }
        }
    }
}