using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.Net_website
{
    public partial class ReturnBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["return"] == "success")
            {
                lblReturnStatus.Text = "<b>Status:</b> Book Returned Successfully!<br />" +
                                       "<b>Student Name:</b> " + Session["StudentName"] + "<br />" +
                                       "<b>Book Name:</b> " + Session["BookName"] + "<br />" +
                                       "<b>Return Date:</b> " + Session["ReturnDate"] + "<br />" +
                                       "<b>Fine Charged:</b> ₹" + Session["FineAmount"];
            }
        }

        protected void btnReturnBook_Click(object sender, EventArgs e)
        {
           
            Session["StudentName"] = txtStudent.Text;
            Session["BookName"] = txtbook.Text;
            Session["ReturnDate"] = txtReturnDate.Text;
            Session["FineAmount"] = string.IsNullOrEmpty(txtFineAmount.Text) ? "0" : txtFineAmount.Text;

            Response.Redirect("ReturnBook.aspx?return=success");
        }
    }
}