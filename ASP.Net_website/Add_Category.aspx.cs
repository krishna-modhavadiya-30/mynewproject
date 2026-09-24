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
    public partial class Add_Category : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string fnm, nm;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
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

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void imgupload()
        {
            fnm = "~/Category_Images/" + fimg.FileName;
            fimg.SaveAs(Server.MapPath(fnm));
        }

        void clear()
        {
            txtcatnm.Text = "";
        }
        

        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();
            imgupload();
            cmd = new SqlCommand("insert into Add_Category_tbl(Cat_Name, Cat_Cover_Img) values('" + txtcatnm.Text + "','" + fnm + "')", con);
            cmd.ExecuteNonQuery();
            clear();
        }
    }
}