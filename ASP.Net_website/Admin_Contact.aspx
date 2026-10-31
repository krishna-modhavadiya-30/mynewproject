<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Contact.aspx.cs" Inherits="ASP.Net_website.Admin_Contact" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <style type="text/css">
    body {
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
        background-color: #f4f6f9;
        margin: 0;
        padding: 40px 20px;
        color: #334155;
    }

    .main-container {
        max-width: 1100px;
        margin: 0 auto;
    }

    /* Top Header Container for Right-Aligned Button */
    .header-card {
        background: #ffffff;
        border-radius: 16px;
        padding: 20px 24px;
        margin-bottom: 20px;
        box-shadow: 0 10px 30px rgba(37, 99, 235, 0.08);
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    /* View Report Button - Styled & Pushed Right */
    #Button1, .btn-report {
        background-color: #2563eb;
        color: #ffffff !important;
        border: none;
        padding: 9px 22px;
        font-size: 14px;
        font-weight: 700;
        border-radius: 8px;
        cursor: pointer;
        box-shadow: 0 4px 12px rgba(37, 99, 235, 0.25);
        transition: all 0.2s ease;
        float: right;
        margin-bottom: 15px;
    }

    #Button1:hover, .btn-report:hover {
        background-color: #1d4ed8;
        transform: translateY(-1px);
    }

    /* Table Container Box */
    .table-card {
        background: #ffffff;
        border-radius: 16px;
        box-shadow: 0 10px 30px rgba(37, 99, 235, 0.08);
        border: 1px solid #e2e8f0;
        overflow: hidden;
        clear: both;
    }

    /* GridView Styling */
    .custom-grid {
        width: 100%;
        border-collapse: collapse;
        background-color: #ffffff;
        margin: 0;
    }

    .custom-grid th {
        background-color: #2563eb !important;
        color: #ffffff !important;
        font-size: 12px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 0.05em;
        padding: 14px 20px;
        text-align: left;
        border: none;
    }

    .custom-grid td {
        padding: 14px 20px;
        font-size: 14px;
        color: #334155;
        border-bottom: 1px solid #f1f5f9;
        vertical-align: middle;
    }

    .custom-grid tr:last-child td {
        border-bottom: none;
    }

    .custom-grid tr:hover td {
        background-color: #f8fafc;
    }

    /* Text Styles */
    .id-text {
        font-weight: 700;
        color: #64748b;
    }

    .name-text {
        font-weight: 700;
        color: #0f172a;
    }

    .email-text {
        color: #64748b;
    }

    .msg-text {
        color: #475569;
    }

    /* Delete Button Style */
    .btn-delete {
        background-color: #ef4444;
        color: white !important;
        border: none;
        padding: 6px 14px;
        border-radius: 6px;
        cursor: pointer;
        font-weight: 700;
        font-size: 13px;
        text-decoration: none !important;
        display: inline-block;
        box-shadow: 0 2px 6px rgba(239, 68, 68, 0.2);
        transition: all 0.2s ease;
    }

    .btn-delete:hover {
        background-color: #dc2626;
        color: white !important;
    }
</style>
</head>
    
<body>
    <form id="form1" runat="server">
       <div class="card shadow-sm border-0 rounded-4 overflow-hidden mb-4">
    <div class="card-body p-0">
        <div class="table-responsive">

<%--            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                OnRowCommand="GridView1_RowCommand"
                CssClass="table table-hover custom-grid align-middle mb-0"
                GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <span class="fw-bold text-secondary">#<%# Eval("id") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <span class="fw-semibold text-dark"><%# Eval("name") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <span class="text-muted"><%# Eval("email") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Message">
                        <ItemTemplate>
                            <span class="text-dark"><%# Eval("message") %></span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server"
                                CommandArgument='<%# Eval("id") %>'
                                CommandName="cmd_dlt"
                                CssClass="btn-delete">
                                <i class="fa-solid fa-trash me-1"></i> Delete
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>--%>

            <asp:Button ID="Button1" runat="server" Text="View Report" OnClick="Button1_Click" />
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
    OnRowCommand="GridView1_RowCommand"
    CssClass="custom-grid" GridLines="None">
    <Columns>
        <asp:TemplateField HeaderText="ID">
            <ItemTemplate>
                <span class="id-text">#<%# Eval("id") %></span>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Name">
            <ItemTemplate>
                <span class="name-text"><%# Eval("name") %></span>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Email">
            <ItemTemplate>
                <span class="email-text"><%# Eval("email") %></span>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Message">
            <ItemTemplate>
                <span class="msg-text"><%# Eval("message") %></span>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Action">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server"
                    CommandArgument='<%# Eval("id") %>'
                    CommandName="cmd_dlt"
                    CssClass="btn-delete">
                    <i class="fa-solid fa-trash me-1"></i> Delete
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

        </div>
    </div>
</div>
    </form>
</body>
</html>
