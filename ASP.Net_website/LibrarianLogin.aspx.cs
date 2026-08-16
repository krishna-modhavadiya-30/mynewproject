using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.Net_website
{
    public partial class LibrarianLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

          
            if (txtEmail.Text == "librarian@gmail.com" && txtPass.Text == "Librarian123")
            {
                Session["LibrarianUser"] = txtEmail.Text;
                Response.Redirect("~/Librarian_deshboard.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid Email or Password!";
            }
        }
    }
}