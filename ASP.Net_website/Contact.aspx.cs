using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.Net_website
{
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbcs"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            

            
            if (Session["msg"] != null)
            {
                lblContactStatus.ForeColor = Color.Green;
                lblContactStatus.Text = Session["msg"].ToString();

              
                Session.Remove("msg");
            }
            else
            {
              
                lblContactStatus.Text = "";
            }



        }

        protected void txtMessage_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {

           
            string q = "insert into contact(name, email, message) values('" + txtName.Text + "', '" + txtEmail.Text + "', '" + txtMessage.Text + "')";

            SqlCommand cmd = new SqlCommand(q, con);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            
            Session["msg"] = "Message Sent Successfully!";

          
            Response.Redirect("Contact.aspx");



        }
    }
}