<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ReturnBook.aspx.cs" Inherits="ASP.Net_website.ReturnBook" %>

<asp:Content ID="ReturnContent" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="page-header">
        <div class="container text-center">
            <p class="text-primary fw-semibold mb-2">Return Book</p>
            <h1 class="fw-bold mb-3">Record Book Returns</h1>
            <p class="text-muted mb-0">Process returns and calculate any due fine.</p>
        </div>
    </section>

    <main class="py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="page-card p-4 p-md-5">
                        <div class="mb-3">
                            <label class="form-label">Student Name</label>
                            <asp:TextBox ID="txtStudent" runat="server" CssClass="form-control" placeholder="Enter Student Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvStudent" runat="server" ControlToValidate="txtStudent" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter student name"></asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3">
                           <%-- <label class="form-label">Issued Book</label>
                            <asp:DropDownList ID="ddlBook" runat="server" class="form-select">
                                <asp:ListItem Text="Select Issued Book" Value="" Selected="True"></asp:ListItem>
                                <asp:ListItem>Clean Code</asp:ListItem>
                                <asp:ListItem>Physics for Engineers</asp:ListItem>
                                <asp:ListItem>The Modern Web</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvBook" runat="server" ControlToValidate="ddlBook" InitialValue="" Display="Dynamic" ForeColor="Red" ErrorMessage="Please select a book"></asp:RequiredFieldValidator>--%>
                            <label class="form-label">Issued Book</label>
                            <asp:TextBox ID="txtbook" CssClass="form-control" runat="server" placeholder="Enter Book Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtbook"></asp:RequiredFieldValidator>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Return Date</label>
                                <asp:TextBox ID="txtReturnDate" runat="server" TextMode="Date" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvReturnDate" runat="server" ControlToValidate="txtReturnDate" Display="Dynamic" ForeColor="Red" ErrorMessage="Please select return date"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Fine Amount</label>
                                <asp:TextBox ID="txtFineAmount" runat="server" TextMode="Number" class="form-control" placeholder="0"></asp:TextBox>
                            </div>
                        </div>
                        <asp:Button ID="btnReturnBook" runat="server" Text="Return Book" class="btn btn-primary w-100" OnClick="btnReturnBook_Click" />
                        <div><br /><asp:Label ID="lblReturnStatus" runat="server" Font-Bold="True" ForeColor="#198754" Text=""></asp:Label></div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
