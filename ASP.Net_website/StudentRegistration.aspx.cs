using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.Net_website
{
    public partial class StudentRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          

            if (Request.QueryString["registration"] == "success")
            {
                lblStatus.Text = "<b>Status:</b> Registration Successful!<br />" +
                                 "<b>Name:</b> " + Session["RegName"] + "<br />" +
                                 "<b>Email:</b> " + Session["RegEmail"];
            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
           

            Session["RegName"] = txtnm.Text;
            Session["RegEmail"] = txtEmail.Text;

        
            Response.Redirect("StudentRegistration.aspx?registration=success");
        }
    }
}