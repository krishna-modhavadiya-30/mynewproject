<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewdetails.aspx.cs" Inherits="ASP.Net_website.viewdetails" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
          <center>
                <h1>View Book Details</h1>
              <%--  <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
                <br /><br />

                <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                    <ItemTemplate>
                        <table border="0" cellpadding="8" style="text-align: left; background-color: #f9f9f9; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
                            <tr>
                                <td rowspan="5" style="padding-right: 25px;">
                                    <asp:Image ID="Image1" Height="250" Width="180" runat="server" ImageUrl='<%# Eval("Book_Img") %>' />
                                </td>
                                <td><b>Book Name:</b></td>
                                <td><asp:Label ID="Label3" runat="server" Text='<%# Eval("Book_Name") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td><b>Author Name:</b></td>
                                <td><asp:Label ID="Label4" runat="server" Text='<%# Eval("Book_Author") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td><b>Price:</b></td>
                                <td>₹<asp:Label ID="Label2" runat="server" Text='<%# Eval("Book_Price") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td><b>Description:</b></td>
                                <td><asp:Label ID="Label5" runat="server" Text='<%# Eval("Book_Desc") %>'></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br />
                                 <asp:LinkButton ID="LinkButton1" runat="server" CommandName="cmd_issue" CommandArgument='<%# Eval("Book_Id") %>' Font-Bold="True" ForeColor="White" BackColor="#3b82f6" Style="padding: 8px 16px; text-decoration: none; border-radius: 5px;">Issue Book</asp:LinkButton>

                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
                <br /><br />
            </center>
        </div>
    </form>
</body>
</html>
