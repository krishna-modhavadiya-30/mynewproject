<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Librarian_active_student.aspx.cs" Inherits="ASP.Net_website.Librarian_active_student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- Bootstrap 5 CSS (આના લીધે ડિઝાઈન સેટ થતી ન હતી) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    
    <!-- FontAwesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.net/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder2">
   <%-- <main>
    <section class="hero-section py-5">
        <div class="container">
            <div class="row align-items-center g-5">
                <div class="col-lg-7">
                    <p class="text-primary fw-semibold mb-3">
                        Modern Digital Library Experience</p>
                    <h1 class="display-5 fw-bold mb-4">Discover, Borrow, and Manage Books with Ease.</h1>
                    <p class="lead text-muted mb-4">
                        A smart library management experience designed for students, librarians, and administrators.
                    </p>
                    <div class="d-flex flex-wrap gap-3">
                        <a class="btn btn-primary rounded-pill px-4 py-2" href="Categories.aspx">Explore Books</a> <a class="btn btn-outline-primary rounded-pill px-4 py-2" href="StudentRegistration.aspx">Join Library</a>
                    </div>
                    <div class="row mt-5 g-3">
                        <div class="col-md-4">
                            <div class="stat-card p-3 rounded-4 shadow-sm bg-white">
                                <h3 class="fw-bold mb-1">12K+</h3>
                                <p class="text-muted mb-0">
                                    Books Available</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stat-card p-3 rounded-4 shadow-sm bg-white">
                                <h3 class="fw-bold mb-1">4.8/5</h3>
                                <p class="text-muted mb-0">
                                    Student Rating</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="stat-card p-3 rounded-4 shadow-sm bg-white">
                                <h3 class="fw-bold mb-1">24/7</h3>
                                <p class="text-muted mb-0">
                                    Access Support</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <img src="https://images.unsplash.com/photo-1507842217343-583bb7270b66?auto=format&fit=crop&w=900&q=80" alt="Library interior" class="img-fluid rounded-4 shadow" />
                </div>
            </div>
        </div>
    </section>
    <section class="py-5 bg-light">
        <div class="container">
            <div class="section-heading text-center mb-5">
                <p class="text-primary fw-semibold mb-2">
                    Featured Categories</p>
                <h2 class="fw-bold">Explore Different Learning Areas</h2>
            </div>
            <div class="row g-4">
                <div class="col-md-6 col-lg-3">
                    <div class="card h-100 border-0 shadow-sm rounded-4">
                        <img src="https://images.unsplash.com/photo-1516321497487-e288fb19713f?auto=format&fit=crop&w=600&q=80" class="card-img-top rounded-top-4" alt="Programming" height="180" />
                        <div class="card-body">
                            <h5 class="card-title">Programming</h5>
                            <p class="card-text text-muted">
                                Modern coding guides and software development resources.</p>
                            <a href="Categories.aspx" class="btn btn-outline-primary btn-sm">View</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="card h-100 border-0 shadow-sm rounded-4">
                        <img src="https://images.unsplash.com/photo-1532094349884-543bc11b234d?auto=format&fit=crop&w=600&q=80" class="card-img-top rounded-top-4" alt="Science" height="180" />
                        <div class="card-body">
                            <h5 class="card-title">Science</h5>
                            <p class="card-text text-muted">
                                Explore engineering, biology, and scientific discoveries.</p>
                            <a href="Categories.aspx" class="btn btn-outline-primary btn-sm">View</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="card h-100 border-0 shadow-sm rounded-4">
                        <img src="https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=600&q=80" class="card-img-top rounded-top-4" alt="Technology" height="180" />
                        <div class="card-body">
                            <h5 class="card-title">Technology</h5>
                            <p class="card-text text-muted">
                                The latest books on AI, robotics, and digital innovation.</p>
                            <a href="Categories.aspx" class="btn btn-outline-primary btn-sm">View</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="card h-100 border-0 shadow-sm rounded-4">
                        <img src="https://images.unsplash.com/photo-1516979187457-637abb4f9353?auto=format&fit=crop&w=600&q=80" class="card-img-top rounded-top-4" alt="History" height="180" />
                        <div class="card-body">
                            <h5 class="card-title">History</h5>
                            <p class="card-text text-muted">
                                Rich insights into cultures, history, and global events.</p>
                            <a href="Categories.aspx" class="btn btn-outline-primary btn-sm">View</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="py-5">
        <div class="container">
            <div class="section-heading text-center mb-5">
                <p class="text-primary fw-semibold mb-2">
                    Featured Books</p>
                <h2 class="fw-bold">Popular Titles in the Library</h2>
            </div>
            <div class="row g-4">
                <div class="col-md-6 col-lg-3">
                    <div class="card border-0 shadow-sm rounded-4 h-100">
                        <img src="https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&w=600&q=80" class="card-img-top rounded-top-4" alt="Book" height="220" />
                        <div class="card-body">
                            <h5 class="card-title">Clean Code</h5>
                            <p class="text-muted mb-2">
                                Robert C. Martin</p>
                            <p class="small text-primary">
                                Programming</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="badge bg-success-subtle text-success">Available</span> <span class="text-warning">★ 4.8</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="card border-0 shadow-sm rounded-4 h-100">
                        <img src="https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&w=600&q=80" class="card-img-top rounded-top-4" alt="Book" height="220" />
                        <div class="card-body">
                            <h5 class="card-title">Physics for Engineers</h5>
                            <p class="text-muted mb-2">
                                M. Sharma</p>
                            <p class="small text-primary">
                                Science</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="badge bg-warning-subtle text-warning">Issued</span> <span class="text-warning">★ 4.5</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="card border-0 shadow-sm rounded-4 h-100">
                        <img src="https://images.unsplash.com/photo-1495446815901-a7297e633e8d?auto=format&fit=crop&w=600&q=80" class="card-img-top rounded-top-4" alt="Book" height="220" />
                        <div class="card-body">
                            <h5 class="card-title">The Modern Web</h5>
                            <p class="text-muted mb-2">
                                A. Ray</p>
                            <p class="small text-primary">
                                Technology</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="badge bg-success-subtle text-success">Available</span> <span class="text-warning">★ 4.7</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="card border-0 shadow-sm rounded-4 h-100">
                        <img src="https://images.unsplash.com/photo-1519682337058-a94d519337bc?auto=format&fit=crop&w=600&q=80" class="card-img-top rounded-top-4" alt="Book" height="220" />
                        <div class="card-body">
                            <h5 class="card-title">The History of Time</h5>
                            <p class="text-muted mb-2">
                                S. Thomas</p>
                            <p class="small text-primary">
                                History</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="badge bg-success-subtle text-success">Available</span> <span class="text-warning">★ 4.9</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="py-5 bg-light">
        <div class="container">
            <div class="section-heading text-center mb-5">
                <p class="text-primary fw-semibold mb-2">
                    System Pages</p>
                <h2 class="fw-bold">Everything You Need in One Library Portal</h2>
            </div>
            <div class="row g-4">
                <div class="col-md-6 col-lg-4">
                    <div class="preview-card p-4 rounded-4 bg-white shadow-sm h-100">
                        <h5 class="fw-bold">Student Registration</h5>
                        <p class="text-muted">
                            Create student accounts with profile upload and secure credentials.</p>
                        <a href="StudentRegistration.aspx" class="btn btn-sm btn-outline-primary">Open Page</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="preview-card p-4 rounded-4 bg-white shadow-sm h-100">
                        <h5 class="fw-bold">Admin Dashboard</h5>
                        <p class="text-muted">
                            Monitor books, students, issued items, and recent activities.</p>
                        <a href="AdminDashboard.aspx" class="btn btn-sm btn-outline-primary">Open Page</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="preview-card p-4 rounded-4 bg-white shadow-sm h-100">
                        <h5 class="fw-bold">Book Search</h5>
                        <p class="text-muted">
                            Search by title, category, or availability in seconds.</p>
                        <a href="BookSearch.aspx" class="btn btn-sm btn-outline-primary">Open Page</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="preview-card p-4 rounded-4 bg-white shadow-sm h-100">
                        <h5 class="fw-bold">Issue Book</h5>
                        <p class="text-muted">
                            Issue books to students with clear issue and return dates.</p>
                        <a href="IssueBook.aspx" class="btn btn-sm btn-outline-primary">Open Page</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="preview-card p-4 rounded-4 bg-white shadow-sm h-100">
                        <h5 class="fw-bold">Return Book</h5>
                        <p class="text-muted">
                            Track returned books and calculate fines instantly.</p>
                        <a href="ReturnBook.aspx" class="btn btn-sm btn-outline-primary">Open Page</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="preview-card p-4 rounded-4 bg-white shadow-sm h-100">
                        <h5 class="fw-bold">Availability</h5>
                        <p class="text-muted">
                            View available, issued, and reserved books at a glance.</p>
                        <a href="Availability.aspx" class="btn btn-sm btn-outline-primary">Open Page</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="py-5">
        <div class="container">
            <div class="row align-items-center g-5">
                <div class="col-lg-6">
                    <img src="https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?auto=format&fit=crop&w=900&q=80" alt="Library services" class="img-fluid rounded-4 shadow" />
                </div>
                <div class="col-lg-6">
                    <p class="text-primary fw-semibold mb-2">
                        Why Choose Us</p>
                    <h2 class="fw-bold mb-4">A library system built for modern study habits</h2>
                    <ul class="list-unstyled">
                        <li class="mb-3"><i class="bi bi-check-circle-fill text-primary me-2"></i>Easy book search and filtering</li>
                        <li class="mb-3"><i class="bi bi-check-circle-fill text-primary me-2"></i>Simple issue and return workflows</li>
                        <li class="mb-3"><i class="bi bi-check-circle-fill text-primary me-2"></i>Professional dashboard for admin controls</li>
                        <li class="mb-3"><i class="bi bi-check-circle-fill text-primary me-2"></i>Responsive design for all devices</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <section class="py-5 bg-light">
        <div class="container">
            <div class="section-heading text-center mb-5">
                <p class="text-primary fw-semibold mb-2">
                    Testimonials</p>
                <h2 class="fw-bold">What Students Say</h2>
            </div>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm rounded-4 h-100">
                        <div class="card-body">
                            <p class="text-muted">
                                “The interface is simple, attractive, and fast. It makes finding books effortless.”</p>
                            <h6 class="fw-bold mb-0">Ananya Singh</h6>
                            <small class="text-primary">BCA Student</small>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm rounded-4 h-100">
                        <div class="card-body">
                            <p class="text-muted">
                                “The dashboard helps us track student activity and book movement very clearly.”</p>
                            <h6 class="fw-bold mb-0">Ravi Kumar</h6>
                            <small class="text-primary">Library Admin</small>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-0 shadow-sm rounded-4 h-100">
                        <div class="card-body">
                            <p class="text-muted">
                                “It feels like a real university library portal, polished and easy to use.”</p>
                            <h6 class="fw-bold mb-0">Meera Rao</h6>
                            <small class="text-primary">Final Year Student</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="py-5">
        <div class="container">
            <div class="row align-items-center g-4 p-4 rounded-4 bg-primary text-white shadow">
                <div class="col-lg-8">
                    <h3 class="fw-bold mb-2">Stay updated with new arrivals</h3>
                    <p class="mb-0">
                        Subscribe to receive updates on new books and library events.</p>
                </div>
                <div class="col-lg-4">
                    <form class="d-flex flex-wrap gap-2">
                        <input type="email" class="form-control" placeholder="Your email" />
                        <button class="btn btn-light text-primary">
                            Subscribe
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </section>
    </main>--%>

    <div class="container py-4">
        
        <!-- Header Card -->
        <div class="card shadow-sm border-0 rounded-4 mb-4 p-4">
            <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                <div>
                    <h2 class="fw-bold text-dark mb-1">Registered Student Records 👥</h2>
                    <p class="text-muted mb-0">List of all registered students in the library system.</p>
                </div>
                <asp:HyperLink ID="btnBack" runat="server" NavigateUrl="~/Librarian_deshboard.aspx" CssClass="btn btn-outline-primary rounded-3 px-3">
                    <i class="fa-solid fa-arrow-left me-1"></i> Back to Dashboard
                </asp:HyperLink>
            </div>
        </div>

        <!-- Filter & Search Card -->
        <div class="card shadow-sm border-0 rounded-4 p-4 mb-4">
            <div class="row g-3">
                <div class="col-md-8">
                    <label class="form-label text-muted fw-semibold">Search Student</label>
                    <div class="input-group">
                        <span class="input-group-text bg-light border-end-0">
                            <i class="fa-solid fa-magnifying-glass text-muted"></i>
                        </span>
                        <input type="text" id="studentSearchInput" class="form-control bg-light border-start-0" placeholder="Search by Name, Email..." onkeyup="filterStudents()" />
                    </div>
                </div>
                <div class="col-md-4">
                    <label class="form-label text-muted fw-semibold">Filter Gender</label>
                    <select id="genderFilter" class="form-select bg-light" onchange="filterStudents()">
                        <option value="all">All Genders</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Dynamic Table (Structure Ready for Database Rows) -->
        <div class="card shadow-sm border-0 rounded-4 overflow-hidden">
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover align-middle mb-0" id="studentsTable">
                        <thead class="table-light">
                            <tr>
                                <th class="ps-4 py-3 text-secondary">#ID</th>
                                <th class="py-3 text-secondary">Full Name</th>
                                <th class="py-3 text-secondary">Gender</th>
                                <th class="py-3 text-secondary">Email</th>
                                <th class="py-3 text-secondary">Photo</th>
                                <%--<th class="py-3 text-secondary text-center">Action</th>--%>
                            </tr>
                        </thead>
                        <tbody id="studentTableBody" runat="server">
                            <!-- જ્યારે Backend ડેટાબેઝ સાથે લિંક કરશો ત્યારે C# કોડ/Repeater થી Dynamic Rows અહીં Bind થશે -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

    <!-- JavaScript File -->
   <script src="js/script.js"></script>
</asp:Content>

