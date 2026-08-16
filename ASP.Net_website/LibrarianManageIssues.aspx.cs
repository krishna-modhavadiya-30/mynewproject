using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.Net_website
{
    public partial class LibrarianManageIssues : System.Web.UI.Page
    {
        private string connString = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        public string AlertCss { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Default input dates
                txtIssueDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
                txtReturnDate.Text = DateTime.Today.AddDays(14).ToString("yyyy-MM-dd"); // Default 14-day duration
                
                BindGrid();
            }
        }

        private void BindGrid()
        {
            string search = txtSearchStudent.Text.Trim();
            string status = ddlFilterStatus.SelectedValue;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT [Id], [StudentName], [BookName], [IssueDate], [ReturnDate], [Status], [FineAmount] FROM [BookIssues] WHERE 1=1";

                if (!string.IsNullOrEmpty(search))
                {
                    query += " AND [StudentName] LIKE @Search";
                }

                if (status == "Issued")
                {
                    query += " AND [Status] = 'Issued'";
                }
                else if (status == "Returned")
                {
                    query += " AND [Status] = 'Returned'";
                }
                else if (status == "Overdue")
                {
                    query += " AND [Status] = 'Issued' AND [ReturnDate] < @Today";
                }

                query += " ORDER BY [Id] DESC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (!string.IsNullOrEmpty(search))
                    {
                        cmd.Parameters.AddWithValue("@Search", "%" + search + "%");
                    }
                    if (status == "Overdue")
                    {
                        cmd.Parameters.AddWithValue("@Today", DateTime.Today);
                    }

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        try
                        {
                            da.Fill(dt);
                            gvBookIssues.DataSource = dt;
                            gvBookIssues.DataBind();
                        }
                        catch (Exception ex)
                        {
                            ShowAlert("Error loading records: " + ex.Message, false);
                        }
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtStudentName.Text) || string.IsNullOrEmpty(ddlBookName.SelectedValue))
            {
                ShowAlert("Please fill in all required fields.", false);
                return;
            }

            DateTime issueDate, returnDate;
            if (!DateTime.TryParse(txtIssueDate.Text, out issueDate) || !DateTime.TryParse(txtReturnDate.Text, out returnDate))
            {
                ShowAlert("Please enter valid dates.", false);
                return;
            }

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string insertQuery = @"
                    INSERT INTO [BookIssues] ([StudentName], [BookName], [IssueDate], [ReturnDate], [Status], [FineAmount]) 
                    VALUES (@StudentName, @BookName, @IssueDate, @ReturnDate, 'Issued', 0.00)";

                using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@StudentName", txtStudentName.Text.Trim());
                    cmd.Parameters.AddWithValue("@BookName", ddlBookName.SelectedValue);
                    cmd.Parameters.AddWithValue("@IssueDate", issueDate);
                    cmd.Parameters.AddWithValue("@ReturnDate", returnDate);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        ShowAlert("Book issued successfully!", true);
                        ClearInputFields();
                        BindGrid();
                    }
                    catch (Exception ex)
                    {
                        ShowAlert("Database error: " + ex.Message, false);
                    }
                }
            }
        }

        protected void btnCancelInput_Click(object sender, EventArgs e)
        {
            ClearInputFields();
        }

        private void ClearInputFields()
        {
            txtStudentName.Text = string.Empty;
            ddlBookName.SelectedIndex = 0;
            txtIssueDate.Text = DateTime.Today.ToString("yyyy-MM-dd");
            txtReturnDate.Text = DateTime.Today.AddDays(14).ToString("yyyy-MM-dd");
            pnlAlert.Visible = false;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            gvBookIssues.EditIndex = -1;
            BindGrid();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearchStudent.Text = string.Empty;
            ddlFilterStatus.SelectedIndex = 0;
            gvBookIssues.EditIndex = -1;
            BindGrid();
        }

        protected void gvBookIssues_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvBookIssues.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvBookIssues_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvBookIssues.EditIndex = -1;
            BindGrid();
        }

        protected void gvBookIssues_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvBookIssues.DataKeys[e.RowIndex].Value);
            
            GridViewRow row = gvBookIssues.Rows[e.RowIndex];
            TextBox txtStudent = (TextBox)row.FindControl("txtGridStudent");
            DropDownList ddlBook = (DropDownList)row.FindControl("ddlGridBook");
            TextBox txtIssue = (TextBox)row.FindControl("txtGridIssueDate");
            TextBox txtReturn = (TextBox)row.FindControl("txtGridReturnDate");
            DropDownList ddlStatus = (DropDownList)row.FindControl("ddlGridStatus");
            TextBox txtFine = (TextBox)row.FindControl("txtGridFine");

            if (txtStudent == null || ddlBook == null || txtIssue == null || txtReturn == null || ddlStatus == null || txtFine == null)
            {
                ShowAlert("Failed to find update controls.", false);
                return;
            }

            DateTime issueDate, returnDate;
            decimal fineAmount = 0.00m;

            if (string.IsNullOrWhiteSpace(txtStudent.Text))
            {
                ShowAlert("Student name cannot be empty.", false);
                return;
            }

            if (!DateTime.TryParse(txtIssue.Text, out issueDate) || !DateTime.TryParse(txtReturn.Text, out returnDate))
            {
                ShowAlert("Please enter valid dates.", false);
                return;
            }

            if (!decimal.TryParse(txtFine.Text, out fineAmount))
            {
                ShowAlert("Please enter a valid fine amount.", false);
                return;
            }

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string updateQuery = @"
                    UPDATE [BookIssues] 
                    SET [StudentName] = @StudentName, 
                        [BookName] = @BookName, 
                        [IssueDate] = @IssueDate, 
                        [ReturnDate] = @ReturnDate, 
                        [Status] = @Status, 
                        [FineAmount] = @FineAmount 
                    WHERE [Id] = @Id";

                using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@StudentName", txtStudent.Text.Trim());
                    cmd.Parameters.AddWithValue("@BookName", ddlBook.SelectedValue);
                    cmd.Parameters.AddWithValue("@IssueDate", issueDate);
                    cmd.Parameters.AddWithValue("@ReturnDate", returnDate);
                    cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("@FineAmount", fineAmount);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        ShowAlert("Record updated successfully!", true);
                        gvBookIssues.EditIndex = -1;
                        BindGrid();
                    }
                    catch (Exception ex)
                    {
                        ShowAlert("Update failed: " + ex.Message, false);
                    }
                }
            }
        }

        protected void gvBookIssues_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvBookIssues.DataKeys[e.RowIndex].Value);

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string deleteQuery = "DELETE FROM [BookIssues] WHERE [Id] = @Id";

                using (SqlCommand cmd = new SqlCommand(deleteQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@Id", id);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        ShowAlert("Record deleted successfully!", true);
                        gvBookIssues.EditIndex = -1;
                        BindGrid();
                    }
                    catch (Exception ex)
                    {
                        ShowAlert("Delete failed: " + ex.Message, false);
                    }
                }
            }
        }

        private void ShowAlert(string message, bool isSuccess)
        {
            lblAlertMessage.Text = message;
            AlertCss = isSuccess ? "lib-alert-success" : "lib-alert-danger";
            pnlAlert.Visible = true;
            pnlAlert.DataBind();
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
