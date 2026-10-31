<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="ASP.Net_website.UserProfile" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

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
            background-color: #e0f2fe;
            color: #0284c7;
            border: 1px solid #bae6fd;
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 13px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-home:hover {
            background-color: #bae6fd;
            color: #0369a1;
        }

        .btn-logout {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 50px;
            font-size: 13px;
            cursor: pointer;
            font-weight: 600;
        }

        /* Nav Modern Download Report Button Fixed Right */
        .btn-my-report {
            background-color: #2563eb;
            color: #ffffff;
            border: none;
            padding: 9px 20px;
            border-radius: 8px;
            font-size: 13.5px;
            cursor: pointer;
            font-weight: 700;
            box-shadow: 0 4px 10px rgba(37, 99, 235, 0.2);
            transition: all 0.2s ease;
            white-space: nowrap;
        }

        .btn-my-report:hover {
            background-color: #1d4ed8;
            transform: translateY(-1px);
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

        /* Section Header - Pushes button directly to the Right edge */
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            width: 100%;
        }

        .section-title {
            color: #2c3e50;
            font-size: 18px;
            border-left: 4px solid #28a745;
            padding-left: 10px;
            margin: 0;
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

<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
   <div class="profile-container">

        <div class="profile-card">
            <div class="top-actions">
                <asp:Button ID="btnBackHome" runat="server" Text="← Back to Home" OnClick="btnBackHome_Click" CssClass="btn-home" CausesValidation="false" />
                <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn-logout" CausesValidation="false" />
            </div>

            <div class="profile-header">
                <div class="avatar-circle">
                    <asp:Label ID="lblAvatar" runat="server">S</asp:Label>
                </div>
                <div class="user-title">
                    <h2><asp:Label ID="lblUsername" runat="server" Text="Student Name"></asp:Label></h2>
                    <span class="badge-status">Active Account</span>
                </div>
            </div>

            <div class="details-grid">
                <div class="info-item">
                    <label>User ID / Student Roll No</label>
                    <span><asp:Label ID="lblUserID" runat="server" Text="N/A"></asp:Label></span>
                </div>
                <div class="info-item">
                    <label>Email Address</label>
                    <span><asp:Label ID="lblEmail" runat="server" Text="N/A"></asp:Label></span>
                </div>
            </div>
        </div>

        <div class="profile-card">
            <!-- Header with Title on Left and Download Report Button perfectly aligned on Right -->
            <div class="section-header">
                <h3 class="section-title">Issued & Returned Books History</h3>
                <asp:Button ID="btnUserReport" runat="server" Text="Download My Report (PDF)" OnClick="btnUserReport_Click" CssClass="btn-my-report" CausesValidation="false" />
            </div>

            <!-- Hidden Viewer Container -->
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" DisplayToolbar="false" />

            <asp:GridView ID="gridStudentBooks" runat="server" AutoGenerateColumns="False"
                CssClass="custom-grid" EmptyDataText="No book history available at the moment.">
                <Columns>
                    <asp:BoundField DataField="BookName" HeaderText="Book Name" />
                    <asp:BoundField DataField="IssueDate" HeaderText="Issue Date" />
                    <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <span class='<%# Eval("Status").ToString() == "Pending" || Eval("Status").ToString() == "Approved" || Eval("Status").ToString() == "Issued" ? "badge-issued" : "badge-returned" %>'>
                                <%# Eval("Status") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

    </div>
</asp:Content>