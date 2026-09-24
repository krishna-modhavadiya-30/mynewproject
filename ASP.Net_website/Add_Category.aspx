<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Category.aspx.cs" Inherits="ASP.Net_website.Add_Category" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Category</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #eaf2ff; /* Dashboard header color match */
            margin: 0;
            padding: 40px 20px;
            color: #2b3674;
        }

        /* Top Header Container */
        .page-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .page-subtitle {
            color: #4318ff;
            font-size: 14px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 5px;
        }

        .page-title {
            color: #2b3674;
            font-size: 32px;
            font-weight: 800;
            margin: 0 0 15px 0;
        }

        /* Top Navigation Links */
        .nav-links {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 10px;
        }

        .nav-links a {
            color: #4318ff;
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
            background-color: #ffffff;
            padding: 8px 18px;
            border-radius: 20px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }

        .nav-links a:hover {
            background-color: #4318ff;
            color: #ffffff;
        }

        /* Main Form Card */
        .form-card {
            background: #ffffff;
            max-width: 480px;
            margin: 0 auto;
            padding: 35px 40px;
            border-radius: 20px;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.05);
        }

        /* Form Controls */
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-label {
            display: block;
            font-weight: 700;
            color: #2b3674;
            font-size: 14px;
            margin-bottom: 8px;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1.5px solid #e2e8f0;
            border-radius: 10px;
            font-size: 14px;
            color: #2b3674;
            background-color: #f8fafc;
            outline: none;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: #4318ff;
            background-color: #ffffff;
            box-shadow: 0 0 0 3px rgba(67, 24, 255, 0.15);
        }

        /* Primary Button Style (Matching Dashboard Buttons) */
        .btn-primary {
            background-color: #3b82f6; /* Dashboard button blue color */
            color: #ffffff;
            border: none;
            padding: 12px 20px;
            font-size: 15px;
            font-weight: 700;
            border-radius: 10px;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #2563eb;
            transform: translateY(-2px);
        }

        .status-label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            color: #10b981;
            text-align: center;
        }
    </style>
</head>
<body>
 
    <form id="form1" runat="server">
        
        <!-- Header Section -->
        <div class="page-header">
            <div class="page-subtitle">Library Administration</div>
            <h1 class="page-title">Add New Category</h1>
            
            <div class="nav-links">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Show_category.aspx">Show Category</asp:HyperLink>
                <asp:HyperLink ID="lnkAddBook" runat="server" NavigateUrl="~/Add_Books.aspx">Go to Add Books</asp:HyperLink>
            </div>
        </div>

        <!-- Form Box -->
        <div class="form-card">
            
            <div class="form-group">
                <label class="form-label">Category Name:</label>
                <asp:TextBox ID="txtcatnm" runat="server" CssClass="form-control" placeholder="Enter category name"></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">Category Cover Image:</label>
                <asp:FileUpload ID="fimg" runat="server" CssClass="form-control" />
            </div>

            <asp:Button ID="Button1" runat="server" Text="Add Category" OnClick="Button1_Click" CssClass="btn-primary" />
            
            <asp:Label ID="Label1" runat="server" Text="" CssClass="status-label"></asp:Label>

        </div>

    </form>
</body>
</html>
