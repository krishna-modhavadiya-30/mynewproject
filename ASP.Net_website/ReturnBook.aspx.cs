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
    public partial class ReturnBook : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

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

            {

                {
                    lblReturn.Text = "";
                }
            }
        }


        protected void btnReturnBook_Click(object sender, EventArgs e)
        {


        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            getcon();



           


            getcon();

            string q = "UPDATE IssueReturn_tbl SET ReturnDate='" + TextBox1.Text.Trim() + "', Status='Returned' WHERE StudentName='" + txtnm.Text.Trim() + "' AND BookName='" + txtbook.Text.Trim() + "' AND Status='Approved'";

            cmd = new SqlCommand(q, con);
            int rows = cmd.ExecuteNonQuery();

            if (rows > 0)
            {
                
                string updateStock = "UPDATE Add_Books_tbl SET Book_Copies = Book_Copies + 1 WHERE Book_Name='" + txtbook.Text.Trim() + "'";
                SqlCommand stockCmd = new SqlCommand(updateStock, con);
                stockCmd.ExecuteNonQuery();

                con.Close();

                txtnm.Text = "";
                txtbook.Text = "";
                TextBox1.Text = "";

                Response.Redirect("ReturnBook.aspx?msg=success");
            }
            else
            {
                con.Close();
               
                Response.Redirect("ReturnBook.aspx?msg=error");
            }
        }
    }
}