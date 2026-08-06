<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookSearch.aspx.cs" Inherits="ASP.Net_website.BookSearch" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <section class="page-header">
      <div class="container text-center">
        <p class="text-primary fw-semibold mb-2">Book Search</p>
        <h1 class="fw-bold mb-3">Find the Right Book Quickly</h1>
        <p class="text-muted mb-0">Search by book name, author, category, ISBN, or availability status.</p>
      </div>
    </section>

    <main class="py-5">
      <div class="container">
        <div class="page-card p-4 mb-4">
          <div class="row g-3">
            <div class="col-md-4">
              <input type="text" class="form-control" id="bookSearchInput" placeholder="Search by name, author, ISBN..." />
            </div>
            <div class="col-md-3">
              <select class="form-select" id="categoryFilter">
                <option value="">All Categories</option>
              </select>
            </div>
            <div class="col-md-3">
              <select class="form-select" id="sortBy">
                <option value="default">Sort By</option>
                <option value="name-asc">Name (A-Z)</option>
                <option value="name-desc">Name (Z-A)</option>
                <option value="availability-desc">Availability (High to Low)</option>
                <option value="availability-asc">Availability (Low to High)</option>
              </select>
            </div>
            <div class="col-md-2">
              <select class="form-select" id="availabilityFilter">
                <option value="">All Status</option>
                <option value="available">Available</option>
                <option value="out-of-stock">Out of Stock</option>
              </select>
            </div>
          </div>
        </div>

        <div class="alert alert-light border d-none" id="noResultsMessage">No Book Found</div>
        <div class="row g-4" id="bookResults"></div>
        <nav class="mt-4 d-flex justify-content-center">
          <ul class="pagination" id="paginationContainer"></ul>
        </nav>
      </div>
    </main>
</asp:Content>

