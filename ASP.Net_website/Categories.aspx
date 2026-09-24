<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="ASP.Net_website.Categories" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <section class="page-header">
        <div class="container text-center">
            <p class="text-primary fw-semibold mb-2">Book Categories</p>
            <h1 class="fw-bold mb-3">Browse By Subject</h1>
            <p class="text-muted mb-0">Find your next favorite book from our curated categories.</p>
        </div>
    </section>

    <main class="py-5">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-6">
                    <div class="page-card p-4">

                        <h4 class="fw-bold mb-4">
                            <asp:HyperLink ID="lnkCategory" runat="server" NavigateUrl="~/Show_category.aspx?catid=1" CssClass="text-decoration-none color-primary">
        Programming
    </asp:HyperLink>
                        </h4>

                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="card border-0 shadow-sm rounded-4 h-100">
                                    <img src="https://images.unsplash.com/photo-1516116216624-53e697fedbea?auto=format&fit=crop&w=600&q=80" class="card-img-top book-cover" alt="Clean Code" />
                                    <div class="card-body">
                                        <h6 class="fw-bold">Clean Code</h6>
                                        <p class="text-muted small mb-1">Robert C. Martin</p>
                                        <p class="small text-primary">Category: Programming</p>
                                        <p class="small">Availability: Available</p>
                                        <p class="small text-warning">Rating: 4.8</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card border-0 shadow-sm rounded-4 h-100">
                                    <img src="https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=600&q=80" class="card-img-top book-cover" alt="JavaScript Guide" />
                                    <div class="card-body">
                                        <h6 class="fw-bold">JavaScript Guide</h6>
                                        <p class="text-muted small mb-1">A. Sharma</p>
                                        <p class="small text-primary">Category: Programming</p>
                                        <p class="small">Availability: Issued</p>
                                        <p class="small text-warning">Rating: 4.5</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="page-card p-4">
                        <h4 class="fw-bold mb-4">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Show_category.aspx?catid=1" CssClass="text-decoration-none color-primary">
   Science
</asp:HyperLink>
                        </h4>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="card border-0 shadow-sm rounded-4 h-100">
                                    <img src="https://images.unsplash.com/photo-1532094349884-543bc11b234d?auto=format&fit=crop&w=600&q=80" class="card-img-top book-cover" alt="Physics for Engineers" />
                                    <div class="card-body">
                                        <h6 class="fw-bold">Physics for Engineers</h6>
                                        <p class="text-muted small mb-1">M. Sharma</p>
                                        <p class="small text-primary">Category: Science</p>
                                        <p class="small">Availability: Issued</p>
                                        <p class="small text-warning">Rating: 4.5</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card border-0 shadow-sm rounded-4 h-100">
                                    <img src="https://images.unsplash.com/photo-1532187863486-abf9dbad1b69?auto=format&fit=crop&w=600&q=80" class="card-img-top book-cover" alt="Biology Basics" />
                                    <div class="card-body">
                                        <h6 class="fw-bold">Biology Basics</h6>
                                        <p class="text-muted small mb-1">N. Patel</p>
                                        <p class="small text-primary">Category: Science</p>
                                        <p class="small">Availability: Available</p>
                                        <p class="small text-warning">Rating: 4.6</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="page-card p-4">

                        <h4 class="fw-bold mb-4">
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Show_category.aspx?catid=1" CssClass="text-decoration-none color-primary">
   Technology
</asp:HyperLink>
                        </h4>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="card border-0 shadow-sm rounded-4 h-100">
                                    <img src="https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=600&q=80" class="card-img-top book-cover" alt="The Modern Web" />
                                    <div class="card-body">
                                        <h6 class="fw-bold">The Modern Web</h6>
                                        <p class="text-muted small mb-1">A. Ray</p>
                                        <p class="small text-primary">Category: Technology</p>
                                        <p class="small">Availability: Available</p>
                                        <p class="small text-warning">Rating: 4.7</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card border-0 shadow-sm rounded-4 h-100">
                                    <img src="https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=600&q=80" class="card-img-top book-cover" alt="AI Essentials" />
                                    <div class="card-body">
                                        <h6 class="fw-bold">AI Essentials</h6>
                                        <p class="text-muted small mb-1">R. Jain</p>
                                        <p class="small text-primary">Category: Technology</p>
                                        <p class="small">Availability: Reserved</p>
                                        <p class="small text-warning">Rating: 4.8</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="page-card p-4">
                        <h4 class="fw-bold mb-4">
                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Show_category.aspx?catid=1" CssClass="text-decoration-none color-primary">
  Medical
</asp:HyperLink>
                        </h4>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="card border-0 shadow-sm rounded-4 h-100">
                                    <img src="https://images.unsplash.com/photo-1576091160550-2173dba999ef?auto=format&fit=crop&w=600&q=80" class="card-img-top book-cover" alt="Human Anatomy" />
                                    <div class="card-body">
                                        <h6 class="fw-bold">Human Anatomy</h6>
                                        <p class="text-muted small mb-1">Dr. K. Rao</p>
                                        <p class="small text-primary">Category: Medical</p>
                                        <p class="small">Availability: Available</p>
                                        <p class="small text-warning">Rating: 4.9</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card border-0 shadow-sm rounded-4 h-100">
                                    <img src="https://images.unsplash.com/photo-1584515933487-779824d29309?auto=format&fit=crop&w=600&q=80" class="card-img-top book-cover" alt="Medical Ethics" />
                                    <div class="card-body">
                                        <h6 class="fw-bold">Medical Ethics</h6>
                                        <p class="text-muted small mb-1">Dr. S. Verma</p>
                                        <p class="small text-primary">Category: Medical</p>
                                        <p class="small">Availability: Issued</p>
                                        <p class="small text-warning">Rating: 4.4</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>

