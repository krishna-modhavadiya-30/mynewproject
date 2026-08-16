<%@ Page Title="Librarian Dashboard" Language="C#" MasterPageFile="~/Librarian.Master" AutoEventWireup="true" CodeBehind="LibrarianDashboard.aspx.cs" Inherits="ASP.Net_website.LibrarianDashboard" %>

<asp:Content ID="DashHead" ContentPlaceHolderID="LibrarianHead" runat="server">
</asp:Content>

<asp:Content ID="DashTitle" ContentPlaceHolderID="LibrarianTitlePlaceHolder" runat="server">
    Dashboard
</asp:Content>

<asp:Content ID="DashContent" ContentPlaceHolderID="LibrarianContentPlaceHolder" runat="server">
    <!-- Stat Cards Section -->
    <div class="lib-stats-grid">
        <div class="lib-stat-card">
            <div class="lib-stat-info">
                <h3><asp:Label ID="lblTotalIssued" runat="server" Text="0"></asp:Label></h3>
                <p>Total Circulation</p>
            </div>
            <div class="lib-stat-icon icon-blue">
                <span>📊</span>
            </div>
        </div>
        <div class="lib-stat-card">
            <div class="lib-stat-info">
                <h3><asp:Label ID="lblActiveIssues" runat="server" Text="0"></asp:Label></h3>
                <p>Active Issues</p>
            </div>
            <div class="lib-stat-icon icon-orange">
                <span>📖</span>
            </div>
        </div>
        <div class="lib-stat-card">
            <div class="lib-stat-info">
                <h3><asp:Label ID="lblReturned" runat="server" Text="0"></asp:Label></h3>
                <p>Returned Books</p>
            </div>
            <div class="lib-stat-icon icon-green">
                <span>✅</span>
            </div>
        </div>
        <div class="lib-stat-card">
            <div class="lib-stat-info">
                <h3><asp:Label ID="lblOverdue" runat="server" Text="0"></asp:Label></h3>
                <p>Overdue Books</p>
            </div>
            <div class="lib-stat-icon icon-red">
                <span>⚠️</span>
            </div>
        </div>
    </div>

    <!-- Quick Links & Actions -->
    <div class="lib-panel" style="margin-bottom: 24px;">
        <div class="lib-panel-header">
            <h3 class="lib-panel-title">Librarian Operations Quick Access</h3>
        </div>
        <div class="lib-panel-body">
            <div style="display: flex; gap: 16px; flex-wrap: wrap;">
                <a href="LibrarianManageIssues.aspx" class="lib-btn lib-btn-primary">
                    <span>📚</span> Manage Book Issues & Returns (CRUD)
                </a>
                <a href="BookSearch.aspx" class="lib-btn lib-btn-secondary">
                    <span>🔍</span> Search Book Availability
                </a>
                <a href="AddBook.aspx" class="lib-btn lib-btn-secondary">
                    <span>➕</span> Add New Book (Admin Redirect)
                </a>
            </div>
        </div>
    </div>

    <!-- Recent Circulation Table -->
    <div class="lib-panel">
        <div class="lib-panel-header">
            <h3 class="lib-panel-title">Recent Transactions</h3>
            <span class="text-muted" style="font-size: 0.8rem;">Showing last 5 activity records</span>
        </div>
        <div class="lib-panel-body" style="padding: 0;">
            <asp:GridView ID="gvRecentIssues" runat="server" AutoGenerateColumns="False" 
                CssClass="lib-grid table table-striped" EmptyDataText="No issue/return records found. Go to 'Manage Book Issues' to create one."
                GridLines="None" BorderWidth="0px">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="TX ID" />
                    <asp:BoundField DataField="StudentName" HeaderText="Student" />
                    <asp:BoundField DataField="BookName" HeaderText="Book Title" />
                    <asp:TemplateField HeaderText="Issue Date">
                        <ItemTemplate>
                            <%# Convert.ToDateTime(Eval("IssueDate")).ToString("dd MMM yyyy") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Return Date">
                        <ItemTemplate>
                            <%# Convert.ToDateTime(Eval("ReturnDate")).ToString("dd MMM yyyy") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <span class='<%# "badge-status " + (Eval("Status").ToString() == "Returned" ? "badge-returned" : (IsOverdue(Eval("ReturnDate"), Eval("Status")) ? "badge-overdue" : "badge-issued")) %>'>
                                <%# IsOverdue(Eval("ReturnDate"), Eval("Status")) && Eval("Status").ToString() == "Issued" ? "Overdue" : Eval("Status") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fine Amount">
                        <ItemTemplate>
                            ₹<%# Eval("FineAmount") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
