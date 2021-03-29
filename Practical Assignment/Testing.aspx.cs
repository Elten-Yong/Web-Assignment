using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Practical_Assignment
{
    public partial class Testing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MailMessage message = new MailMessage("testingg726@gmail.com", "eltenyong15@gmail.com", "Testing", "Testing"); // to , from, subject, text
            message.IsBodyHtml = true;

            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.UseDefaultCredentials = false;
            client.EnableSsl = true;
            client.Credentials = new System.Net.NetworkCredential("testingg726@gmail.com", "abcd.1234"); // gmail and password
            client.Send(message);
        }
    }
}