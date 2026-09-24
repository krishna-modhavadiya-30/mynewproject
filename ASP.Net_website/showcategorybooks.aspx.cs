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
    public partial class showcategorybooks : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        string nm;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

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

          
            if (!IsPostBack)
            {
                filldatalis();
            }

            if (Session["admin"] != null)
            {
                getcon();

                da = new SqlDataAdapter("select * from [user] where Email='" + Session["admin"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    nm = ds.Tables[0].Rows[0]["Name"].ToString();
                    Label1.Text = "Welcome " + nm;
                }
            }
        }

        void filldatalis()
        {
            if (Request.QueryString["catid"] != null)
            {
                getcon();
                int id = Convert.ToInt32(Request.QueryString["catid"]);
                da = new SqlDataAdapter("select * from Add_Books_tbl where Book_Cat_Id='" + id + "'", con);
                ds = new DataSet();
                da.Fill(ds);
                DataList1.DataSource = ds;
                DataList1.DataBind();
            }
        }

       
        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}