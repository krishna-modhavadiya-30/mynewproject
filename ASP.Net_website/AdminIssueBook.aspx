<%@ Page Title="Admin Issue Book" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminIssueBook.aspx.cs" Inherits="ASP.Net_website.AdminIssueBook" %>

<asp:Content ID="AdminIssueContent" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="page-header">
        <div class="container text-center">
            <p class="text-primary fw-semibold mb-2">Administration</p>
            <h1 class="fw-bold mb-3">Issue Book</h1>
            <p class="text-muted mb-0">Issue a book to a student from the admin panel.</p>
        </div>
    </section>
    <main class="py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="page-card p-4 p-md-5">
                        <div class="mb-3">
                            <label class="form-label">Student Name</label>
                            <asp:TextBox ID="txtStudentName" runat="server" CssClass="form-control" placeholder="Enter student name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvStudentName" runat="server" ControlToValidate="txtStudentName" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter student name"></asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Book</label>
                            <asp:DropDownList ID="ddlAdminBook" runat="server" CssClass="form-select">
                                <asp:ListItem Text="Select Book" Value="" Selected="True"></asp:ListItem>
                                <asp:ListItem>Clean Code</asp:ListItem>
                                <asp:ListItem>Physics for Engineers</asp:ListItem>
                                <asp:ListItem>The Modern Web</asp:ListItem>
                                <asp:ListItem>Human Anatomy</asp:ListItem>
                                <asp:ListItem>History of Time</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvAdminBook" runat="server" ControlToValidate="ddlAdminBook" InitialValue="" Display="Dynamic" ForeColor="Red" ErrorMessage="Please select a book"></asp:RequiredFieldValidator>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Issue Date</label>
                                <asp:TextBox ID="txtAdminIssueDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvAdminIssueDate" runat="server" ControlToValidate="txtAdminIssueDate" Display="Dynamic" ForeColor="Red" ErrorMessage="Please select issue date"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Return Date</label>
                                <asp:TextBox ID="txtAdminReturnDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvAdminReturnDate" runat="server" ControlToValidate="txtAdminReturnDate" Display="Dynamic" ForeColor="Red" ErrorMessage="Please select return date"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <asp:Button ID="btnAdminIssue" runat="server" Text="Issue Book" CssClass="btn btn-primary mt-4" OnClick="btnAdminIssue_Click" />
                        <asp:Label ID="lblAdminIssue" runat="server" CssClass="d-block mt-3 text-success"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
