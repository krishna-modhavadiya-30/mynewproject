<%@ Page Title="Book Search" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookSearch.aspx.cs" Inherits="ASP.Net_website.BookSearch" %>

<asp:Content ID="BookSearchContent" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="page-header">
        <div class="container text-center">
            <p class="text-primary fw-semibold mb-2">Library Catalogue</p>
            <h1 class="fw-bold mb-3">Search Books</h1>
            <p class="text-muted mb-0">Find books by title, author, category or availability.</p>
        </div>
    </section>

    <main class="py-5">
        <div class="container">
            <div class="page-card p-4 mb-4">
                <div class="row g-3">
                    <div class="col-lg-6">
                        <label class="form-label">Search</label>
                        <asp:TextBox ID="bookSearchInput" runat="server" ClientIDMode="Static" CssClass="form-control" placeholder="Enter book title or author" />
                    </div>
                    <div class="col-md-3 col-lg-3">
                        <label class="form-label">Category</label>
                        <asp:DropDownList ID="categoryFilter" runat="server" ClientIDMode="Static" CssClass="form-select">
                            <asp:ListItem Text="All categories" Value="" />
                            <asp:ListItem Text="Programming" Value="programming" />
                            <asp:ListItem Text="Technology" Value="technology" />
                            <asp:ListItem Text="Science" Value="science" />
                            <asp:ListItem Text="History" Value="history" />
                        </asp:DropDownList>
                    </div>
                   <%-- <div class="col-md-3 col-lg-3">
                        <label class="form-label">Availability</label>
                        <asp:DropDownList ID="availabilityFilter" runat="server" ClientIDMode="Static" CssClass="form-select">
                            <asp:ListItem Text="Any availability" Value="" />
                            <asp:ListItem Text="Available" Value="available" />
                            <asp:ListItem Text="Out of stock" Value="out-of-stock" />
                        </asp:DropDownList>
                    </div>--%>
                </div>
            </div>

            <div class="row g-4" id="bookResults">
                <div class="col-md-6 col-lg-4 book-card" data-name="Clean Code" data-author="Robert Martin" data-category="programming" data-isbn="9780132350884" data-availability="available">
                    <div class="page-card p-4 h-100"><h4 class="fw-bold">Clean Code</h4><p class="text-muted mb-2">Robert C. Martin</p><p class="small text-primary">Programming</p><span class="badge bg-success">Available</span></div>
                </div>
                <div class="col-md-6 col-lg-4 book-card" data-name="The Modern Web" data-author="Peter Gasston" data-category="technology" data-isbn="9780321986926" data-availability="available">
                    <div class="page-card p-4 h-100"><h4 class="fw-bold">The Modern Web</h4><p class="text-muted mb-2">Peter Gasston</p><p class="small text-primary">Technology</p><span class="badge bg-success">Available</span></div>
                </div>
                <div class="col-md-6 col-lg-4 book-card" data-name="Physics for Engineers" data-author="John Doe" data-category="science" data-isbn="9781119057314" data-availability="out-of-stock">
                    <div class="page-card p-4 h-100"><h4 class="fw-bold">Physics for Engineers</h4><p class="text-muted mb-2">John Doe</p><p class="small text-primary">Science</p><span class="badge bg-danger">Out of stock</span></div>
                </div>
                <div class="col-md-6 col-lg-4 book-card" data-name="Human Anatomy" data-author="Marieb Hoehn" data-category="science" data-isbn="9780134580999" data-availability="available">
                    <div class="page-card p-4 h-100"><h4 class="fw-bold">Human Anatomy</h4><p class="text-muted mb-2">Marieb &amp; Hoehn</p><p class="small text-primary">Science</p><span class="badge bg-success">Available</span></div>
                </div>
                <div class="col-md-6 col-lg-4 book-card" data-name="History of Time" data-author="Stephen Hawking" data-category="history" data-isbn="9780553380163" data-availability="available">
                    <div class="page-card p-4 h-100"><h4 class="fw-bold">History of Time</h4><p class="text-muted mb-2">Stephen Hawking</p><p class="small text-primary">History</p><span class="badge bg-success">Available</span></div>
                </div>
                <div class="col-md-6 col-lg-4 book-card" data-name="Design Patterns" data-author="Erich Gamma" data-category="programming" data-isbn="9780201633610" data-availability="available">
                    <div class="page-card p-4 h-100"><h4 class="fw-bold">Design Patterns</h4><p class="text-muted mb-2">Erich Gamma</p><p class="small text-primary">Programming</p><span class="badge bg-success">Available</span></div>
                </div>
            </div>
            <div class="alert alert-secondary d-none mt-4" id="noResultsMessage">No books found.</div>
        </div>
    </main>
</asp:Content>
