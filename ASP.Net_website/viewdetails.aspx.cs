using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.Net_website
{
    public partial class viewdetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        string nm;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (ViewState["isLoaded"] == null)
            {
                if (Request.QueryString["bid"] != null)
                {
                    getcon();
                    fillproduct();

                   
                    ViewState["isLoaded"] = true;
                }
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
        }

        void fillproduct()
        {
            int bid = Convert.ToInt32(Request.QueryString["bid"]);

            da = new SqlDataAdapter("SELECT * FROM Add_Books_tbl WHERE Book_Id = " + bid, con);
            ds = new DataSet();
            da.Fill(ds);

            DataList1.DataSource = ds;
            DataList1.DataBind();
        }



        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_issue")
            {

              
                
                    int bookId = Convert.ToInt32(e.CommandArgument);
                  
                    Response.Redirect("issuebook.aspx?bid=" + bookId);
                
            }
        }
    }
}