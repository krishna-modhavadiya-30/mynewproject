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

namespace ASP.Net_website.css
{
    public partial class Librarian_Returnbook : System.Web.UI.Page
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
            da = new SqlDataAdapter("select * from IssueReturn_tbl where Status='Returned'", con);
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int issueId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            getcon();
            
            cmd = new SqlCommand("delete from IssueReturn_tbl where IssueId=" + issueId, con);
            cmd.ExecuteNonQuery();
            con.Close();

            
            ViewState["gridLoaded"] = null;
            Response.Redirect("Librarian_Returnbook.aspx?deleted=true");
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
          
            getcon();
            da = new SqlDataAdapter("select * from IssueReturn_tbl where Status='Returned'", con);
            ds = new DataSet();
            da.Fill(ds);

            
            string s = Server.MapPath("~/ReturnedBooksData.xml");
            ds.WriteXmlSchema(s);
            con.Close();

            
            GridView1.DataSource = ds;
            GridView1.DataBind();

          
            ReportDocument cr = new ReportDocument();
            string path = Server.MapPath("~/lbrn_return.rpt");
            cr.Load(path);
            cr.SetDataSource(ds.Tables[0]);
            cr.Refresh();

           
            CrystalReportViewer1.ReportSource = cr;
            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Returned_Books_Report");
        }
    }
}