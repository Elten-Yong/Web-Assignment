using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practical_Assignment
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SignUpMultiView.ActiveViewIndex = 0;
        }

        protected void btnArtist_Click(object sender, EventArgs e)
        {
            changeView();
        }

        protected void btnCustomer_Click(object sender, EventArgs e)
        {
            changeView();
        }
        protected void changeView()
        {
            SignUpMultiView.ActiveViewIndex = 1; // Use to change the view to register form
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }
    }
}