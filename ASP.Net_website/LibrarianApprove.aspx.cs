using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web.Design;

namespace ASP.Net_website
{
    public partial class LibrarianApprove : System.Web.UI.Page
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
            con.Open();
        }

        void fillgrid()
        {
            getcon();
            da = new SqlDataAdapter("select * from IssueReturn_tbl where Status='Pending'", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (ViewState["gridLoaded"] == null)
            {
                fillgrid();
                ViewState["gridLoaded"] = true;
            }

        }

        protected void ddlRequests_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_approve")
            {
                getcon();

                cmd = new SqlCommand("update IssueReturn_tbl set Status='Approved' where IssueId='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();


                fillgrid();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();

           
            da = new SqlDataAdapter("select * from IssueReturn_tbl where Status='Approved'", con);
            ds = new DataSet();
            da.Fill(ds, "IssueReturn_tbl"); 

           
            string s = Server.MapPath("~/IssuedBooksData.xml");
            ds.WriteXmlSchema(s);

            con.Close();

           
            GridView1.DataSource = ds;
            GridView1.DataBind();

            string path = Server.MapPath("~/lbrn_issue.rpt");
            cr.Load(path);
            cr.SetDataSource(ds.Tables[0]);
            cr.Refresh();
            CrystalReportViewer1.ReportSource = cr;
            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat,
            Response, true, "student_issue ");
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }
}