using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.Net_website
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            
            if (Request.QueryString["success"] == "true")
            {
                if (Session["ContactName"] != null)
                {
                    lblContactStatus.Text = "<b>Status:</b> Message Sent Successfully!<br />" +
                                            "<b>Name:</b> " + Session["ContactName"] + "<br />" +
                                            "<b>Email:</b> " + Session["ContactEmail"] + "<br />" +
                                            "<b>Message:</b> " + Session["ContactMsg"];

                    
                    Session.Remove("ContactName");
                    Session.Remove("ContactEmail");
                    Session.Remove("ContactMsg");
                }
            }
            else
            {
               
                lblContactStatus.Text = "";
            }
        }

        protected void txtMessage_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
           
            Session["ContactName"] = txtName.Text;
            Session["ContactEmail"] = txtEmail.Text;
            Session["ContactMsg"] = txtMessage.Text;

          
            Response.Redirect("Contact.aspx?success=true");
        }
    }
}