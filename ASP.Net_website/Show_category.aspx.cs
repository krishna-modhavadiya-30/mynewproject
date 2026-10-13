using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ASP.Net_website
{
    public partial class Show_category : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        string nm;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)

        {

           
            filldatalis();


            if (Session["admin"] != null)
            {
                getcon();
                da = new SqlDataAdapter("select * from [user] where Email='" + Session["admin"] + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    nm = ds.Tables[0].Rows[0]["Name"].ToString();
                    
                }
            }
           
        }
        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void filldatalis()
        {
            getcon();
            da = new SqlDataAdapter("select * from Add_Category_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
        }


        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}