using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.Net_website
{
    public partial class IssueBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           

            string student = txtnm.Text;
            string book = DropDownList1.SelectedItem.Text;
            string issueDate = TextBox1.Text;
            string returnDate = TextBox2.Text;

            lblIssue.Text = "<h4>Book Issued Successfully!</h4><br/>" +
                            "<b>Student Name:</b> " + student + "<br/>" +
                            "<b>Book Name:</b> " + book + "<br/>" +
                            "<b>Issue Date:</b> " + issueDate + "<br/>" +
                            "<b>Return Date:</b> " + returnDate;

         
            txtnm.Text = "";
            DropDownList1.SelectedIndex = 0;
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
    }
}