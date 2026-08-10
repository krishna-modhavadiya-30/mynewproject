using System;
using System.Data;

namespace ASP.Net_website
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedIn"] == null || !(bool)Session["AdminLoggedIn"])
            {
                Response.Redirect("Home.aspx");
                return;
            }

            if (!IsPostBack)
            {
                DataTable records = Application["IssuedBooks"] as DataTable;
                gvIssuedBooks.DataSource = records;
                gvIssuedBooks.DataBind();
            }
        }
    }
}
