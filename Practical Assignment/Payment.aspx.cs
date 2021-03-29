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
using System.Net.Mail;

namespace Practical_Assignment
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadAddress();
        }

        private void loadAddress()
        {
            SqlConnection con;
            string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strcon);

            con.Open();
            string strSelect = "SELECT Address from Customer Where CustomerID = @CustomerID";
            SqlCommand cmdSelect = new SqlCommand(strSelect, con);

            //cmdSelect.Parameters.AddWithValue("@CustomerID", Session["Value"]);

            cmdSelect.Parameters.AddWithValue("@CustomerID", Session["Value"]);
            string address = cmdSelect.ExecuteScalar().ToString();
            con.Close();

            Label1.Text = address.ToString();
           
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            DataRowView datarow = (DataRowView)e.Item.DataItem;
            string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])datarow["Image"]);
            (e.Item.FindControl("Image1") as Image).ImageUrl = imageUrl;
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            
            SqlConnection con;
            string strcon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strcon);
            con.Open();
            string strSelectAddress = "SELECT Address FROM [Customer] Where CustomerID = @CustomerIDAddress";
            SqlCommand cmdSelectAddress = new SqlCommand(strSelectAddress, con);
            cmdSelectAddress.Parameters.AddWithValue("@CustomerIDAddress", Session["Value"]);
            string address = cmdSelectAddress.ExecuteScalar().ToString();
            con.Close();

            if (address!=null) {
                if (RadioButtonList1.SelectedValue.Equals("Master/Visa Card") || RadioButtonList1.SelectedValue.Equals("Online Banking")) {
                    DateTime now = DateTime.Now;
                    int numRowAffected = 0, numRowAffected1 = 0, numRowAffected2 = 0, numRowAffected3 = 0;

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

                    //Extarct totalPrice
                    con.Open();
                    string strSelect5 = "Select SUM(TotalPrice) From CheckOut Where CustomerID = @CustomerID5";
                    SqlCommand cmdSelect5 = new SqlCommand(strSelect5, con);

                    cmdSelect5.Parameters.AddWithValue("@CustomerID5", Session["Value"]);
                    System.Decimal totalPriceCheckOut = (System.Decimal)cmdSelect5.ExecuteScalar();
                    con.Close();

                    //Insert into order
                    con.Open();
                    string strInsert1 = "Insert into [Order] (OrderID,CustomerID,PaymentType,Date,TotalPrice) Values (@OrderID,@CustomerID,@PaymentType,@Date,@TotalPrice)";
                    SqlCommand cmdInsert1 = new SqlCommand(strInsert1, con);

                    cmdInsert1.Parameters.AddWithValue("@OrderID", orderID);
                    cmdInsert1.Parameters.AddWithValue("@CustomerID", Session["Value"]);
                    cmdInsert1.Parameters.AddWithValue("@PaymentType", RadioButtonList1.SelectedValue.ToString());
                    cmdInsert1.Parameters.AddWithValue("@Date", now);
                    cmdInsert1.Parameters.AddWithValue("@TotalPrice", totalPriceCheckOut);
                    int numRowAffected5 = cmdInsert1.ExecuteNonQuery();
                    con.Close();

                    //get the total row in the checkout
                    con.Open();
                    string strSelect1 = "Select Count(*) from CheckOut";
                    SqlCommand cmdSelect1 = new SqlCommand(strSelect1, con);

                    int totalRow = (int)cmdSelect1.ExecuteScalar();
                    con.Close();

                    //insert, update, delete
                    for (int i = 0; i < totalRow; i++)
                    {
                        string draw = "";
                        string totalBought = "";
                        string totalPrice = "";
                        //get the draw id 
                        con.Open();
                        string strSelect2 = "Select MAX(DrawID) from CheckOut";
                        SqlCommand cmdSelect2 = new SqlCommand(strSelect2, con);
                        draw = (string)cmdSelect2.ExecuteScalar();
                        con.Close();

                        //get all the data of the id 
                        con.Open();
                        string strSelect3 = "Select * from CheckOut Where DrawID = @DrawID";
                        SqlCommand cmdSelect3 = new SqlCommand(strSelect3, con);
                        cmdSelect3.Parameters.AddWithValue("@DrawID", draw);
                        SqlDataReader dtr = cmdSelect3.ExecuteReader();

                        if (dtr.HasRows)
                        {
                            while (dtr.Read())
                            {
                                totalBought = dtr["Quantity"].ToString();
                                totalPrice = dtr["TotalPrice"].ToString();
                            }
                        }
                        con.Close();
                        //Label1.Text = totalBought.ToString();
                        //insert into order
                        con.Open();
                        string strInsert = "Insert into [OrderDetails] (OrderID,DrawID,Quantity,Price) Values (@OrderID,@DrawID,@Quantity,@Price)";
                        SqlCommand cmdInsert = new SqlCommand(strInsert, con);

                        cmdInsert.Parameters.AddWithValue("@OrderID", orderID);
                        cmdInsert.Parameters.AddWithValue("@DrawID", draw.ToString());
                        cmdInsert.Parameters.AddWithValue("@Quantity", int.Parse(totalBought));
                        cmdInsert.Parameters.AddWithValue("@Price", totalPrice);
                        numRowAffected = cmdInsert.ExecuteNonQuery();
                        con.Close();

                        // delete check out
                        con.Open();
                        string strDelete = "DELETE from CheckOut Where DrawID = @DrawID and CustomerID = @CustomerID";
                        SqlCommand cmdDelete = new SqlCommand(strDelete, con);
                        cmdDelete.Parameters.AddWithValue("@CustomerID", Session["Value"]);
                        cmdDelete.Parameters.AddWithValue("@DrawID", draw.ToString());
                        numRowAffected1 = cmdDelete.ExecuteNonQuery();
                        con.Close();

                        //delete cart
                        con.Open();
                        string strDelete1 = "DELETE from CartGallery Where DrawID=@DrawID and CustomerID = @CustomerID";
                        SqlCommand cmdDelete1 = new SqlCommand(strDelete1, con);
                        cmdDelete1.Parameters.AddWithValue("@CustomerID", Session["Value"]);
                        cmdDelete1.Parameters.AddWithValue("@DrawID", draw.ToString());
                        numRowAffected2 = cmdDelete1.ExecuteNonQuery();
                        con.Close();

                        //Update the quanity of item
                        //extract the value first 
                        con.Open();
                        string strSelect4 = "Select Total from Gallery Where DrawID = @DrawID";
                        SqlCommand cmdSelect4 = new SqlCommand(strSelect4, con);
                        cmdSelect4.Parameters.AddWithValue("@DrawID", draw);
                        int quantity = (int)cmdSelect4.ExecuteScalar();
                        con.Close();
                        quantity = quantity - int.Parse(totalBought);

                        //update the quantity
                        con.Open();
                        string strUpdate = "UPDATE [Gallery] SET Total = @Total WHERE DrawID = @DrawID";
                        SqlCommand cmdUpdate = new SqlCommand(strUpdate, con);

                        cmdUpdate.Parameters.AddWithValue("@DrawID", draw.ToString());
                        cmdUpdate.Parameters.AddWithValue("@Total", quantity);
                        numRowAffected3 = cmdUpdate.ExecuteNonQuery();
                        con.Close();


                    }

                    if (numRowAffected > 0 && numRowAffected1 > 0 && numRowAffected2 > 0 && numRowAffected3 > 0)
                    {
                        string messageContent = "You have bought " + totalRow + " piece of art with total of RM" + totalPriceCheckOut;
                        //Extract gamil
                        con.Open();
                        string strSelect6 = "Select Email From Customer Where CustomerID = @CustomerID6";
                        SqlCommand cmdSelect6 = new SqlCommand(strSelect6, con);

                        cmdSelect6.Parameters.AddWithValue("@CustomerID6", Session["Value"]);
                        string email = cmdSelect6.ExecuteScalar().ToString();
                        con.Close();

                        MailMessage message = new MailMessage("testingg726@gmail.com", "testingg726@gmail.com", "Thank You for making purchased", messageContent); // to , from, subject, text
                        message.IsBodyHtml = true;

                        SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                        client.UseDefaultCredentials = false;
                        client.EnableSsl = true;
                        client.Credentials = new System.Net.NetworkCredential("testingg726@gmail.com", "abcd.1234"); 
                        client.Send(message);

                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Payment Successfulyly! " + "');", true);
                        Response.Redirect("HomePage.aspx");

                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "update failed! " + "');", true);
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

        protected void EditAddress_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfile.aspx");
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
    }
}