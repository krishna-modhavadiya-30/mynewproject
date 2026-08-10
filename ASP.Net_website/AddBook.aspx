<%@ Page Title="Add Book" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="ASP.Net_website.AddBook" %>

<asp:Content ID="AddBookHead" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/admin-operations.css" />
</asp:Content>

<asp:Content ID="AddBookContent" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="operation-page"><div class="operation-wrap">
        <a class="back-link" href="AdminDashboard.aspx">&#8592; Back to dashboard</a>
        <div class="operation-hero add-hero"><span class="operation-hero-icon">+</span><div><span class="operation-eyebrow">Book management</span><h1>Add a new book</h1><p>Grow your library catalogue with clear and complete book details.</p></div></div>
        <div class="operation-grid-layout">
            <section class="operation-form-card"><div class="operation-card-title"><span>01</span><div><h2>Book details</h2><p>Enter the information below.</p></div></div><div class="clean-field"><label>Book title</label><asp:TextBox ID="txtTitle" runat="server" CssClass="clean-input" placeholder="e.g. Clean Code" /></div><div class="clean-field"><label>Author</label><asp:TextBox ID="txtAuthor" runat="server" CssClass="clean-input" placeholder="e.g. Robert C. Martin" /></div><div class="clean-field"><label>Quantity</label><asp:TextBox ID="txtQuantity" runat="server" CssClass="clean-input" TextMode="Number" placeholder="Number of copies" /></div><asp:Button ID="btnAddBook" runat="server" Text="Add book to catalogue" CssClass="operation-submit add-submit" OnClick="btnAddBook_Click" /><asp:Label ID="lblStatus" runat="server" CssClass="operation-message" /></section>
            <aside class="operation-note"><span class="note-icon">i</span><h3>Keep your catalogue tidy</h3><p>Use a clear title, the full author name and the correct number of available copies.</p><a href="BookSearch.aspx">View catalogue &#8594;</a></aside>
        </div>
        <section class="operation-form-card table-card"><div class="operation-card-title"><span>02</span><div><h2>Current catalogue</h2><p>Books currently added in this session.</p></div></div><div class="operation-table-wrap"><asp:GridView ID="gvBooks" runat="server" CssClass="operation-table" AutoGenerateColumns="false" EmptyDataText="No books added yet." OnRowCommand="gvBooks_RowCommand"><Columns><asp:BoundField DataField="BookID" HeaderText="ID" /><asp:BoundField DataField="Title" HeaderText="Book title" /><asp:BoundField DataField="Author" HeaderText="Author" /><asp:BoundField DataField="Quantity" HeaderText="Copies" /><asp:TemplateField HeaderText="Action"><ItemTemplate><asp:LinkButton ID="btnDelete" runat="server" Text="Delete" CommandName="DeleteBook" CommandArgument='<%# Eval("BookID") %>' CssClass="delete-link" OnClientClick="return confirm('Delete this book?');" /></ItemTemplate></asp:TemplateField></Columns></asp:GridView></div></section>
    </div></main>
</asp:Content>
