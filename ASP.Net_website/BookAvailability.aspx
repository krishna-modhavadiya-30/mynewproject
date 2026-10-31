<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookAvailability.aspx.cs" Inherits="ASP.Net_website.BookAvailability" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title> Book Stock Availability </title>
  <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eef4ff;
            margin: 0;
            padding: 40px 20px;
            color: #1e293b;
        }

        .container {
            max-width: 1100px;
            margin: 0 auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0px 10px 30px rgba(37, 99, 235, 0.08);
        }

        /* Header Layout: Title on Left, Button Fixed on Right */
        .title-wrapper {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 2px solid #f1f5f9;
        }

        .title-content {
            text-align: left;
        }

        .header-actions {
            margin-left: auto;
            display: flex;
            align-items: center;
        }

        h2 {
            color: #1e3a8a;
            font-size: 26px;
            font-weight: 800;
            margin: 0;
        }

        .subtitle {
            color: #2563eb;
            font-size: 13px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 4px;
        }

        /* View Report Button Styling */
        .btn-report {
            background-color: #2563eb;
            color: #ffffff;
            border: none;
            padding: 10px 22px;
            font-size: 14px;
            font-weight: 700;
            border-radius: 8px;
            cursor: pointer;
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.25);
            transition: all 0.2s ease;
            white-space: nowrap;
        }

        .btn-report:hover {
            background-color: #1d4ed8;
            transform: translateY(-1px);
        }

        /* GridView Container Wrapper */
        .grid-wrapper {
            width: 100%;
            overflow-x: auto;
            border-radius: 12px;
            border: 1px solid #e2e8f0;
            margin-top: 15px;
        }

        /* GridView Table Styling */
        .gridview-style {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
        }

        .gridview-style th {
            background-color: #2563eb;
            color: #ffffff;
            font-weight: 700;
            padding: 14px 18px;
            text-align: left;
            font-size: 14px;
            border: none;
            white-space: nowrap;
        }

        .gridview-style td {
            padding: 12px 18px;
            text-align: left;
            border-bottom: 1px solid #f1f5f9;
            color: #334155;
            font-size: 14px;
            white-space: nowrap;
        }

        .gridview-style tr:hover {
            background-color: #f8fafc;
        }

        /* Footer total row styling */
        .gridview-style tr.footer-style td {
            background-color: #dbeafe;
            font-weight: bold;
            font-size: 15px;
            color: #1e3a8a;
            border-top: 2px solid #2563eb;
        }
    </style>
</head>
<body>
  <form id="form1" runat="server">
        <div class="container">
            
            <!-- Header Layout with Button Correctly Placed on Right -->
            <div class="title-wrapper">
                <div class="title-content">
                    <div class="subtitle">Real-time Inventory Tracking</div>
                    <h2>Library Book Availability & Stock Status</h2>
                </div>
                <div class="header-actions">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="View Report" CssClass="btn-report" />
                </div>
            </div>

            <!-- Crystal Report Viewer Outside Header Flexbox -->
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
            
            <!-- GridView Table -->
            <div class="grid-wrapper">
                <asp:GridView ID="GridViewStock" runat="server" AutoGenerateColumns="False" 
                    CssClass="gridview-style" ShowFooter="True" OnRowDataBound="GridViewStock_RowDataBound" OnSelectedIndexChanged="GridViewStock_SelectedIndexChanged">
                    <FooterStyle CssClass="footer-style" />
                    <Columns>
                        <asp:BoundField DataField="Book_Id" HeaderText="Book ID" />
                        <asp:BoundField DataField="Book_Name" HeaderText="Book Name" />
                        <asp:BoundField DataField="Book_Author" HeaderText="Author Name" />
                        <asp:BoundField DataField="Book_Copies" HeaderText="Available Stock (Copies)" />
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </form>
</body>
</html>