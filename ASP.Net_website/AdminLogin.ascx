<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.ascx.cs" Inherits="ASP.Net_website.AdminLogin" %>

<div class="modal fade" id="adminLoginModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Administrator Login</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <asp:Panel ID="pnlLogin" runat="server" DefaultButton="btnAdminLogin">
                    <div class="mb-3">
                        <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="form-label" />
                        <asp:TextBox ID="txtAdminEmail" runat="server" CssClass="form-control" TextMode="Email" />
                    </div>
                    <div class="mb-3">
                        <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="form-label" />
                        <asp:TextBox ID="txtAdminPassword" runat="server" CssClass="form-control" TextMode="Password" />
                    </div>
                    <asp:Label ID="lblAdminMessage" runat="server" CssClass="alert alert-danger d-block" Visible="false" />
                    <asp:Button ID="btnAdminLogin" runat="server" Text="Sign in" CssClass="btn btn-primary w-100" CausesValidation="false" OnClick="btnAdminLogin_Click" />
                </asp:Panel>
            </div>
        </div>
    </div>
</div>
