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
        string s = ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString;

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


            Session.Remove("AdminLoggedIn");
            Session.Remove("AdminUser");

           
            cmd = new SqlCommand("SELECT * FROM [user] WHERE Email='" + txtEmail.Text.Trim() + "' AND Password='" + txtPassword.Text.Trim() + "'", con);
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
               
                Session["Username"] = dr["Name"].ToString();
                Session["Email"] = dr["Email"].ToString();

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