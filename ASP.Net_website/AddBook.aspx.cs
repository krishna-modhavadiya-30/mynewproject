using System;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;

namespace ASP.Net_website
{
    public partial class AddBook : System.Web.UI.Page
    {
        private DataTable Books
        {
            get { return Session["AdminBooks"] as DataTable; }
            set { Session["AdminBooks"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedIn"] == null || !(bool)Session["AdminLoggedIn"])
            {
                Response.Redirect("Home.aspx");
                return;
            }

            if (!IsPostBack)
            {
                EnsureBooksTable();
                BindBooks();
            }
        }

        private void EnsureBooksTable()
        {
            if (Books != null) return;
            DataTable books = new DataTable();
            books.Columns.Add("BookID", typeof(int));
            books.Columns.Add("Title");
            books.Columns.Add("Author");
            books.Columns.Add("Quantity", typeof(int));
            books.PrimaryKey = new[] { books.Columns["BookID"] };
            Books = books;
        }

        protected void btnAddBook_Click(object sender, EventArgs e)
        {
            EnsureBooksTable();
            if (string.IsNullOrWhiteSpace(txtTitle.Text) || string.IsNullOrWhiteSpace(txtAuthor.Text) || !int.TryParse(txtQuantity.Text, out int quantity) || quantity < 1)
            {
                ShowStatus("Please enter a title, author and quantity greater than zero.", "error");
                return;
            }

            int nextId = Books.Rows.Count == 0 ? 1 : Books.AsEnumerable().Max(row => row.Field<int>("BookID")) + 1;
            Books.Rows.Add(nextId, txtTitle.Text.Trim(), txtAuthor.Text.Trim(), quantity);
            txtTitle.Text = string.Empty;
            txtAuthor.Text = string.Empty;
            txtQuantity.Text = string.Empty;
            ShowStatus("Book added successfully.", "success");
            BindBooks();
        }

        protected void gvBooks_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "DeleteBook") return;
            if (int.TryParse(Convert.ToString(e.CommandArgument), out int bookId))
            {
                DataRow book = Books.Rows.Find(bookId);
                if (book != null) Books.Rows.Remove(book);
                ShowStatus("Book deleted successfully.", "success");
                BindBooks();
            }
        }

        private void BindBooks()
        {
            gvBooks.DataSource = Books;
            gvBooks.DataBind();
        }

        private void ShowStatus(string message, string type)
        {
            lblStatus.Text = message;
            lblStatus.CssClass = "operation-message " + type;
        }
    }
}
