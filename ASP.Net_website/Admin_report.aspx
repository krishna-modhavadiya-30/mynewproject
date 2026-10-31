<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_report.aspx.cs" Inherits="ASP.Net_website.Admin_report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Reports Management</title>
    <!-- Bootstrap 5 CSS & Bootstrap Icons CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />

    <style type="text/css">
        * {
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
            color: #334155;
        }

        .page-header {
            background: linear-gradient(180deg, #e0f2fe 0%, #eef4ff 100%);
            padding: 40px 20px 30px 20px;
            border-bottom: 1px solid #e2e8f0;
        }

        .page-header h1 {
            color: #0f172a;
            font-size: 30px;
            font-weight: 800;
        }

        .dashboard-container {
            max-width: 1100px;
            margin: 0 auto;
        }

        .report-card {
            background: #ffffff;
            border-radius: 20px;
            padding: 30px 24px;
            text-align: center;
            border: 1px solid #f1f5f9;
            box-shadow: 0 10px 25px rgba(37, 99, 235, 0.05);
            transition: all 0.3s ease;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .report-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 16px 35px rgba(37, 99, 235, 0.12);
        }

        /* Pure CSS Circle Icon Styling */
        .icon-box {
            width: 70px;
            height: 70px;
            background-color: #eff6ff;
            color: #2563eb;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            margin: 0 auto 18px auto;
            border: 1px solid #dbeafe;
        }

        .report-card h3 {
            color: #0f172a;
            font-size: 20px;
            font-weight: 800;
            margin-bottom: 8px;
        }

        .report-card p {
            color: #64748b;
            font-size: 13.5px;
            margin-bottom: 22px;
            line-height: 1.5;
        }

        .btn-report {
            background-color: #2563eb;
            color: #ffffff !important;
            border: none;
            padding: 10px 28px;
            font-size: 14px;
            font-weight: 700;
            border-radius: 50px;
            cursor: pointer;
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.25);
            transition: all 0.2s ease;
            display: inline-block;
        }

        .btn-report:hover {
            background-color: #1d4ed8;
            transform: translateY(-1px);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <section class="page-header text-center">
            <div class="container">
                <h1 class="mb-2">Admin System Reports</h1>
                <p class="text-muted mb-0">Generate and export official PDF reports for library operations.</p>
            </div>
        </section>

        <main class="py-5">
            <div class="dashboard-container px-3">
                <div class="row g-4 justify-content-center">
                    
                    <!-- 1. Book Availability -->
                    <div class="col-md-4">
                        <div class="report-card">
                            <div>
                                <div class="icon-box">
                                    <i class="bi bi-book-half"></i>
                                </div>
                                <h3>Book Availability</h3>
                                <p>Real-time Book Stock & Available Copies Report.</p>
                            </div>
                            <div>
                                <asp:Button ID="btnBookStock" runat="server" Text="View Report" CssClass="btn-report" OnClick="btnBookStock_Click" />
                            </div>
                        </div>
                    </div>

                    <!-- 2. Approved Issues -->
                    <div class="col-md-4">
                        <div class="report-card">
                            <div>
                                <div class="icon-box">
                                    <i class="bi bi-journal-check"></i>
                                </div>
                                <h3>Approved Issues</h3>
                                <p>Librarian Approved Book Issue Request Records.</p>
                            </div>
                            <div>
                                <asp:Button ID="btnApproved" runat="server" Text="View Report" CssClass="btn-report" OnClick="btnApproved_Click" />
                            </div>
                        </div>
                    </div>

                    <!-- 3. Returned Books -->
                    <div class="col-md-4">
                        <div class="report-card">
                            <div>
                                <div class="icon-box">
                                    <i class="bi bi-journal-arrow-down"></i>
                                </div>
                                <h3>Returned Books</h3>
                                <p>Complete History Logs of Returned Library Books.</p>
                            </div>
                            <div>
                                <asp:Button ID="btnReturned" runat="server" Text="View Report" CssClass="btn-report" OnClick="btnReturned_Click" />
                            </div>
                        </div>
                    </div>

                    <!-- 4. Active Students -->
                    <div class="col-md-4">
                        <div class="report-card">
                            <div>
                                <div class="icon-box">
                                    <i class="bi bi-person-workspace"></i>
                                </div>
                                <h3>Active Students</h3>
                                <p>Registered Student Profiles & User Master List.</p>
                            </div>
                            <div>
                                <asp:Button ID="btnStudents" runat="server" Text="View Report" CssClass="btn-report" OnClick="btnStudents_Click" />
                            </div>
                        </div>
                    </div>

                    <!-- 5. Contact Messages -->
                    <div class="col-md-4">
                        <div class="report-card">
                            <div>
                                <div class="icon-box">
                                    <i class="bi bi-envelope-paper-heart"></i>
                                </div>
                                <h3>Contact Messages</h3>
                                <p>User Messages & Feedback Inquiry Reports.</p>
                            </div>
                            <div>
                                <asp:Button ID="btnContact" runat="server" Text="View Report" CssClass="btn-report" OnClick="btnContact_Click" />
                            </div>
                        </div>
                    </div>

                    <!-- 6. Student History (userdata.rpt) -->
                    <div class="col-md-4">
                        <div class="report-card">
                            <div>
                                <div class="icon-box">
                                    <i class="bi bi-person-lines-fill"></i>
                                </div>
                                <h3>Student History Log</h3>
                                <p>Complete Student Issue & Return History .</p>
                            </div>
                            <div>
                                <asp:Button ID="btnUserData" runat="server" Text="View Report" CssClass="btn-report" OnClick="btnUserData_Click" />
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </main>

    </form>
</body>
</html>