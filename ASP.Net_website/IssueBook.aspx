<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="IssueBook.aspx.cs" Inherits="ASP.Net_website.IssueBook" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="page-header">
        <div class="container text-center">
            <p class="text-primary fw-semibold mb-2">Issue Book</p>
            <h1 class="fw-bold mb-3">Issue Books to Students</h1>
            <p class="text-muted mb-0">Enter student and book details to complete the paymentless issue process.</p>
        </div>
    </section>

    <main class="py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="page-card p-4 p-md-5">
                        <%--  <form>--%>
                     

                        <div class="mb-3">
                            <label class="form-label">Student Name</label>
                            <asp:TextBox ID="txtnm" runat="server" class="form-control" placeholder="Enter student name"></asp:TextBox>
                            
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtnm" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Please Enter Name"></asp:RequiredFieldValidator>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Book</label>
                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-select">
                                <asp:ListItem Text="Select Book" Value="" Selected="True" Disabled="True"></asp:ListItem>
                                <asp:ListItem>Clean Code</asp:ListItem>
                                <asp:ListItem>Physics for Engineers</asp:ListItem>
                                <asp:ListItem>The Modern Web</asp:ListItem>
                                <asp:ListItem>Human Anatomy</asp:ListItem>
                                <asp:ListItem>History of Time</asp:ListItem>
                            </asp:DropDownList>
                           
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="DropDownList1" InitialValue="" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Please Select Book"></asp:RequiredFieldValidator>
                        </div>

                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Issue Date</label>
                                <asp:TextBox ID="TextBox1" runat="server" TextMode="Date" class="form-control"></asp:TextBox>
                               
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="TextBox1" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Please Select Issue Date"></asp:RequiredFieldValidator>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label">Return Date</label>
                                <asp:TextBox ID="TextBox2" runat="server" TextMode="Date" class="form-control"></asp:TextBox>
                                
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="TextBox2" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Please Select Return Date"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <asp:Button ID="Button1" runat="server" Text="Issue Book" class="btn btn-primary mt-4" OnClick="Button1_Click" />
                        <div>
                           <%-- <asp:Label ID="lblIssue" runat="server" Text="Label"></asp:Label>--%>
                            <asp:Label ID="lblIssue" runat="server" EnableViewState="false"></asp:Label>
                        </div>
                        <%--  </form>--%>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>

