using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practical_Assignment
{
    public class Global // Global variable
    {
        public static int i = 1;
        public static string accountType;

    }


    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(Global.i == 0)
            {
                Session["Value"] = "0";
                Session["Bar"] = "C"; // for taskbar choosing
                Global.i = 1;
            }
        }
    }
}