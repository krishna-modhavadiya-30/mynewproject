using CrystalDecisions.Shared;
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
    public partial class Admin_Contact : System.Web.UI.Page
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
            da = new SqlDataAdapter("select * from contact", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {


            

          fillgrid();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_dlt")
            {
                getcon();
                cmd = new SqlCommand("delete from contact where id='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();

                fillgrid();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            getcon();
            da = new SqlDataAdapter("select * from contact", con);
            ds = new DataSet();
            da.Fill(ds);

            string s = Server.MapPath("~/ContactData.xml");
            ds.WriteXmlSchema(s);
            con.Close();

            GridView1.DataSource = ds;
            GridView1.DataBind();

           
            ReportDocument cr = new ReportDocument();
            string path = Server.MapPath("~/admin_contact.rpt");
            cr.Load(path);
            cr.SetDataSource(ds.Tables[0]);
            cr.Refresh();

            CrystalReportViewer1.ReportSource = cr;

            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Contact_Messages_Report");
        }
    }
    }
