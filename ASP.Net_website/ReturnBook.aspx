<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ReturnBook.aspx.cs" Inherits="ASP.Net_website.ReturnBook" %>

<asp:Content ID="ReturnContent" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <%-- <section class="page-header">
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
    </main>--%>
    <section class="page-header">
        <div class="container text-center py-4">
            <p class="text-primary fw-semibold mb-2">Record Book Returns</p>
            <h1 class="fw-bold mb-3">Return Issued Book</h1>
            <p class="text-muted mb-0">Process book returns and calculate any applicable fine.</p>
        </div>
    </section>

    <main class="py-4">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="page-card p-4 p-md-5 bg-white shadow-sm rounded-4">

                        <!-- 1. Student Name -->
                        <div class="mb-3">
                            <label class="form-label font-weight-bold">Student Name</label>
                            <asp:TextBox ID="txtnm" runat="server" class="form-control" placeholder="Enter student name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv1" ControlToValidate="txtnm" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Please Enter Student Name"></asp:RequiredFieldValidator>
                        </div>

                        <!-- 2. Book Name -->
                        <div class="mb-3">
                            <label class="form-label font-weight-bold">Issued Book Name</label>
                            <asp:TextBox ID="txtbook" runat="server" class="form-control" placeholder="Enter book name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv2" ControlToValidate="txtbook" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Please Enter Book Name"></asp:RequiredFieldValidator>
                        </div>

                        <!-- 3. Return Date & Fine Amount -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label font-weight-bold">Actual Return Date</label>
                                <asp:TextBox ID="TextBox1" runat="server" TextMode="Date" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv3" ControlToValidate="TextBox1" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Please Select Date"></asp:RequiredFieldValidator>
                            </div>
                            <%--<div class="col-md-6 mb-3">
                                <label class="form-label font-weight-bold">Fine Amount (₹)</label>
                                <asp:TextBox ID="txtFine" runat="server" class="form-control" Text="0" placeholder="0"></asp:TextBox>
                            </div>--%>
                        </div>

                        <!-- 4. Submit Button -->
                        <asp:Button ID="Button1" runat="server" Text="Return Book" class="btn btn-primary w-100 mt-3" OnClick="Button1_Click1"  />

                        <!-- 5. Status Label -->
                        <div class="mt-3 text-center">
                            <asp:Label ID="lblReturn" runat="server" Font-Bold="True" EnableViewState="false"></asp:Label>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
