<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="ASP.Net_website.UserLogin" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
  <%--  <main class="py-5">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-6">
            <div class="page-card p-4 p-md-5">
              <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                  <h2 class="fw-bold mb-1">Library Access</h2>
                  <p class="text-muted mb-0">Login or register in one place to access library services.</p>
                </div>
                <span class="badge bg-primary bg-opacity-10 text-primary">Secure</span>
              </div>
              <form id="userLoginForm" autocomplete="off">
                <div class="mb-3">
                  <label class="form-label">Email</label>
                  <input type="email" autocomplete="off" class="form-control" id="userEmail" placeholder="Enter your email" required />
                </div>
                <div class="mb-3">
                  <label class="form-label">Password</label>
                  <input type="password" autocomplete="off" class="form-control" id="userPassword" placeholder="Enter password" required />
                </div>
                <div class="alert alert-danger d-none" id="userLoginMessage"></div>
                <button class="btn btn-primary w-100">Login</button>
              </form>
              <p class="text-center text-muted mt-3 mb-0">New here? <a href="StudentRegistration.aspx" class="text-decoration-none">Register now</a></p>
            </div>
          </div>
        </div>
      </div>
    </main>--%>

    <%--<main class="py-5">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-6">
            <div class="page-card p-4 p-md-5">
              <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                  <h2 class="fw-bold mb-1">Library Access</h2>
                  <p class="text-muted mb-0">Login or register in one place to access library services.</p>
                </div>
                <span class="badge bg-primary bg-opacity-10 text-primary">Secure</span>
              </div>
              
                <!-- 1. Email Input -->
                <div class="mb-3">
                  <label class="form-label">Email</label>
                  <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Enter your email" autocomplete="off"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter your email"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-.+']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please enter a valid email address"></asp:RegularExpressionValidator>
                </div>

                <!-- 2. Password Input -->
                <div class="mb-3">
                  <label class="form-label">Password</label>
                  <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control" placeholder="Enter password" autocomplete="off"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter your password"></asp:RequiredFieldValidator>
                </div>

                <!-- 3. Error/Status Message Label -->
                <div class="mt-2 mb-2">
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>
                </div>

                <!-- 4. Login Button -->
                <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-primary w-100" OnClick="btnLogin_Click" />
              
              <p class="text-center text-muted mt-3 mb-0">New here? <a href="StudentRegistration.aspx" class="text-decoration-none">Register now</a></p>
            </div>
          </div>
        </div>
      </div>
    </main>--%>

    <main class="py-5">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-6">
            <div class="page-card p-4 p-md-5">
              <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                  <h2 class="fw-bold mb-1">Library Access</h2>
                  <p class="text-muted mb-0">Login or register in one place to access library services.</p>
                </div>
                <span class="badge bg-primary bg-opacity-10 text-primary">Secure</span>
              </div>
              
                <!-- 1. Email Input -->
                <div class="mb-3">
                  <label class="form-label">Email</label>
                  <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Enter your email" autocomplete="off"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter your email"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-.+']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please enter a valid email address"></asp:RegularExpressionValidator>
                </div>

              
                <div class="mb-3">
                  <label class="form-label">Password</label>
                  <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control" placeholder="Enter password" autocomplete="off"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter your password"></asp:RequiredFieldValidator>
                </div>

              
           <%--     <div class="mb-3">
                  <label class="form-label">Confirm Password</label>
                  <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" class="form-control" placeholder="Confirm password" autocomplete="off"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword" Display="Dynamic" ForeColor="Red" ErrorMessage="Please confirm your password"></asp:RequiredFieldValidator>
                
                  <asp:CompareValidator ID="cvPassword" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" Display="Dynamic" ForeColor="Red" ErrorMessage="Passwords do not match!"></asp:CompareValidator>
                </div>--%>

                <div class="mt-2 mb-2">
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>
                </div>

             
                <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-primary w-100" OnClick="btnLogin_Click" />
              
              <p class="text-center text-muted mt-3 mb-0">New here? <a href="StudentRegistration.aspx" class="text-decoration-none">Register now</a></p>
            </div>
          </div>
        </div>
      </div>
    </main>
</asp:Content>

