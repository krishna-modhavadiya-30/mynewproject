using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace ASP.Net_website
{
    public partial class LibrarianDashboard : System.Web.UI.Page
    {
        private string connString = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Ensure Database Table exists
            InitializeDatabaseTable();

            if (!IsPostBack)
            {
                LoadStats();
                LoadRecentTransactions();
            }
        }

        private void InitializeDatabaseTable()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string createTableQuery = @"
                    IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[BookIssues]') AND type in (N'U'))
                    BEGIN
                        CREATE TABLE [BookIssues] (
                            [Id] INT IDENTITY(1,1) PRIMARY KEY,
                            [StudentName] NVARCHAR(255) NOT NULL,
                            [BookName] NVARCHAR(255) NOT NULL,
                            [IssueDate] DATETIME NOT NULL,
                            [ReturnDate] DATETIME NOT NULL,
                            [Status] NVARCHAR(50) NOT NULL,
                            [FineAmount] DECIMAL(18,2) NOT NULL DEFAULT 0.00
                        )
                    END";

                using (SqlCommand cmd = new SqlCommand(createTableQuery, conn))
                {
                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        // Log or handle the exception appropriately
                        System.Diagnostics.Debug.WriteLine("Database init error: " + ex.Message);
                    }
                }
            }
        }

        private void LoadStats()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                try
                {
                    conn.Open();

                    // Total Issues count
                    string totalQuery = "SELECT COUNT(*) FROM [BookIssues]";
                    using (SqlCommand cmd = new SqlCommand(totalQuery, conn))
                    {
                        lblTotalIssued.Text = cmd.ExecuteScalar().ToString();
                    }

                    // Returned count
                    string returnedQuery = "SELECT COUNT(*) FROM [BookIssues] WHERE [Status] = 'Returned'";
                    using (SqlCommand cmd = new SqlCommand(returnedQuery, conn))
                    {
                        lblReturned.Text = cmd.ExecuteScalar().ToString();
                    }

                    // Active (Issued and not overdue) count
                    string activeQuery = "SELECT COUNT(*) FROM [BookIssues] WHERE [Status] = 'Issued' AND [ReturnDate] >= @Today";
                    using (SqlCommand cmd = new SqlCommand(activeQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Today", DateTime.Today);
                        lblActiveIssues.Text = cmd.ExecuteScalar().ToString();
                    }

                    // Overdue count (Status = Issued and ReturnDate < Today)
                    string overdueQuery = "SELECT COUNT(*) FROM [BookIssues] WHERE [Status] = 'Issued' AND [ReturnDate] < @Today";
                    using (SqlCommand cmd = new SqlCommand(overdueQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Today", DateTime.Today);
                        lblOverdue.Text = cmd.ExecuteScalar().ToString();
                    }
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine("LoadStats error: " + ex.Message);
                }
            }
        }

        private void LoadRecentTransactions()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT TOP 5 [Id], [StudentName], [BookName], [IssueDate], [ReturnDate], [Status], [FineAmount] FROM [BookIssues] ORDER BY [Id] DESC";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        try
                        {
                            da.Fill(dt);
                            gvRecentIssues.DataSource = dt;
                            gvRecentIssues.DataBind();
                        }
                        catch (Exception ex)
                        {
                            System.Diagnostics.Debug.WriteLine("LoadRecentTransactions error: " + ex.Message);
                        }
                    }
                }
            }
        }

        public bool IsOverdue(object returnDateObj, object statusObj)
        {
            if (statusObj == null || returnDateObj == null) return false;
            string status = statusObj.ToString();
            if (status == "Returned") return false;
            DateTime returnDate = Convert.ToDateTime(returnDateObj);
            return returnDate < DateTime.Today;
        }
    }
}
