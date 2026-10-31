using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

namespace ASP.Net_website
{
    public partial class Admin_report : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

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

        }

       
        protected void btnBookStock_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("SELECT Book_Id, Book_Name, Book_Author, Book_Copies FROM Add_Books_tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            string xmlPath = Server.MapPath("~/BookAvailabilityData.xml");
            ds.WriteXmlSchema(xmlPath);
            con.Close();

            ReportDocument cr = new ReportDocument();
            string path = Server.MapPath("~/book_avl.rpt");
            cr.Load(path);
            cr.SetDataSource(ds.Tables[0]);
            cr.Refresh();

            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Book_Stock_Report");
        }

        
        protected void btnApproved_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("select * from IssueReturn_tbl where Status='Approved'", con);
            ds = new DataSet();
            da.Fill(ds);

            string xmlPath = Server.MapPath("~/ApprovedBooksData.xml");
            ds.WriteXmlSchema(xmlPath);
            con.Close();

            ReportDocument cr = new ReportDocument();
            string path = Server.MapPath("~/lbrn_issue.rpt");
            cr.Load(path);
            cr.SetDataSource(ds.Tables[0]);
            cr.Refresh();

            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Approved_Books_Report");
        }

        
        protected void btnReturned_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM IssueReturn_tbl WHERE Status='Returned'", con);
            ds = new DataSet();
            da.Fill(ds);

            string xmlPath = Server.MapPath("~/ReturnedBooksData.xml");
            ds.WriteXmlSchema(xmlPath);
            con.Close();

            ReportDocument cr = new ReportDocument();
            string path = Server.MapPath("~/lbrn_return.rpt");
            cr.Load(path);
            cr.SetDataSource(ds.Tables[0]);
            cr.Refresh();

            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Returned_Books_Report");
        }

      
        protected void btnStudents_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM [user]", con);
            ds = new DataSet();
            da.Fill(ds);

            string xmlPath = Server.MapPath("~/ActiveUserData.xml");
            ds.WriteXmlSchema(xmlPath);
            con.Close();

            ReportDocument cr = new ReportDocument();
            string path = Server.MapPath("~/active_std.rpt");
            cr.Load(path);
            cr.SetDataSource(ds.Tables[0]);
            cr.Refresh();

            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Active_Students_Report");
        }

        
        protected void btnContact_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM contact", con);
            ds = new DataSet();
            da.Fill(ds);

            string xmlPath = Server.MapPath("~/ContactData.xml");
            ds.WriteXmlSchema(xmlPath);
            con.Close();

            ReportDocument cr = new ReportDocument();
            string path = Server.MapPath("~/admin_contact.rpt");
            cr.Load(path);
            cr.SetDataSource(ds.Tables[0]);
            cr.Refresh();

            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Contact_Messages_Report");
        }

       
        protected void btnUserData_Click(object sender, EventArgs e)
        {
            getcon();
            da = new SqlDataAdapter("SELECT BookName, IssueDate, ReturnDate, Status FROM IssueReturn_tbl", con);
            ds = new DataSet();
            da.Fill(ds, "IssueReturn_tbl");

            string xmlPath = Server.MapPath("~/UserBookHistoryData.xml");
            ds.WriteXmlSchema(xmlPath);
            con.Close();

            ReportDocument cr = new ReportDocument();
            string path = Server.MapPath("~/userdata.rpt");
            cr.Load(path);
            cr.SetDataSource(ds.Tables["IssueReturn_tbl"]);
            cr.Refresh();

            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Student_History_Report");
        }
    }
}