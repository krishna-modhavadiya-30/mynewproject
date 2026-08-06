<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ASP.Net_website.Login" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="py-5">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-5">
            <div class="page-card p-4 p-md-5">
              <h2 class="fw-bold mb-3">Administrator Login</h2>
              <p class="text-muted">Sign in to access the admin dashboard securely.</p>
              <form id="loginForm">
                <div class="mb-3">
                  <label class="form-label">Email</label>
                  <input type="email" class="form-control" id="adminEmail" placeholder="Enter admin email" required />
                </div>
                <div class="mb-3">
                  <label class="form-label">Password</label>
                  <input type="password" class="form-control" id="adminPassword" placeholder="Enter password" required />
                </div>
                <div class="alert alert-danger d-none" id="loginMessage"></div>
                <button class="btn btn-primary w-100">Login</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </main>
</asp:Content>

