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
    public partial class UserLogin : System.Web.UI.Page
    {

        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;

        SqlCommand cmd;
        SqlDataReader dr;
        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

           
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

          
            getcon();

           
            cmd = new SqlCommand("select * from [user] where Email='" + txtEmail.Text + "' and Password='" + txtPassword.Text + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
               
                Session["Username"] = dr["Name"].ToString();
                Session["Email"] = dr["Email"].ToString();
                Session["UserID"] = dr["Id"].ToString();

                con.Close();

              
                Response.Redirect("Home.aspx");
            }
            else
            {
                con.Close();
               
            }
        }
    }
}