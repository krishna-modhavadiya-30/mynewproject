<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ASP.Net_website.Contact" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="page-header">
      <div class="container text-center">
        <p class="text-primary fw-semibold mb-2">Contact Us</p>
        <h1 class="fw-bold mb-3">Stay Connected With the Library</h1>
        <p class="text-muted mb-0">Reach out for support, feedback, or assistance.</p>
      </div>
    </section>

    <main class="py-5">
      <div class="container">
        <div class="row g-4">
          <div class="col-lg-5">
            <div class="page-card p-4">
              <h4 class="fw-bold mb-3">Get in Touch</h4>
              <p class="text-muted">We are happy to help with library access and services.</p>
              <ul class="list-unstyled">
                <li class="mb-3"><strong>Address:</strong> 12, Knowledge Avenue</li>
                <li class="mb-3"><strong>Phone:</strong> +91 98765 43210</li>
                <li class="mb-3"><strong>Email:</strong> info@campuslibrary.edu</li>
              </ul>
            </div>
          </div>
          <div class="col-lg-7">
            <div class="page-card p-4">
              <form>
                <div class="mb-3">
                 <%-- <label class="form-label">Your Name</label>
                  <input type="text" class="form-control" placeholder="Enter your name" />--%>
                  
                  <label class="form-label">Your Name</label>
                  <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Enter your name"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Please enter your name"></asp:RequiredFieldValidator>
                </div>
                
                <div class="mb-3">
                 <%-- <label class="form-label">Email</label>
                  <input type="email" class="form-control" placeholder="Enter your email" />--%>
                    <label class="form-label">Email</label>
                  <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Enter your email"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter your email"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-.+']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Please enter a valid email address"></asp:RegularExpressionValidator>
                </div>
                <div class="mb-3">
                 <%-- <label class="form-label">Message</label>
                  <textarea class="form-control" rows="5" placeholder="Write your message"></textarea>--%>
                    <label class="form-label">Message</label>
                  <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" class="form-control" placeholder="Write your message" OnTextChanged="txtMessage_TextChanged"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage" Display="Dynamic" ForeColor="Red" ErrorMessage="Please enter your message"></asp:RequiredFieldValidator>
                </div>
                <%--<button class="btn btn-primary">Send Message</button>--%>
                  <asp:Button ID="btnSend" runat="server" Text="Send Message" class="btn btn-primary w-100" OnClick="btnSend_Click" />
                  <div>
          <br />
          <asp:Label ID="lblContactStatus" runat="server" Font-Bold="True"  Text=""></asp:Label>
      </div>
              </form>
            </div>
          </div>
        </div>
        <div class="page-card p-0 mt-4 overflow-hidden">
          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3151.1234567890123!2d77.5945624!3d12.9715987!2m3!1f0!2f0!3f0!3m2!1m1!2s0x3bae1670c9b44e6d%3A0x5f4f1c8d4c8f6c38!5e0!3m2!1m1!2s!5m2!1m1!2s" width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
        </div>
      </div>
    </main>
</asp:Content>

