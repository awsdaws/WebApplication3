<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="新增員工資料.aspx.cs" Inherits="WebApplication3.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>新增員工資料</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Label 文字顏色改深藍 */
        .form-label {
            color: #0d3b66; /* 深藍 */
            font-weight: 600;
        }
        /* 輸入框背景及文字顏色 */
        .form-control, .form-select {
            background-color: #f8f9fa; /* 淺灰背景 */
            color: #343a40; /* 深灰字 */
            border-color: #ced4da;
        }
        /* 輸入框 focus 時加強邊框顏色 */
        .form-control:focus, .form-select:focus {
            background-color: #fff;
            color: #212529;
            border-color: #0d3b66;
            box-shadow: 0 0 0 0.2rem rgba(13, 59, 102, 0.25);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container my-4">
        <div class="card shadow-sm p-4">
            <h3 class="mb-4" style="color:#0d3b66;">新增員工資料</h3>

            <!-- 資料來源 -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>" 
                DeleteCommand="DELETE FROM [employee] WHERE [employeeID] = @employeeID" 
                InsertCommand="INSERT INTO [employee] ([employeeID], [name], [ID], [gender], [title], [address], [onbord], [resign]) VALUES (@employeeID, @name, @ID, @gender, @title, @address, @onbord, @resign)" 
                SelectCommand="SELECT * FROM [employee]" 
                UpdateCommand="UPDATE [employee] SET [name] = @name, [ID] = @ID, [gender] = @gender, [title] = @title, [address] = @address, [onbord] = @onbord, [resign] = @resign WHERE [employeeID] = @employeeID">
                <InsertParameters>
                    <asp:Parameter Name="employeeID" Type="Int32" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="gender" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="onbord" Type="String" />
                    <asp:Parameter Name="resign" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>" 
                SelectCommand="Select gender From [employee] Group by gender" />
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>" 
                SelectCommand="Select title From [employee] Group by title" />

            <!-- 名字 -->
            <div class="mb-3">
                <asp:Label ID="Label1" runat="server" Text="名字" AssociatedControlID="TextBox1" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" Text="test" CssClass="form-control"></asp:TextBox>
            </div>

            <!-- 身分證字號 -->
            <div class="mb-3">
                <asp:Label ID="Label2" runat="server" Text="身分證字號" AssociatedControlID="TextBox2" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" Text="A123456789" CssClass="form-control"></asp:TextBox>
            </div>

            <!-- 性別 -->
            <div class="mb-3">
                <asp:Label ID="Label3" runat="server" Text="性別" AssociatedControlID="DropDownList1" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" 
                    DataTextField="gender" DataValueField="gender" AppendDataBoundItems="false" CssClass="form-select">
                </asp:DropDownList>
            </div>

            <!-- 職位 -->
            <div class="mb-3">
                <asp:Label ID="Label4" runat="server" Text="職位" AssociatedControlID="DropDownList2" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" 
                    DataTextField="title" DataValueField="title" AppendDataBoundItems="false" CssClass="form-select">
                </asp:DropDownList>
            </div>

            <!-- 地址 -->
            <div class="mb-3">
                <asp:Label ID="Label5" runat="server" Text="地址" AssociatedControlID="TextBox5" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="TextBox5" runat="server" Text="台北市中正區" CssClass="form-control"></asp:TextBox>
            </div>

            <!-- 入職時間 -->
            <div class="mb-3">
                <asp:Label ID="Label6" runat="server" Text="入職時間" AssociatedControlID="TextBox6" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="TextBox6" runat="server" Text="2024" CssClass="form-control"></asp:TextBox>
            </div>

            <!-- 新增按鈕 -->
            <div class="mb-3">
                <asp:Button ID="Button1" runat="server" Text="新增" OnClick="Button1_Click" CssClass="btn btn-primary" />
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
