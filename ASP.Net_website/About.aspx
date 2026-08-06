<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ASP.Net_website.About" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="page-header">
      <div class="container text-center">
        <p class="text-primary fw-semibold mb-2">About the Library</p>
        <h1 class="fw-bold mb-3">Our Mission, Vision, and Values</h1>
        <p class="text-muted mb-0">The library is designed to support students with smart access to knowledge.</p>
      </div>
    </section>

    <main class="py-5">
      <div class="container">
        <div class="row g-4 mb-5">
          <div class="col-lg-4">
            <div class="page-card p-4 h-100">
              <h4 class="fw-bold">Mission</h4>
              <p class="text-muted">To provide students with an efficient and user-friendly platform for discovering and managing books.</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="page-card p-4 h-100">
              <h4 class="fw-bold">Vision</h4>
              <p class="text-muted">To create a digital library experience that supports academic excellence and lifelong learning.</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="page-card p-4 h-100">
              <h4 class="fw-bold">Objectives</h4>
              <p class="text-muted">To streamline issuance, accessibility, cataloging, and student participation in library services.</p>
            </div>
          </div>
        </div>

        <div class="row g-4">
          <div class="col-lg-6">
            <div class="page-card p-4">
              <h4 class="fw-bold mb-3">Library Rules</h4>
              <ul class="text-muted">
                <li>Maintain silence in reading areas.</li>
                <li>Return books within the due date.</li>
                <li>Do not damage books or digital resources.</li>
                <li>Use library cards responsibly.</li>
              </ul>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="page-card p-4">
              <h4 class="fw-bold mb-3">Library Gallery</h4>
              <img src="https://images.unsplash.com/photo-1481627834876-b7833e8f5570?auto=format&fit=crop&w=1000&q=80" alt="Library gallery" class="img-fluid rounded-4" />
            </div>
          </div>
        </div>
      </div>
    </main>

    <%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/script.js"></script>--%>
  <%--</body>
</html>--%>
</asp:Content>

