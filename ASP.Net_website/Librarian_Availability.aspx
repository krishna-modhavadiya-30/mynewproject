<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Availability.aspx.cs" Inherits="ASP.Net_website.Availability" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="page-header">
      <div class="container text-center">
        <p class="text-primary fw-semibold mb-2">Book Availability</p>
        <h1 class="fw-bold mb-3">Track Book Status</h1>
        <p class="text-muted mb-0">See what books are available, issued, or reserved.</p>
      </div>
    </section>

    <main class="py-5">
      <div class="container">
        <div class="row g-4">
          <div class="col-md-4">
            <div class="dashboard-card text-center">
              <h3 class="fw-bold text-success" id="totalStockCount">0</h3>
              <p class="mb-0">Total Stock</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="dashboard-card text-center">
              <h3 class="fw-bold text-warning" id="lowStockCount">0</h3>
              <p class="mb-0">Low Stock Titles</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="dashboard-card text-center">
              <h3 class="fw-bold text-danger" id="outOfStockCount">0</h3>
              <p class="mb-0">Out of Stock</p>
            </div>
          </div>
        </div>
      </div>
    </main>
</asp:Content>

