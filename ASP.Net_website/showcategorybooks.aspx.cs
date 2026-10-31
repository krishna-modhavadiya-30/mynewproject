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
        SqlCommand cmd;
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

        
            if (Session["AdminLoggedIn"] != null && (bool)Session["AdminLoggedIn"] == true)
            {
                nm = Convert.ToString(Session["AdminUser"]);
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
                con.Close();

                bool isAdmin = (Session["AdminLoggedIn"] != null && (bool)Session["AdminLoggedIn"] == true);

                foreach (DataListItem item in DataList1.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {
                        Panel pnlStock = (Panel)item.FindControl("pnlAdminStock");
                        if (pnlStock != null)
                        {
                            pnlStock.Visible = isAdmin;
                     }
                    }
                }
            }
        

        
        
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "issue")
            {
                string bookId = e.CommandArgument.ToString();
                string catId = Request.QueryString["catid"] != null ? Request.QueryString["catid"].ToString() : "";

                Response.Redirect("IssueBook.aspx?bid=" + bookId + "&catid=" + catId);
            }


          
            if (e.CommandName == "addstock")
            {
                if (Session["AdminLoggedIn"] != null)
                {
                    string bookId = e.CommandArgument.ToString();
                    TextBox txtQty = (TextBox)e.Item.FindControl("txtAddStock");

                    if (txtQty.Text != "")
                    {
                        int extraStock = Convert.ToInt32(txtQty.Text);

                        getcon();
                        string q = "update Add_Books_tbl set Book_Copies = Book_Copies + " + extraStock + " where Book_Id='" + bookId + "'";
                        cmd = new SqlCommand(q, con);
                        cmd.ExecuteNonQuery();
                        con.Close();

                        filldatalis();
                    }
                }
            }





        }
        }
    }
