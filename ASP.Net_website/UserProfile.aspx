<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="ASP.Net_website.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .profile-container {
            max-width: 950px;
            margin: 30px auto;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .profile-card {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
            padding: 30px;
            margin-bottom: 30px;
        }

        .top-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .btn-home {
            background-color: #e0f2fe; /* આછો સ્કાય બ્લુ કલર */
            color: #0284c7; /* ઘાટો બ્લુ ટેક્સ્ટ (જેથી સરસ વંચાય) */
            border: 1px solid #bae6fd; /* લાઇટ બોર્ડર */
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 13px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
        }

            /* માઉસ ઉપર લઈ જતાં હોવર ઈફેક્ટ (ઓપ્શનલ) */
            .btn-home:hover {
                background-color: #bae6fd;
                color: #0369a1;
            }

        .btn-logout {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 13px;
            cursor: pointer;
            font-weight: 600;
        }

        .profile-header {
            display: flex;
            align-items: center;
            gap: 25px;
            border-bottom: 2px solid #f0f2f5;
            padding-bottom: 25px;
            margin-bottom: 25px;
        }

        .avatar-circle {
            width: 80px;
            height: 80px;
            background-color: #007bff;
            color: white;
            font-size: 32px;
            font-weight: bold;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 10px rgba(0,123,255,0.3);
        }

        .user-title h2 {
            margin: 0 0 5px 0;
            color: #2c3e50;
            font-size: 24px;
        }

        .badge-status {
            background-color: #e6f4ea;
            color: #137333;
            padding: 4px 12px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: 600;
        }

        .details-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 15px;
        }

        .info-item {
            background: #f8f9fa;
            padding: 12px 18px;
            border-radius: 8px;
            border-left: 4px solid #007bff;
        }

            .info-item label {
                display: block;
                font-size: 12px;
                color: #6c757d;
                font-weight: 600;
                text-transform: uppercase;
            }

            .info-item span {
                font-size: 15px;
                color: #333;
                font-weight: 600;
            }

        .section-title {
            color: #2c3e50;
            margin-bottom: 20px;
            font-size: 18px;
            border-left: 4px solid #28a745;
            padding-left: 10px;
        }

        .custom-grid {
            width: 100%;
            border-collapse: collapse;
            background: #ffffff;
            border-radius: 8px;
            overflow: hidden;
        }

            .custom-grid th {
                background-color: #343a40;
                color: #ffffff;
                padding: 14px;
                text-align: left;
                font-size: 14px;
            }

            .custom-grid td {
                padding: 12px 14px;
                border-bottom: 1px solid #e9ecef;
                color: #495057;
                font-size: 14px;
            }

        .badge-issued {
            background-color: #fff3cd;
            color: #856404;
            padding: 5px 10px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: bold;
        }

        .badge-returned {
            background-color: #d4edda;
            color: #155724;
            padding: 5px 10px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <%--<main>
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
    <div class="profile-container">

        <!-- User Profile Card -->
        <div class="profile-card">
            <div class="top-actions">
                <asp:Button ID="btnBackHome" runat="server" Text="← Back to Home" OnClick="btnBackHome_Click" CssClass="btn-home" CausesValidation="false" />
                <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn-logout" CausesValidation="false" />
            </div>

            <div class="profile-header">
                <!-- Circular Text Avatar -->
                <div class="avatar-circle">
                    <asp:Label ID="lblAvatar" runat="server">S</asp:Label>
                </div>
                <div class="user-title">
                    <h2>
                        <asp:Label ID="lblUsername" runat="server" Text="Student Name"></asp:Label></h2>
                    <span class="badge-status">Active Account</span>
                </div>
            </div>

            <div class="details-grid">
                <div class="info-item">
                    <label>User ID / Student Roll No</label>
                    <span>
                        <asp:Label ID="lblUserID" runat="server" Text="N/A"></asp:Label></span>
                </div>
                <div class="info-item">
                    <label>Email Address</label>
                    <span>
                        <asp:Label ID="lblEmail" runat="server" Text="N/A"></asp:Label></span>
                </div>
            </div>
        </div>

        <!-- Issue / Return Book History Grid -->
        <div class="profile-card">
            <h3 class="section-title">Issued & Returned Books History</h3>

            <asp:GridView ID="gridStudentBooks" runat="server" AutoGenerateColumns="False"
                CssClass="custom-grid" EmptyDataText="No book history available at the moment.">
                <Columns>
                    <asp:BoundField DataField="BookID" HeaderText="Book ID" />
                    <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                    <asp:BoundField DataField="IssueDate" HeaderText="Issue Date" />
                    <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <span class='<%# Eval("Status").ToString() == "Issued" ? "badge-issued" : "badge-returned" %>'>
                                <%# Eval("Status") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

    </div>

</asp:Content>

