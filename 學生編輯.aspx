<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="學生編輯.aspx.cs" Inherits="WebApplication3.學生新增" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>學生新增</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>" 
                SelectCommand="SELECT * FROM [Students]" 
                DeleteCommand="DELETE FROM [Students] WHERE [id] = @id" 
                InsertCommand="INSERT INTO [Students] ([id], [name], [national_id], [gender], [enrollment_date], [grade], [address]) VALUES (@id, @name, @national_id, @gender, @enrollment_date, @grade, @address)" 
                UpdateCommand="UPDATE [Students] SET [name] = @name, [national_id] = @national_id, [gender] = @gender, [enrollment_date] = @enrollment_date, [grade] = @grade, [address] = @address WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="national_id" Type="String" />
                    <asp:Parameter Name="gender" Type="String" />
                    <asp:Parameter DbType="Date" Name="enrollment_date" />
                    <asp:Parameter Name="grade" Type="Int32" />
                    <asp:Parameter Name="address" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="national_id" Type="String" />
                    <asp:Parameter Name="gender" Type="String" />
                    <asp:Parameter DbType="Date" Name="enrollment_date" />
                    <asp:Parameter Name="grade" Type="Int32" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1" DataKeyNames="id" AllowPaging="True" 
                BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowInsertButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" ReadOnly="True" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="national_id" HeaderText="national_id" SortExpression="national_id" />
                    <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
                    <asp:BoundField DataField="enrollment_date" HeaderText="enrollment_date" SortExpression="enrollment_date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="grade" HeaderText="grade" SortExpression="grade" />
                    <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
