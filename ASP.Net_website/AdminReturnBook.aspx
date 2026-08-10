<%@ Page Title="Admin Return Book" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminReturnBook.aspx.cs" Inherits="ASP.Net_website.AdminReturnBook" %>

<asp:Content ID="AdminReturnContent" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="page-header">
        <div class="container text-center">
            <p class="text-primary fw-semibold mb-2">Administration</p>
            <h1 class="fw-bold mb-3">Return Book</h1>
            <p class="text-muted mb-0">Complete a book return from the admin panel.</p>
        </div>
    </section>
    <main class="py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="page-card p-4 p-md-5">
                        <div class="mb-3">
                            <label class="form-label">Student Name</label>
                            <asp:TextBox ID="txtAdminReturnStudent" runat="server" CssClass="form-control" placeholder="Enter student name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAdminReturnStudent" runat="server" ControlToValidate="txtAdminReturnStudent" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter student name"></asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Issued Book</label>
                            <asp:DropDownList ID="ddlAdminReturnBook" runat="server" CssClass="form-select">
                                <asp:ListItem Text="Select Issued Book" Value="" Selected="True"></asp:ListItem>
                                <asp:ListItem>Clean Code</asp:ListItem>
                                <asp:ListItem>Physics for Engineers</asp:ListItem>
                                <asp:ListItem>The Modern Web</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvAdminReturnBook" runat="server" ControlToValidate="ddlAdminReturnBook" InitialValue="" Display="Dynamic" ForeColor="Red" ErrorMessage="Please select a book"></asp:RequiredFieldValidator>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Return Date</label>
                                <asp:TextBox ID="txtAdminReturnDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvAdminReturnDate" runat="server" ControlToValidate="txtAdminReturnDate" Display="Dynamic" ForeColor="Red" ErrorMessage="Please select return date"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Fine Amount</label>
                                <asp:TextBox ID="txtAdminFine" runat="server" TextMode="Number" CssClass="form-control" placeholder="0"></asp:TextBox>
                            </div>
                        </div>
                        <asp:Button ID="btnAdminReturn" runat="server" Text="Return Book" CssClass="btn btn-primary w-100" OnClick="btnAdminReturn_Click" />
                        <asp:Label ID="lblAdminReturn" runat="server" CssClass="d-block mt-3 text-success"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
