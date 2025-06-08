<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="學生新增.aspx.cs" Inherits="WebApplication3.學生" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>學生資料新增</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="姓名"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
        <p>
            身分證字號<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="Label2" runat="server" Text="性別"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="gender" DataValueField="gender" AppendDataBoundItems="true">
            <asp:ListItem Text="請選擇" Value="" />
        </asp:DropDownList>
        <p>
            <asp:Label ID="Label3" runat="server" Text="註冊日期"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" TextMode="Date"></asp:TextBox>
        </p>
        <asp:Label ID="Label4" runat="server" Text="年級"></asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="grade" DataValueField="grade" AppendDataBoundItems="true">
            <asp:ListItem Text="請選擇" Value="" />
        </asp:DropDownList>
        <p>
            <asp:Label ID="Label5" runat="server" Text="地址"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" Text="新增資料" OnClick="Button1_Click" />
        </p>
        <asp:Label ID="LabelMessage" runat="server" ForeColor="Red"></asp:Label>

        <!-- SqlDataSource 設定 -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>" 
            InsertCommand="INSERT INTO [Students] ([id], [name], [national_id], [gender], [enrollment_date], [grade], [address]) 
                           VALUES (@id, @name, @national_id, @gender, @enrollment_date, @grade, @address)">
            <InsertParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="national_id" Type="String" />
                <asp:Parameter Name="gender" Type="String" />
                <asp:Parameter DbType="Date" Name="enrollment_date" />
                <asp:Parameter Name="grade" Type="Int32" />
                <asp:Parameter Name="address" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>" 
            SelectCommand="SELECT gender FROM Students GROUP BY gender" />

        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>" 
            SelectCommand="SELECT grade FROM Students GROUP BY grade" />
    </form>
</body>
</html>
