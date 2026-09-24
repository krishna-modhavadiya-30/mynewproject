<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ASP.Net_website.Home" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Campus Library | Home</title>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
            rel="stylesheet" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/responsive.css" />
    </head>
    <body>
        <header class="sticky-top">
            <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
                <div class="container">
                    <a class="navbar-brand d-flex align-items-center" href="Home.aspx">
                        <img src="https://images.unsplash.com/photo-1521587760476-6c12a4b040da?auto=format&fit=crop&w=80&q=80" alt="Library logo" class="me-2 rounded-circle" width="42" height="42" />
                        <span class="fw-bold text-primary">Campus Library</span> </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav ms-auto align-items-lg-center gap-lg-2">
                            <li class="nav-item"><a class="nav-link active" href="Home.aspx">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="BookSearch.aspx">Book Search</a></li>
                            <li class="nav-item"><a class="nav-link" href="Categories.aspx">Categories</a></li>
                            <li class="nav-item"><a class="nav-link" href="IssueBook.aspx">Issue Book</a></li>
                            <li class="nav-item"><a class="nav-link" href="ReturnBook.aspx">Return Book</a></li>
                            <%--<li class="nav-item"><a class="nav-link" href="Librarian_deshboard.aspx">Librarian Panel</a></li>--%>
                            <li class="nav-item"><a class="nav-link" href="About.aspx">About</a></li>
                            <li class="nav-item"><a class="nav-link" href="Contact.aspx">Contact</a></li>
                            <li class="nav-item dropdown ms-lg-3"><a class="nav-link dropdown-toggle" href="#" id="loginDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Login</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="loginDropdown">
                                   
                                    <li><a class="dropdown-item" href="UserLogin.aspx">User Login</a></li>
                                     <li><a class="dropdown-item" href="UserProfile.aspx">User Profile</a></li>
                                    <li><a class="dropdown-item" href="LibrarianLogin.aspx">Librarian Panel</a></li>

                                    <%--<a href="LibrarianLogin.aspx" runat="server">Librarian Login</a>--%>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li>
                                        <button class="dropdown-item" type="button" id="adminLoginBtn" data-bs-toggle="modal" data-bs-target="#adminLoginModal">
                                            Admin Login
                                        </button>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
</asp:Content>


