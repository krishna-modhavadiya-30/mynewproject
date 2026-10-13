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
    public partial class Add_Books : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        string fnm, nm;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void imgupload()
        {
            fnm = "~/Book_Images/" + fimg.FileName;
            fimg.SaveAs(Server.MapPath(fnm));
        }

        void fillcombo()
        {
            getcon();
            da = new SqlDataAdapter("select * from Add_Category_tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            drpcatid.DataSource = ds;
            drpcatid.DataTextField = "Cat_Name";
            drpcatid.DataValueField = "Cat_Id";
            drpcatid.DataBind();

            drpcatid.Items.Insert(0, new ListItem("--Select Category--", "0"));
        }

        void clear()
        {
            drpcatid.SelectedIndex = 0;
            bnm.Text = "";
            bauth.Text = "";
            bdesc.Text = "";
            bpric.Text = "";
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (ViewState["combo"] == null)
            {
                fillcombo();
                ViewState["combo"] = true;
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            getcon();
            imgupload();

            cmd = new SqlCommand("insert into Add_Books_tbl(Book_Cat_Id, Book_Name, Book_Author, Book_Desc, Book_Price, Book_Img) values('" + drpcatid.SelectedValue + "', '" + bnm.Text + "', '" + bauth.Text + "', '" + bdesc.Text + "', '" + bpric.Text + "', '" + fnm + "')", con);
            cmd.ExecuteNonQuery();

            clear();
        }
    }
}