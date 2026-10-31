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
    public partial class BookAvailability : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        
        int totalCopies = 0;

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
           
            LoadStock();
        }

        void LoadStock()
        {
            getcon();

            da = new SqlDataAdapter("SELECT Book_Id, Book_Name, Book_Author, Book_Copies FROM Add_Books_tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            GridViewStock.DataSource = ds;
            GridViewStock.DataBind();
            con.Close();
        }

      
        protected void GridViewStock_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[3].Text != null && e.Row.Cells[3].Text != "&nbsp;")
                {
                    int copies = 0;
                    if (int.TryParse(e.Row.Cells[3].Text, out copies))
                    {
                        totalCopies += copies;
                    }
                }
            }

            
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Text = "TOTAL STOCK";
                e.Row.Cells[0].Font.Bold = true;

                e.Row.Cells[3].Text = totalCopies.ToString();
                e.Row.Cells[3].Font.Bold = true;
                e.Row.Cells[3].ForeColor = System.Drawing.Color.Blue;
            }
        }

        protected void GridViewStock_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

          
        
            getcon();

            
            da = new SqlDataAdapter("SELECT Book_Id, Book_Name, Book_Author, Book_Copies FROM Add_Books_tbl", con);
            ds = new DataSet();
            da.Fill(ds, "Add_Books_tbl");

           
            string xmlPath = Server.MapPath("~/BookAvailabilityData.xml");
            ds.WriteXmlSchema(xmlPath);
            con.Close();

            
            GridViewStock.DataSource = ds;
            GridViewStock.DataBind();

           
            ReportDocument cr = new ReportDocument();
            string path = Server.MapPath("~/book_avl.rpt");
            cr.Load(path);

           
            cr.SetDataSource(ds.Tables["Add_Books_tbl"]);
            cr.Refresh();

            if (CrystalReportViewer1 != null)
            {
                CrystalReportViewer1.ReportSource = cr;
            }

            cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Book_Stock_Report");
        
    }
    }
}