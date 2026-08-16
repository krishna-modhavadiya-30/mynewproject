<%@ Page Title="Manage Book Issues" Language="C#" MasterPageFile="~/Librarian.Master" AutoEventWireup="true" CodeBehind="LibrarianManageIssues.aspx.cs" Inherits="ASP.Net_website.LibrarianManageIssues" %>

<asp:Content ID="ManageHead" ContentPlaceHolderID="LibrarianHead" runat="server">
    <!-- Extra page styles can go here -->
    <style>
        .edit-input {
            width: 100%;
            padding: 6px 10px;
            border: 1px solid var(--lib-border);
            border-radius: 6px;
            font-size: 0.875rem;
        }
    </style>
</asp:Content>

<asp:Content ID="ManageTitle" ContentPlaceHolderID="LibrarianTitlePlaceHolder" runat="server">
    Manage Book Issues
</asp:Content>

<asp:Content ID="ManageContent" ContentPlaceHolderID="LibrarianContentPlaceHolder" runat="server">
    
    <!-- Status Alert Messages -->
    <asp:Panel ID="pnlAlert" runat="server" Visible="false">
        <div class='<%# "lib-alert " + AlertCss %>'>
            <asp:Label ID="lblAlertMessage" runat="server"></asp:Label>
        </div>
    </asp:Panel>

    <!-- Create Record Section (Add New Book Issue) -->
    <div class="lib-panel">
        <div class="lib-panel-header">
            <h3 class="lib-panel-title">➕ Issue a Book to a Student</h3>
        </div>
        <div class="lib-panel-body">
            <div class="lib-form-grid">
                <div class="lib-form-group">
                    <label class="lib-label">Student Name</label>
                    <asp:TextBox ID="txtStudentName" runat="server" CssClass="lib-input" placeholder="Enter student name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvStudent" runat="server" ControlToValidate="txtStudentName" 
                        ErrorMessage="Name is required" ForeColor="Red" Font-Size="Smaller" ValidationGroup="vgIssue" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="lib-form-group">
                    <label class="lib-label">Book Title</label>
                    <asp:DropDownList ID="ddlBookName" runat="server" CssClass="lib-select">
                        <asp:ListItem Value="" Text="Select Book"></asp:ListItem>
                        <asp:ListItem Value="Clean Code" Text="Clean Code"></asp:ListItem>
                        <asp:ListItem Value="Physics for Engineers" Text="Physics for Engineers"></asp:ListItem>
                        <asp:ListItem Value="The Modern Web" Text="The Modern Web"></asp:ListItem>
                        <asp:ListItem Value="Human Anatomy" Text="Human Anatomy"></asp:ListItem>
                        <asp:ListItem Value="History of Time" Text="History of Time"></asp:ListItem>
                        <asp:ListItem Value="Design Patterns" Text="Design Patterns"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvBook" runat="server" ControlToValidate="ddlBookName" InitialValue=""
                        ErrorMessage="Select a book" ForeColor="Red" Font-Size="Smaller" ValidationGroup="vgIssue" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="lib-form-group">
                    <label class="lib-label">Issue Date</label>
                    <asp:TextBox ID="txtIssueDate" runat="server" TextMode="Date" CssClass="lib-input"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvIssueDate" runat="server" ControlToValidate="txtIssueDate" 
                        ErrorMessage="Select date" ForeColor="Red" Font-Size="Smaller" ValidationGroup="vgIssue" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="lib-form-group">
                    <label class="lib-label">Return Date</label>
                    <asp:TextBox ID="txtReturnDate" runat="server" TextMode="Date" CssClass="lib-input"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvReturnDate" runat="server" ControlToValidate="txtReturnDate" 
                        ErrorMessage="Select date" ForeColor="Red" Font-Size="Smaller" ValidationGroup="vgIssue" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>
            
            <div style="display: flex; gap: 16px; margin-top: 12px;">
                <asp:Button ID="btnSave" runat="server" Text="Save Record" CssClass="lib-btn lib-btn-primary" 
                    OnClick="btnSave_Click" ValidationGroup="vgIssue" />
                <asp:Button ID="btnCancelInput" runat="server" Text="Clear" CssClass="lib-btn lib-btn-secondary" 
                    OnClick="btnCancelInput_Click" CausesValidation="false" />
            </div>
        </div>
    </div>

    <!-- Read & Search & Filter Section -->
    <div class="lib-panel">
        <div class="lib-panel-header">
            <h3 class="lib-panel-title">🔍 Search & Filter Issue Records</h3>
        </div>
        <div class="lib-panel-body">
            <div class="lib-search-bar">
                <div class="lib-form-group" style="flex-grow: 2; min-width: 250px;">
                    <label class="lib-label">Student Name</label>
                    <asp:TextBox ID="txtSearchStudent" runat="server" CssClass="lib-input" placeholder="Search by student name..."></asp:TextBox>
                </div>
                <div class="lib-form-group" style="flex-grow: 1; min-width: 150px;">
                    <label class="lib-label">Status</label>
                    <asp:DropDownList ID="ddlFilterStatus" runat="server" CssClass="lib-select">
                        <asp:ListItem Value="All" Text="All Statuses"></asp:ListItem>
                        <asp:ListItem Value="Issued" Text="Issued (Active)"></asp:ListItem>
                        <asp:ListItem Value="Returned" Text="Returned"></asp:ListItem>
                        <asp:ListItem Value="Overdue" Text="Overdue Only"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div style="display: flex; gap: 8px;">
                    <asp:Button ID="btnSearch" runat="server" Text="Filter" CssClass="lib-btn lib-btn-primary" 
                        OnClick="btnSearch_Click" CausesValidation="false" />
                    <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="lib-btn lib-btn-secondary" 
                        OnClick="btnReset_Click" CausesValidation="false" />
                </div>
            </div>
        </div>
    </div>

    <!-- Read / Update / Delete GridView Section -->
    <div class="lib-panel">
        <div class="lib-panel-header">
            <h3 class="lib-panel-title">📋 Active Circulation List</h3>
        </div>
        <div class="lib-panel-body" style="padding: 0;">
            <asp:GridView ID="gvBookIssues" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="Id" 
                OnRowEditing="gvBookIssues_RowEditing" 
                OnRowCancelingEdit="gvBookIssues_RowCancelingEdit" 
                OnRowUpdating="gvBookIssues_RowUpdating" 
                OnRowDeleting="gvBookIssues_RowDeleting"
                CssClass="lib-grid table" 
                EmptyDataText="No issue records found matching the filter."
                GridLines="None" BorderWidth="0px">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" />
                    
                    <asp:TemplateField HeaderText="Student Name">
                        <ItemTemplate>
                            <%# Eval("StudentName") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGridStudent" runat="server" Text='<%# Bind("StudentName") %>' CssClass="edit-input"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Book Title">
                        <ItemTemplate>
                            <%# Eval("BookName") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlGridBook" runat="server" SelectedValue='<%# Bind("BookName") %>' CssClass="edit-input">
                                <asp:ListItem Value="Clean Code" Text="Clean Code"></asp:ListItem>
                                <asp:ListItem Value="Physics for Engineers" Text="Physics for Engineers"></asp:ListItem>
                                <asp:ListItem Value="The Modern Web" Text="The Modern Web"></asp:ListItem>
                                <asp:ListItem Value="Human Anatomy" Text="Human Anatomy"></asp:ListItem>
                                <asp:ListItem Value="History of Time" Text="History of Time"></asp:ListItem>
                                <asp:ListItem Value="Design Patterns" Text="Design Patterns"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Issue Date">
                        <ItemTemplate>
                            <%# Convert.ToDateTime(Eval("IssueDate")).ToString("dd MMM yyyy") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGridIssueDate" runat="server" Text='<%# Bind("IssueDate", "{0:yyyy-MM-dd}") %>' TextMode="Date" CssClass="edit-input"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Return Date">
                        <ItemTemplate>
                            <%# Convert.ToDateTime(Eval("ReturnDate")).ToString("dd MMM yyyy") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGridReturnDate" runat="server" Text='<%# Bind("ReturnDate", "{0:yyyy-MM-dd}") %>' TextMode="Date" CssClass="edit-input"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <span class='<%# "badge-status " + (Eval("Status").ToString() == "Returned" ? "badge-returned" : (IsOverdue(Eval("ReturnDate"), Eval("Status")) ? "badge-overdue" : "badge-issued")) %>'>
                                <%# IsOverdue(Eval("ReturnDate"), Eval("Status")) && Eval("Status").ToString() == "Issued" ? "Overdue" : Eval("Status") %>
                            </span>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlGridStatus" runat="server" SelectedValue='<%# Bind("Status") %>' CssClass="edit-input">
                                <asp:ListItem Value="Issued" Text="Issued"></asp:ListItem>
                                <asp:ListItem Value="Returned" Text="Returned"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Fine Amount">
                        <ItemTemplate>
                            ₹<%# Eval("FineAmount") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtGridFine" runat="server" Text='<%# Bind("FineAmount") %>' CssClass="edit-input"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandName="Edit" CssClass="lib-btn lib-btn-secondary lib-btn-sm" style="text-decoration:none;"></asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CommandName="Delete" CssClass="lib-btn lib-btn-danger lib-btn-sm" style="text-decoration:none;" 
                                OnClientClick="return confirm('Are you sure you want to delete this circulation record?');"></asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="lnkUpdate" runat="server" Text="Update" CommandName="Update" CssClass="lib-btn lib-btn-primary lib-btn-sm" style="text-decoration:none;"></asp:LinkButton>
                            <asp:LinkButton ID="lnkCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="lib-btn lib-btn-secondary lib-btn-sm" style="text-decoration:none;"></asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
