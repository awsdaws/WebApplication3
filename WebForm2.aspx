<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication3.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>新增員工資料</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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

            <asp:Label ID="Label1" runat="server" Text="名字"></asp:Label><br />
            <asp:TextBox ID="TextBox1" runat="server" Text="test"></asp:TextBox><br />

            <asp:Label ID="Label2" runat="server" Text="身分證字號"></asp:Label><br />
            <asp:TextBox ID="TextBox2" runat="server" Text="A123456789"></asp:TextBox><br />

            <asp:Label ID="Label3" runat="server" Text="性別"></asp:Label><br />
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" 
    DataTextField="gender" DataValueField="gender" AppendDataBoundItems="false">
</asp:DropDownList><br />

     <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" 
    DataTextField="title" DataValueField="title" AppendDataBoundItems="false">
</asp:DropDownList><br />

            <asp:Label ID="Label5" runat="server" Text="地址"></asp:Label><br />
            <asp:TextBox ID="TextBox5" runat="server" Text="台北市中正區"></asp:TextBox><br />

            <asp:Label ID="Label6" runat="server" Text="入值時間"></asp:Label><br />
            <asp:TextBox ID="TextBox6" runat="server" Text="2024"></asp:TextBox><br />

            <asp:Button ID="Button1" runat="server" Text="新增" OnClick="Button1_Click" /><br /><br />
        </div>
    </form>
</body>
</html>
