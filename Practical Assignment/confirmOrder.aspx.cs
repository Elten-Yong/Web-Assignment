using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;

namespace Practical_Assignment
{
    public partial class confirmOrder : System.Web.UI.Page
    {
        string address = "";
        string Drawid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            loadAddress();
             Drawid = HttpContext.Current.Request.QueryString["id"].ToString();
            //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + DateTime.Now.ToString() + "');", true);
        }
        private void loadAddress()
        {
            SqlConnection con;
            string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strcon);

            try
            {
                con.Open();
                string strSelect = "SELECT Address from Customer Where CustomerID = @CustomerID";
                SqlCommand cmdSelect = new SqlCommand(strSelect, con);

                //cmdSelect.Parameters.AddWithValue("@CustomerID", Session["Value"]);

                cmdSelect.Parameters.AddWithValue("@CustomerID", Session["Value"]);
                address = cmdSelect.ExecuteScalar().ToString();
                con.Close();

                Label1.Text = address.ToString();
            }
            catch (Exception ex)
            {
                Label1.Text = "";
            }

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

            }
            else
            {
                //Response.Redirect("Gallery.aspx");
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string messageContent = "";
            if (address != null && address != "")
            {
                if (RadioButtonList1.SelectedValue.Equals("Master/Visa Card") || RadioButtonList1.SelectedValue.Equals("Online Banking"))
                {
                    SqlConnection con;
                    string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    con = new SqlConnection(strcon);
                    con.Open();

                    //extract the total row of order 
                    string strSelect = "SELECT count(OrderID) FROM [Order]";
                    SqlCommand cmdSelect = new SqlCommand(strSelect, con);

                    //int total = (int)cmdSelect.ExecuteScalar() + 1;
                    int total = (int)cmdSelect.ExecuteScalar();
                    con.Close();

                    //the new data order id
                    int newIndex =  total + 1;
                    string orderID = "OR" + newIndex.ToString();

                    con.Open();
                    string strSelect1 = "SELECT Price From Gallery Where DrawID = @DrawID";
                    SqlCommand cmdSelect1 = new SqlCommand(strSelect1, con);
                   cmdSelect1.Parameters.AddWithValue("@DrawID", Drawid);

                    System.Decimal totalPrice = (System.Decimal)cmdSelect1.ExecuteScalar();
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
                    cmdInsert1.Parameters.AddWithValue("@DrawID", Drawid);
                    cmdInsert1.Parameters.AddWithValue("@Quantity", 1);
                    cmdInsert1.Parameters.AddWithValue("@Price", totalPrice);
                    numRowAffected = cmdInsert1.ExecuteNonQuery();
                    con.Close();

                    if (numRowAffected > 0)
                    {
                        //extract item quantity 
                        messageContent = "You have bought 1 piece of art which the ID is" + Drawid + " with a total of RM" + totalPrice;
                        con.Open();
                        string strSelectTotal = "SELECT Total FROM [Gallery] Where DrawID = @DrawID1";
                        SqlCommand cmdSelectTotal = new SqlCommand(strSelectTotal, con);
                        cmdSelectTotal.Parameters.AddWithValue("@DrawID1", Drawid);
                        int totalQuantity = (int)cmdSelectTotal.ExecuteScalar() - 1;
                        con.Close();

                        //delete and update the item quantity
                        con.Open();
                        string strSelectUpdate = "UPDATE [Gallery] SET Total = @Total WHERE DrawID = @DrawID2";
                        SqlCommand cmdSelectUpdate = new SqlCommand(strSelectUpdate, con);
                       cmdSelectUpdate.Parameters.AddWithValue("@DrawID2", Drawid);
                        cmdSelectUpdate.Parameters.AddWithValue("@Total", totalQuantity);
                        int n = cmdSelectUpdate.ExecuteNonQuery();
                        con.Close();

                        MailMessage message = new MailMessage("testingg726@gmail.com", "testingg726@gmail.com", "Thank You for making purchased", messageContent); // to , from, subject, text
                        message.IsBodyHtml = true;

                        SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                        client.UseDefaultCredentials = false;
                        client.EnableSsl = true;
                        client.Credentials = new System.Net.NetworkCredential("testingg726@gmail.com", "abcd.1234");
                        client.Send(message);

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
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please select a payment methos first! " + "');", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Please insert your delivery address first " + "');", true);
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Gallery.aspx");
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedValue.Equals("Master/Visa Card"))
            {
                TextBox1.Visible = true;
            }
            else
            {
                TextBox1.Visible = false;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfile.aspx");
        }
    }
}