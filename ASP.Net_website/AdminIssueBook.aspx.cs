using System;

namespace ASP.Net_website
{
    public partial class AdminIssueBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedIn"] == null || !(bool)Session["AdminLoggedIn"])
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void btnAdminIssue_Click(object sender, EventArgs e)
        {
            lblAdminIssue.Text = "Book issued successfully to " + txtStudentName.Text.Trim() + ".";
            txtStudentName.Text = string.Empty;
            ddlAdminBook.SelectedIndex = 0;
            txtAdminIssueDate.Text = string.Empty;
            txtAdminReturnDate.Text = string.Empty;
        }
    }
}
