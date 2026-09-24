<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StudentRegistration.aspx.cs" Inherits="ASP.Net_website.StudentRegistration" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="page-header">
        <div class="container text-center">
            <p class="text-primary fw-semibold mb-2">Student Registration</p>
            <h1 class="fw-bold mb-3">Create Your Library Account</h1>
            <p class="text-muted mb-0">Register easily to access the digital library services.</p>
        </div>
    </section>

    <%--  <main class="py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="page-card p-4">
                        <h2 class="fw-bold mb-4">Create Your Library Account</h2>
                      
                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                             
                                <asp:TextBox ID="txtnm" runat="server" placeholder="First Name" CssClass="form-control"></asp:TextBox>
                    
                               
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email</label>                               

                               
                  
                       
                        <p class="text-center text-muted mt-3 mb-0">Already have an account? <a href="UserLogin.aspx" class="text-decoration-none">Login here</a></p>
                    
                    </div>
                </div>
            </div>
        </div>
    </main>--%>
    <main class="py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="page-card p-4">
                        <h2 class="fw-bold mb-4">Create Your Library Account</h2>


                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <asp:TextBox ID="txtnm" runat="server" placeholder="Enter your full name" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtnm" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter your full name"></asp:RequiredFieldValidator>
                        </div>


                        <div class="mb-3">
                            <label class="form-label">Gender</label>
                            <%-- <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter your full name" CssClass="form-control"></asp:TextBox>--%>
                            <asp:RadioButtonList ID="rdbgen" runat="server" AutoPostBack="True" CssClass="form-control">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtnm" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter your full name"></asp:RequiredFieldValidator>
                        </div>


                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter your email"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-.+']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please enter a valid email address"></asp:RegularExpressionValidator>
                        </div>


                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Create a password" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red" ErrorMessage="Please create a password"></asp:RequiredFieldValidator>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Upload your Passport size photo</label>
                            <%--<asp:TextBox ID="TextBox1" runat="server" TextMode="Password" placeholder="Create a password" CssClass="form-control"></asp:TextBox>--%>
                            <asp:FileUpload ID="flpimg" runat="server" TextMode="File Upload" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red" ErrorMessage="Please create a password"></asp:RequiredFieldValidator>
                        </div>



                        <asp:Button ID="btnRegister" runat="server" Text="Register" class="btn btn-outline-primary w-100" OnClick="btnRegister_Click" />

                        <div class="mt-3">
                            <%--<asp:Label ID="lblStatus" runat="server" Font-Bold="True" ForeColor="#198754" Text=""></asp:Label>--%>
                        </div>

                        <p class="text-center text-muted mt-3 mb-0">Already have an account? <a href="UserLogin.aspx" class="text-decoration-none">Login here</a></p>

                    </div>
                </div>
            </div>
        </div>
    </main>

</asp:Content>

