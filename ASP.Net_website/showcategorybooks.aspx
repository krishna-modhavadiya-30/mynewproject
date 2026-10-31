<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="showcategorybooks.aspx.cs" Inherits="ASP.Net_website.showcategorybooks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Category Wise Books</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #eaf2ff;
            margin: 0;
            padding: 30px 20px;
            color: #2b3674;
        }

        .page-header {
            text-align: center;
            margin-bottom: 25px;
        }

        .page-subtitle {
            color: #4318ff;
            font-size: 13px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 4px;
        }

        .page-title {
            color: #2b3674;
            font-size: 28px;
            font-weight: 800;
            margin: 0;
        }

        .datalist-wrapper {
            display: flex;
            justify-content: center;
            max-width: 1200px;
            margin: 0 auto;
        }

            .datalist-wrapper table {
                border-collapse: separate;
                border-spacing: 32px 20px;
                border: none !important;
            }

            .datalist-wrapper td {
                border: none !important;
                padding: 0 !important;
                vertical-align: top;
            }

        .book-card {
            background: #ffffff;
            border-radius: 16px;
            padding: 14px;
            width: 195px; 
            text-align: left;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.05);
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            display: flex;
            flex-direction: column;
        }

            .book-card:hover {
                transform: translateY(-6px);
                box-shadow: 0px 12px 28px rgba(67, 24, 255, 0.15);
            }

        .img-container {
            width: 100%;
            height: 160px; 
            border-radius: 12px;
            overflow: hidden;
            margin-bottom: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.06);
            background-color: #f8fafc;
        }

            .img-container img {
                width: 100% !important;
                height: 100% !important;
                object-fit: cover !important;
                object-position: center;
                display: block;
                transition: transform 0.4s ease;
            }

        .book-card:hover .img-container img {
            transform: scale(1.05);
        }

        .book-title {
            font-size: 14px;
            font-weight: 700;
            color: #2b3674;
            margin-bottom: 3px;
            display: block;
            line-height: 1.2;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .book-info {
            font-size: 12px;
            color: #707ebe;
            margin-bottom: 3px;
        }

        .book-price {
            font-size: 14px;
            font-weight: 800;
            color: #2b3674;
            margin-bottom: 10px;
        }

        .card-actions {
            margin-top: auto;
            display: flex;
            flex-direction: column;
            gap: 6px;
            border-top: 1px solid #f1f5f9;
            padding-top: 10px;
        }

        .btn-view {
            display: block;
            text-align: center;
            padding: 6px 0;
            color: #4318ff;
            background-color: #f4f7fe;
            font-weight: 700;
            font-size: 12px;
            text-decoration: none;
            border-radius: 6px;
            transition: all 0.2s ease;
        }

            .btn-view:hover {
                background-color: #4318ff;
                color: #ffffff;
            }

        .btn-issue {
            display: block;
            text-align: center;
            padding: 6px 0;
            color: #ffffff;
            background-color: #3b82f6;
            font-weight: 700;
            font-size: 12px;
            text-decoration: none;
            border-radius: 6px;
            box-shadow: 0 3px 8px rgba(59, 130, 246, 0.2);
            transition: all 0.2s ease;
        }

            .btn-issue:hover {
                background-color: #2563eb;
            }

        .stock-box {
            display: flex;
            gap: 4px;
            margin-top: 4px;
        }

        .txt-qty {
            width: 55px;
            padding: 4px;
            font-size: 11px;
            border: 1px solid #cbd5e1;
            border-radius: 4px;
            text-align: center;
        }

        .btn-add-stock {
            background-color: #10b981;
            color: white;
            border: none;
            padding: 4px 8px;
            font-size: 11px;
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;
            flex: 1;
        }

        .btn-add-stock:hover {
            background-color: #059669;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">

        <div class="page-header">
            <div class="page-subtitle">Library Administration</div>
            <h1 class="page-title">Category Wise Books</h1>
        </div>

        <div class="datalist-wrapper">
            <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" CellSpacing="20" OnItemCommand="DataList1_ItemCommand">
                <ItemTemplate>
                    <div class="book-card">
                        <div class="img-container">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Book_Img") %>' />
                        </div>

                        <asp:Label ID="lblBnm" runat="server" CssClass="book-title" Text='<%# Eval("Book_Name") %>'></asp:Label>

                        <div class="book-info">
                            Author:
                            <asp:Label ID="lblAuth" runat="server" Text='<%# Eval("Book_Author") %>' Font-Bold="True"></asp:Label>
                        </div>

                        <div class="book-info">
                            Stock:
                            <asp:Label ID="lblCopies" runat="server" Text='<%# Eval("Book_Copies") %>' Font-Bold="True" ForeColor="#10B981"></asp:Label>
                        </div>

                        <div class="book-price">
                            Price: ₹<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Book_Price") %>'></asp:Label>
                        </div>

                        <div class="card-actions">
                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn-view" PostBackUrl='<%# "viewdetails.aspx?bid=" + Eval("Book_Id") %>'>View Detail</asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn-issue" PostBackUrl='<%# "issuebook.aspx?bid=" + Eval("Book_Id") %>'>Issue Book</asp:LinkButton>
                            
                         
                            <asp:Panel ID="pnlAdminStock" runat="server" CssClass="stock-box" Visible="false">
                                <asp:TextBox ID="txtAddStock" runat="server" CssClass="txt-qty" TextMode="Number" Placeholder="Qty"></asp:TextBox>
                                <asp:Button ID="btnAddStock" runat="server" CssClass="btn-add-stock" Text="+ Stock" CommandName="addstock" CommandArgument='<%# Eval("Book_Id") %>' />
                            </asp:Panel>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>

    </form>
</body>
</html>