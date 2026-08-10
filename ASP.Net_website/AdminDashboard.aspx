<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="ASP.Net_website.AdminDashboard" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
        <section class="page-header">
                <div class="container text-center">
                        <p class="text-primary fw-semibold mb-2">Library Administration</p>
                        <h1 class="fw-bold mb-3">Admin Dashboard</h1>
                        <p class="text-muted mb-0">Manage books and circulation records.</p>
                </div>
        </section>

        <main class="py-5">
                <div class="container">
                        <div class="row g-4 justify-content-center">
                                <div class="col-md-4">
                                        <div class="page-card p-4 h-100 text-center position-relative">
                                                <h3 class="fw-bold mb-3">Search Book</h3>
                                                <p class="text-muted">Search the library collection before issuing or returning a book.</p>
                                                <a href="BookSearch.aspx" class="btn btn-primary stretched-link">Search Book</a>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                        <div class="page-card p-4 h-100 text-center position-relative">
                                                <h3 class="fw-bold mb-3">Issue Book</h3>
                                                <p class="text-muted">Open the original book issue form.</p>
                                                <a href="<%= ResolveUrl("~/AdminIssueBook.aspx") %>" class="btn btn-primary stretched-link">Issue Book</a>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                        <div class="page-card p-4 h-100 text-center position-relative">
                                                <h3 class="fw-bold mb-3">Return Book</h3>
                                                <p class="text-muted">Open the original book return form.</p>
                                                <a href="<%= ResolveUrl("~/AdminReturnBook.aspx") %>" class="btn btn-primary stretched-link">Return Book</a>
                                        </div>
                                </div>
                                <div class="col-md-4">
                                        <div class="page-card p-4 h-100 text-center">
                                                <h3 class="fw-bold mb-3">Add Book</h3>
                                                <p class="text-muted">Add a new book to the library collection.</p>
                                                <a href="AddBook.aspx" class="btn btn-primary">Add Book</a>
                                        </div>
                                </div>
                        </div>
                        <div class="page-card p-4 mt-5">
                                <h2 class="fw-bold mb-3">Issued Book Records</h2>
                                <p class="text-muted">Books issued by students appear here for admin review.</p>
                                <asp:GridView ID="gvIssuedBooks" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" EmptyDataText="No books have been issued yet.">
                                        <Columns>
                                                <asp:BoundField DataField="StudentName" HeaderText="Student" />
                                                <asp:BoundField DataField="BookName" HeaderText="Book" />
                                                <asp:BoundField DataField="IssueDate" HeaderText="Issue Date" />
                                                <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" />
                                                <asp:BoundField DataField="Status" HeaderText="Status" />
                                        </Columns>
                                </asp:GridView>
                        </div>
                </div>
        </main>
</asp:Content>
