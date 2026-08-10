using System;

namespace ASP.Net_website
{
    public partial class AdminReturnBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedIn"] == null || !(bool)Session["AdminLoggedIn"])
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void btnAdminReturn_Click(object sender, EventArgs e)
        {
            lblAdminReturn.Text = "Book returned successfully from " + txtAdminReturnStudent.Text.Trim() + ".";
            txtAdminReturnStudent.Text = string.Empty;
            ddlAdminReturnBook.SelectedIndex = 0;
            txtAdminReturnDate.Text = string.Empty;
            txtAdminFine.Text = string.Empty;
        }
    }
}
