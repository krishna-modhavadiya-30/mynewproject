using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



//New namespaces

using System.Data.SqlClient; //for connection
using System.Data; //For dataset
using System.Configuration; //For connection string


namespace ASP.Net_website
{
    public partial class StudentRegistration : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string fnm;

        string s = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {


            if (Request.QueryString["registration"] == "success")
            {
                lblStatus.Text = "<b>Status:</b> Registration Successful!<br />" +
                                "<b>Name:</b> " + Session["RegName"] + "<br />" +
                                "<b>Gender:</b> " + Session["RegGender"] + "<br />" +
                                "<b>Email:</b> " + Session["RegEmail"] +
                                "<b>Photo:</b> " + Session["RegPhoto"];

            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void imgupload()
        {
            fnm = "Image/" + flpimg.FileName;
            flpimg.SaveAs(Server.MapPath(fnm));
        }

        void clear()
        {
            txtnm.Text = "";
            rdbgen.ClearSelection();
            txtEmail.Text = "";
            txtPassword.Text = "";
        }


        protected void Unnamed1_Click(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            getcon();
            imgupload();
            cmd = new SqlCommand("insert into [user](Name,Gender,Email,Password,Image)values('" + txtnm.Text + "','" + rdbgen.SelectedValue + "','" + txtEmail.Text + "','" + txtPassword.Text + "','" + fnm + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            clear();


            //Session["RegName"] = txtnm.Text;
            //Session["RegEmail"] = txtEmail.Text;


            Response.Redirect("StudentRegistration.aspx?registration=success");
        }
    }
}