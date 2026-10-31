<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LibrarianApprove.aspx.cs" Inherits="ASP.Net_website.LibrarianApprove" EnableEventValidation="false" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Librarian Approval Panel</title>
   <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #eef4ff; /* Light Ice Blue Background */
            margin: 0;
            padding: 40px 20px;
            color: #1e293b;
        }

        .container {
            width: 90%;
            max-width: 1150px;
            margin: 0 auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0px 10px 30px rgba(37, 99, 235, 0.08);
        }

        /* Header Section - Proper Flex Alignment */
        .header-box {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 10px;
            border-bottom: 2px solid #f1f5f9;
        }

        .page-title {
            color: #1e3a8a;
            font-size: 26px;
            font-weight: 800;
            margin: 0;
        }

        /* Report Button Styling - Pushed properly to Right Side */
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
            margin-left: auto;
        }

        .btn-report:hover {
            background-color: #1d4ed8;
            transform: translateY(-1px);
        }

        /* Responsive Wrapper to show ALL GridView Records cleanly */
        .grid-wrapper {
            width: 100%;
            overflow-x: auto;
            margin-bottom: 20px;
            border-radius: 12px;
            border: 1px solid #e2e8f0;
        }

        .my-grid {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
        }

        
        .my-grid th {
            background-color: #3b82f6; 
            color: #ffffff;
            padding: 14px 16px;
            font-size: 14px;
            font-weight: 700;
            text-align: left;
            border: none;
            white-space: nowrap;
        }

        .my-grid td {
            padding: 12px 16px;
            border-bottom: 1px solid #f1f5f9;
            color: #334155;
            font-size: 14px;
            white-space: nowrap;
        }

        .my-grid tr:hover {
            background-color: #f8fafc;
        }

        /* Approve Button Styling - Modern Emerald Green */
        .btn-approve {
            background-color: #10b981;
            color: white;
            border: none;
            padding: 6px 14px;
            font-size: 13px;
            font-weight: 700;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.2s ease;
            box-shadow: 0 2px 6px rgba(16, 185, 129, 0.2);
        }

        .btn-approve:hover {
            background-color: #059669;
        }

        /* Message Label Styling */
        .lbl-msg {
            color: #10b981;
            font-weight: bold;
            font-size: 14px;
            display: block;
            margin-top: 10px;
        }

        /* Dedicated Crystal Report Viewer Section */
        .report-container {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 2px dashed #cbd5e1;
            width: 100%;
            overflow-x: auto;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="container">
            
            <div class="header-box">
                <h2 class="page-title">Pending Book Requests (Approval)</h2>
                <asp:Button ID="Button1" runat="server" Text="View Report" OnClick="Button1_Click" CssClass="btn-report" />
                <br />
                <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
            </div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="my-grid" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                <Columns>
                    <asp:BoundField DataField="IssueId" HeaderText="ID" />
                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
                    <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                    <asp:BoundField DataField="IssueDate" HeaderText="Issue Date" />
                    <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button ID="btnApprove" runat="server" Text="Approve" CommandName="cmd_approve" CommandArgument='<%# Eval("IssueId") %>' CssClass="btn-approve" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:Label ID="lblMsg" runat="server" CssClass="lbl-msg"></asp:Label>

        </div>
    </form>
</body>
</html>