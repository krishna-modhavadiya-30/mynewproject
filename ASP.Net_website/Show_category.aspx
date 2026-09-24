<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Show_category.aspx.cs" Inherits="ASP.Net_website.Show_category" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All Categories</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #eaf2ff;
            margin: 0;
            padding: 40px 20px;
            color: #2b3674;
        }

        /* Top Header Container */
        .page-header {
            text-align: center;
            margin-bottom: 35px;
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
            margin: 0;
        }

        /* Container for DataList */
        .datalist-wrapper {
            display: flex;
            justify-content: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        /* Clean DataList Grid Spacing */
        .datalist-wrapper table {
            border-collapse: separate;
            border-spacing: 24px;
            border: none !important;
        }

        .datalist-wrapper td {
            border: none !important;
            padding: 0 !important;
            vertical-align: top;
        }

        /* Category Card Item Design */
        .category-card {
            background: #ffffff;
            border-radius: 20px;
            padding: 16px;
            width: 210px;
            text-align: center;
            box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.05);
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .category-card:hover {
            transform: translateY(-8px);
            box-shadow: 0px 15px 35px rgba(67, 24, 255, 0.15);
        }

        /* Image Wrapper with Cover Aspect Ratio */
        .img-container {
            width: 100%;
            aspect-ratio: 3 / 4; /* Perfect Portrait Cover Ratio */
            border-radius: 14px;
            overflow: hidden;
            margin-bottom: 15px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.08);
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

        .category-card:hover .img-container img {
            transform: scale(1.06); /* Smooth Zoom Effect */
        }

        /* Category Button Link Style */
        .cat-btn {
            display: block;
            width: 100%;
            padding: 10px 0;
            color: #4318ff;
            background-color: #f4f7fe;
            font-weight: 700;
            font-size: 15px;
            text-decoration: none;
            text-transform: capitalize;
            border-radius: 10px;
            transition: all 0.2s ease;
            box-sizing: border-box;
        }

        .category-card:hover .cat-btn {
            background-color: #4318ff;
            color: #ffffff;
        }
    </style>
</head>
<body>
   
    <form id="form1" runat="server">
        
        <!-- Header Section -->
        <div class="page-header">
            <div class="page-subtitle">Library Administration</div>
            <h1 class="page-title">All Categories</h1>
        </div>

        <!-- DataList Section -->
        <div class="datalist-wrapper">
            <asp:DataList ID="DataList1" runat="server" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" RepeatDirection="Horizontal" CellSpacing="40">
                <ItemTemplate>
                    <div class="category-card">
                        <div class="img-container">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Cat_Cover_Img") %>' />
                        </div>
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="cat-btn" PostBackUrl='<%# "showcategorybooks.aspx?catid=" + Eval("Cat_Id") %>' Text='<%# Eval("Cat_Name") %>'></asp:LinkButton>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>

    </form>
</body>
</html>
