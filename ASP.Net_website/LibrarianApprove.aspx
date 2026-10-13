<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LibrarianApprove.aspx.cs" Inherits="ASP.Net_website.LibrarianApprove"  EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Librarian Approval Panel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            padding: 20px;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px #ccc;
        }

        h2 {
            color: #333;
            border-bottom: 2px solid #007bff;
            padding-bottom: 5px;
        }

        .my-grid {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

            .my-grid th {
                background-color: #007bff;
                color: white;
                padding: 10px;
                text-align: left;
            }

            .my-grid td {
                padding: 8px;
                border-bottom: 1px solid #ddd;
            }

        .btn-approve {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 4px;
        }

        .lbl-msg {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div class="container">
            <h2>Pending Book Requests (Approval)</h2>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="my-grid" OnRowCommand="GridView1_RowCommand">
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

            <br />
            <br />
           
        </div>
    </form>
</body>
</html>
