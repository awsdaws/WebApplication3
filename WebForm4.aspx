<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="WebApplication3.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>" SelectCommand="Select title
From [Academic].[dbo].[employee]
Group by title"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>" SelectCommand="Select gender
From [Academic].[dbo].[employee]
Group by gender"></asp:SqlDataSource>
            <asp:Label ID="Label1" runat="server" Font-Size="30px" Text="修改職員資料"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="employeeID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:TemplateField HeaderText="employeeID" SortExpression="employeeID">
                        <EditItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("employeeID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("employeeID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                    <asp:TemplateField HeaderText="gender" SortExpression="gender">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="gender" DataValueField="gender" SelectedValue='<%# Bind("gender") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="title" SortExpression="title">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource2" DataTextField="title" DataValueField="title" SelectedValue='<%# Bind("title") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                    <asp:CommandField ShowEditButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
