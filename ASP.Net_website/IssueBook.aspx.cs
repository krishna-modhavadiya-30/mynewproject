using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.Net_website
{
    public partial class IssueBook : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {


            
            lblIssue.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            getcon();

            string q = "INSERT INTO IssueReturn_tbl (StudentName, BookName, IssueDate, ReturnDate, Status, FineAmount) VALUES ('" + txtnm.Text + "', '" + txtbook.Text + "', '" + TextBox1.Text + "', '" + TextBox2.Text + "', 'Pending', 0)";

            cmd = new SqlCommand(q, con);
            cmd.ExecuteNonQuery();
            con.Close();

          
            Response.Redirect("IssueBook.aspx?msg=success");
        }
    }
}