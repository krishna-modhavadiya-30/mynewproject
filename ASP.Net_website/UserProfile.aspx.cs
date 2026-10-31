using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

namespace ASP.Net_website
{
    public partial class UserProfile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        private CrystalDecisions.CrystalReports.Engine.ReportDocument cr
        = new ReportDocument();
        static string Crypath = "";
        void getcon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                LoadUserData();
                LoadStudentBookHistory();
            }
            else
            {
                Response.Redirect("UserLogin.aspx");
            }
        }

        private void LoadUserData()
        {
            getcon();

            string name = Session["Username"].ToString();
            string email = Session["Email"] != null ? Session["Email"].ToString() : "";

            lblUsername.Text = name;
            lblEmail.Text = email;

            if (name != "")
            {
                lblAvatar.Text = name.Substring(0, 1).ToUpper();
            }

            string q = "SELECT Id FROM [user] WHERE Name='" + name + "' OR Email='" + email + "'";
            cmd = new SqlCommand(q, con);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblUserID.Text = dr["Id"].ToString();
            }

            con.Close();
        }

        private void LoadStudentBookHistory()
        {
            getcon();

            string q = "SELECT BookName, IssueDate, ReturnDate, Status FROM IssueReturn_tbl WHERE StudentName='" + Session["Username"].ToString() + "'";

            da = new SqlDataAdapter(q, con);
            ds = new DataSet();
            da.Fill(ds);

            gridStudentBooks.DataSource = ds;
            gridStudentBooks.DataBind();

            con.Close();
        }


        protected void btnUserReport_Click(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                getcon();

                string studentName = Session["Username"].ToString();
                string query = "SELECT BookName, IssueDate, ReturnDate, Status FROM IssueReturn_tbl WHERE StudentName='" + studentName + "'";

                da = new SqlDataAdapter(query, con);
                ds = new DataSet();
                da.Fill(ds, "IssueReturn_tbl");

                string xmlPath = Server.MapPath("~/UserBookHistoryData.xml");
                ds.WriteXmlSchema(xmlPath);
                con.Close();

                ReportDocument cr = new ReportDocument();

                string rptPath = Server.MapPath("~/userdata.rpt");
                cr.Load(rptPath);
                cr.SetDataSource(ds.Tables["IssueReturn_tbl"]);
                cr.Refresh();

                cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, studentName + "_Book_History_Report");
            }
        }

        protected void btnBackHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("UserLogin.aspx");
        }
    }
}