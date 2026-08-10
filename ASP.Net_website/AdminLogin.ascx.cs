using System;

namespace ASP.Net_website
{
    public partial class AdminLogin : System.Web.UI.UserControl
    {
        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            if (txtAdminEmail.Text.Trim().Equals("admin@library.com", StringComparison.OrdinalIgnoreCase)
                && txtAdminPassword.Text == "Admin@123")
            {
                Session["AdminLoggedIn"] = true;
                Session["AdminUser"] = "Administrator";
                Response.Redirect("AdminDashboard.aspx");
                return;
            }

            lblAdminMessage.Text = "Invalid admin email or password.";
            lblAdminMessage.Visible = true;
            OpenLoginModal();
        }

        private void OpenLoginModal()
        {
            Page.ClientScript.RegisterStartupScript(
                GetType(),
                "openAdminLoginModal",
                "window.addEventListener('load', function () { var modal = document.getElementById('adminLoginModal'); if (modal && window.bootstrap) { new bootstrap.Modal(modal).show(); } });",
                true);
        }
    }
}
