<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="ASP.Net_website.ChangePassword" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="py-5">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-6">
            <div class="page-card p-4 p-md-5">
              <h2 class="fw-bold mb-3">Change Password</h2>
              <p class="text-muted">Update your account password securely.</p>
              <form>
                <div class="mb-3">
                  <label class="form-label">Current Password</label>
                  <input type="password" class="form-control" />
                </div>
                <div class="mb-3">
                  <label class="form-label">New Password</label>
                  <input type="password" class="form-control" />
                </div>
                <div class="mb-3">
                  <label class="form-label">Confirm Password</label>
                  <input type="password" class="form-control" />
                </div>
                <button class="btn btn-primary">Update Password</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </main>
</asp:Content>

