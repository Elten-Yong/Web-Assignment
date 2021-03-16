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
            //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + DateTime.Now.ToString() + "');", true);
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

                //extract the total row of order 
                string strSelect = "SELECT MAX(OrderID) FROM [Order]";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);

                //int total = (int)cmdSelect.ExecuteScalar() + 1;
                string total = cmdSelect.ExecuteScalar().ToString();
                con.Close();

                //the new data order id
                int newIndex = int.Parse(total.Remove(0, 2)) + 1;
                string orderID = "OR" + newIndex.ToString();

                con.Open();
                string strSelect1 = "SELECT Price From Gallery Where DrawID = @DrawID";
                SqlCommand cmdSelect1 = new SqlCommand(strSelect1, con);
                cmdSelect1.Parameters.AddWithValue("@DrawID", e.CommandArgument.ToString());

                System.Decimal totalPrice = (System.Decimal) cmdSelect1.ExecuteScalar();
                con.Close();

                con.Open();
                string strInsert = "Insert into [Order] (OrderID,CustomerID,Date,TotalPrice) Values (@OrderID,@CustomerID,@Date,@TotalPrice)";
                SqlCommand cmdInsert = new SqlCommand(strInsert, con);
                cmdInsert.Parameters.AddWithValue("@OrderID", orderID);
                cmdInsert.Parameters.AddWithValue("@CustomerID", Session["Value"]);
                cmdInsert.Parameters.AddWithValue("@Date", DateTime.Now);
                cmdInsert.Parameters.AddWithValue("@TotalPrice", totalPrice);
                int numRowAffected = cmdInsert.ExecuteNonQuery();
                con.Close();

                con.Open();
                string strInsert1 = "Insert into [OrderDetails] (OrderID,DrawID,Quantity,Price) Values (@OrderID,@DrawID,@Quantity,@Price)";
                SqlCommand cmdInsert1 = new SqlCommand(strInsert1, con);

                cmdInsert1.Parameters.AddWithValue("@OrderID", orderID);
                cmdInsert1.Parameters.AddWithValue("@DrawID", e.CommandArgument.ToString());
                cmdInsert1.Parameters.AddWithValue("@Quantity", 1);
                cmdInsert1.Parameters.AddWithValue("@Price", totalPrice);
                numRowAffected = cmdInsert1.ExecuteNonQuery();
                con.Close();

                if (numRowAffected > 0)
                {
                    //extract item quantity 
                    
                    con.Open();
                    string strSelectTotal = "SELECT Total FROM [Gallery] Where DrawID = @DrawID1";
                    SqlCommand cmdSelectTotal = new SqlCommand(strSelectTotal, con);
                    cmdSelectTotal.Parameters.AddWithValue("@DrawID1", e.CommandArgument.ToString());
                    int totalQuantity = (int)cmdSelectTotal.ExecuteScalar() - 1;
                    con.Close();

                    //delete and update the item quantity
                    con.Open();
                    string strSelectUpdate = "UPDATE [Gallery] SET Total = @Total WHERE DrawID = @DrawID2";
                    SqlCommand cmdSelectUpdate = new SqlCommand(strSelectUpdate, con);
                    cmdSelectUpdate.Parameters.AddWithValue("@DrawID2", e.CommandArgument.ToString());
                    cmdSelectUpdate.Parameters.AddWithValue("@Total", totalQuantity);
                    int n = cmdSelectUpdate.ExecuteNonQuery();
                    con.Close();

                    // return insert success
                    //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Successfully bought! " + "');", true);
                    Response.Redirect("OrderHistory.aspx");
                }
                else
                {
                    // return insert failed
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Bought Failed! " + "');", true);
                }
               

            }
            else
            {
                Response.Redirect("Gallery.aspx");
            }

        }
    }
}