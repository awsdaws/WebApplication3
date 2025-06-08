<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="修改職員資料.aspx.cs" Inherits="WebApplication3.WebForm4" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>修改職員資料</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container my-4">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>" DeleteCommand="DELETE FROM [employee] WHERE [employeeID] = @employeeID" InsertCommand="INSERT INTO [employee] ([employeeID], [name], [ID], [gender], [title], [address]) VALUES (@employeeID, @name, @ID, @gender, @title, @address)" SelectCommand="SELECT [employeeID], [name], [ID], [gender], [title], [address] FROM [employee]" UpdateCommand="UPDATE [employee] SET [name] = @name, [ID] = @ID, [gender] = @gender, [title] = @title, [address] = @address WHERE [employeeID] = @employeeID">
                <DeleteParameters>
                    <asp:Parameter Name="employeeID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="employeeID" Type="Int32" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="gender" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="address" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="gender" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="employeeID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>" SelectCommand="Select title From [Academic].[dbo].[employee] Group by title"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>" SelectCommand="Select gender From [Academic].[dbo].[employee] Group by gender"></asp:SqlDataSource>

            <h2 class="mb-4 text-center">修改職員資料</h2>

            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server"
                    AutoGenerateColumns="False"
                    DataKeyNames="employeeID"
                    DataSourceID="SqlDataSource1"
                    OnRowUpdated="GridView1_RowUpdated"
                    CssClass="table table-striped table-bordered align-middle">
    <Columns>
        <%-- 職員編號欄位，自訂顯示 --%>
        <asp:TemplateField HeaderText="職員編號" SortExpression="employeeID" ItemStyle-Width="80px">
            <EditItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%# Bind("employeeID") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("employeeID") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <%-- 職員姓名欄位 --%>
        <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />

        <%-- 身分證字號欄位 --%>
        <asp:BoundField DataField="ID" HeaderText="身分證字號" SortExpression="ID" />

        <%-- 性別欄位，編輯時使用下拉選單 --%>
        <asp:TemplateField HeaderText="性別" SortExpression="gender" ItemStyle-Width="100px">
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="gender" DataValueField="gender" SelectedValue='<%# Bind("gender") %>' CssClass="form-select form-select-sm">
                </asp:DropDownList>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <%-- 職位欄位，編輯時使用下拉選單 --%>
        <asp:TemplateField HeaderText="職位" SortExpression="title" ItemStyle-Width="150px">
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="title" DataValueField="title" SelectedValue='<%# Bind("title") %>' CssClass="form-select form-select-sm">
                </asp:DropDownList>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("title") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <%-- 地址欄位 --%>
        <asp:BoundField DataField="address" HeaderText="地址" SortExpression="address" />

        <%-- 自訂按鈕欄，包含 編輯/更新/取消，套用 Bootstrap 按鈕樣式 --%>
        <asp:TemplateField HeaderText="操作" ItemStyle-Width="160px">
            <ItemTemplate>
                <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="編輯" CssClass="btn btn-primary btn-sm" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="更新" CssClass="btn btn-success btn-sm me-2" />
                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="取消" CssClass="btn btn-danger btn-sm" />
            </EditItemTemplate>
        </asp:TemplateField>

    </Columns>

    <%-- 編輯列樣式 --%>
    <EditRowStyle BackColor="#e9f5ff" />

</asp:GridView>

            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
