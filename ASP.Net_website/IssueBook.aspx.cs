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
    public partial class IssueBook : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        string s = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {


            lblIssue.Text = "";


          
           
            if (Session["Username"] != null)
            {
                txtnm.Text = Session["Username"].ToString();
            }


            if (Request.QueryString["bid"] != null)
            {
                getcon();
                int bId = Convert.ToInt32(Request.QueryString["bid"]);

                da = new SqlDataAdapter("SELECT * FROM Add_Books_tbl WHERE Book_Id='" + bId + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    txtbook.Text = ds.Tables[0].Rows[0]["Book_Name"].ToString();

                    if (ds.Tables[0].Rows[0]["Book_Cat_Id"] != DBNull.Value)
                    {
                        ddlCat.Value = ds.Tables[0].Rows[0]["Book_Cat_Id"].ToString();
                    }
                }
                con.Close();
            }


            if (Request.QueryString["catid"] != null)
            {
                ddlCat.Value = Request.QueryString["catid"].ToString();
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {

           
            getcon();

            
            string q = "INSERT INTO IssueReturn_tbl (StudentName, BookName, IssueDate, ReturnDate, Status, FineAmount) VALUES ('" + txtnm.Text + "', '" + txtbook.Text + "', '" + TextBox1.Text + "', '" + TextBox2.Text + "', 'Pending', 0)";
            cmd = new SqlCommand(q, con);
            cmd.ExecuteNonQuery();

            
            if (Request.QueryString["bid"] != null)
            {
                string updateQuery = "UPDATE Add_Books_tbl SET Book_Copies = Book_Copies - 1 WHERE Book_Id='" + Request.QueryString["bid"] + "'";
                SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                updateCmd.ExecuteNonQuery();
            }

            con.Close();

            
            //Session["Username"] = null;
            txtnm.Text = "";
            txtbook.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";

            
            Response.Redirect("IssueBook.aspx");
        }

    }
}