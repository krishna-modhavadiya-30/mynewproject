<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Contact.aspx.cs" Inherits="ASP.Net_website.Admin_Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 40px;
            color: #334155;
        }

        .main-container {
            max-width: 1100px;
            margin: 0 auto;
        }

        /* Top Header Card */
        .header-card {
            background: #ffffff;
            border-radius: 12px;
            padding: 24px 30px;
            margin-bottom: 24px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header-title {
            font-size: 22px;
            font-weight: 700;
            color: #0f172a;
            margin: 0 0 4px 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .header-subtitle {
            font-size: 14px;
            color: #64748b;
            margin: 0;
        }

        /* Table Card Box */
        .table-card {
            background: #ffffff;
            border-radius: 12px;
            padding: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
            border: 1px solid #e2e8f0;
            overflow: hidden;
        }

        /* Modern GridView Styling */
        .custom-grid {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background-color: #ffffff;
        }

        .custom-grid th {
            background-color: #ffffff;
            color: #64748b;
            font-size: 11px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            padding: 16px 20px;
            text-align: left;
            border-bottom: 1px solid #e2e8f0;
        }

        .custom-grid td {
            padding: 16px 20px;
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

        /* Specific Text Styles */
        .id-badge {
            font-weight: 600;
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
            color: #ef4444;
            text-decoration: none;
            font-weight: 500;
            font-size: 14px;
            transition: color 0.2s;
        }

        .btn-delete:hover {
            color: #dc2626;
            text-decoration: underline;
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
