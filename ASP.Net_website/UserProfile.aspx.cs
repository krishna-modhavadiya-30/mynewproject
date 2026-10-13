using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.Net_website
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["Username"] != null)
                {
                    LoadUserData();
                }
                else
                {

                    Response.Redirect("UserLogin.aspx");
                }
            }
        }
        
        private void LoadUserData()
        {
            
            string name = Convert.ToString(Session["Username"]);
            string email = Convert.ToString(Session["Email"]);
            string userid = Convert.ToString(Session["UserID"]);

            
            lblUsername.Text = name;
            lblEmail.Text = email;
            lblUserID.Text = userid;

           
            if (name != "")
            {
                lblAvatar.Text = name.Substring(0, 1).ToUpper();
            }

            LoadDummyBookHistory();
        }
        private void LoadDummyBookHistory()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("BookID", typeof(string));
            dt.Columns.Add("BookName", typeof(string));
            dt.Columns.Add("IssueDate", typeof(string));
            dt.Columns.Add("ReturnDate", typeof(string));
            dt.Columns.Add("Status", typeof(string));

            dt.Rows.Add("BK-101", "Clean Code by Robert Martin", "01/02/2026", "15/02/2026", "Returned");
            dt.Rows.Add("BK-204", "ASP.NET Web Development", "10/02/2026", "Pending", "Issued");
            dt.Rows.Add("BK-305", "Database System Concepts", "20/01/2026", "05/02/2026", "Returned");

            gridStudentBooks.DataSource = dt;
            gridStudentBooks.DataBind();
        }
        protected void btnBackHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("UserLogin.aspx");
        }

        protected void gridStudentBooks_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}