<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title></title>
    <!-- Bootstrap v5.2.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container my-4">
            <!-- 資料來源控件 (隱藏區) -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>" 
                DeleteCommand="DELETE FROM [employee] WHERE [employeeID] = @employeeID" 
                InsertCommand="INSERT INTO [employee] ([employeeID], [name], [ID], [gender], [title], [address], [onbord], [resign]) VALUES (@employeeID, @name, @ID, @gender, @title, @address, @onbord, @resign)" 
                SelectCommand="SELECT [employeeID], [name], [ID], [gender], [title], [address], [onbord], [resign] FROM [employee]" 
                UpdateCommand="UPDATE [employee] SET [name] = @name, [ID] = @ID, [gender] = @gender, [title] = @title, [address] = @address, [onbord] = @onbord, [resign] = @resign WHERE [employeeID] = @employeeID">
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
                    <asp:Parameter Name="onbord" Type="String" />
                    <asp:Parameter Name="resign" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="gender" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="onbord" Type="String" />
                    <asp:Parameter Name="resign" Type="String" />
                    <asp:Parameter Name="employeeID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>" 
                SelectCommand="SELECT [positionID], [position] FROM [employee_title]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>" 
                SelectCommand="SELECT [gender] FROM [dbo].[employee] GROUP BY gender"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>" 
                SelectCommand="SELECT * FROM [VIEW2] WHERE ([teacher_id] = @teacher_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="teacher_id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>" 
                SelectCommand="SELECT * FROM [VIEW3] WHERE ([teacher_id] = @teacher_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView2" Name="teacher_id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <!-- 職員區塊 -->
            <div class="card mb-4">
                <div class="card-header bg-success text-white fs-4">
                    <asp:Label ID="Label5" runat="server" Text="職員"></asp:Label>
                </div>
                <div class="card-body table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
                        CssClass="table table-striped table-bordered" DataKeyNames="employeeID" 
                        DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="employeeID" HeaderText="職員編號" ReadOnly="True" SortExpression="employeeID" />
                            <asp:BoundField DataField="name" HeaderText="職員姓名" SortExpression="name" />
                            <asp:BoundField DataField="ID" HeaderText="身分證字號" SortExpression="ID" />
                            <asp:BoundField DataField="gender" HeaderText="性別" SortExpression="gender" />
                            <asp:BoundField DataField="title" HeaderText="職位" SortExpression="title" />
                            <asp:BoundField DataField="address" HeaderText="地址" SortExpression="address" />
                            <asp:BoundField DataField="onbord" HeaderText="入值日期" SortExpression="onbord" />
                            <asp:BoundField DataField="resign" HeaderText="離值日期" SortExpression="resign" />
                            <asp:CommandField ShowSelectButton="True" />
                        </Columns>
                        <EditRowStyle BackColor="#66FFFF" BorderColor="#003366" />
                    </asp:GridView>
                </div>
            </div>

            <!-- 授課查詢 -->
            <div class="card mb-4">
                <div class="card-header bg-primary text-white fs-4">
                    <asp:Label ID="Label4" runat="server" Text="授課查詢"></asp:Label>
                </div>
                <div class="card-body table-responsive">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        CssClass="table table-striped table-bordered" DataSourceID="SqlDataSource5" 
                        DataKeyNames="teacher_id,course_id">
                        <Columns>
                            <asp:BoundField DataField="teacher_id" HeaderText="教師編號" SortExpression="teacher_id" ReadOnly="True" />
                            <asp:BoundField DataField="teacher_name" HeaderText="教師姓名" SortExpression="teacher_name" />
                            <asp:BoundField DataField="course_id" HeaderText="課程編號" SortExpression="course_id" ReadOnly="True" />
                            <asp:BoundField DataField="course_name" HeaderText="課程名稱" SortExpression="course_name" />
                            <asp:BoundField DataField="credits" HeaderText="學分" SortExpression="credits" />
                            <asp:CommandField ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <!-- 授課學生查詢 -->
            <div class="card mb-4">
                <div class="card-header bg-secondary text-white fs-4">
                    <asp:Label ID="Label6" runat="server" Text="授課學生查詢"></asp:Label>
                </div>
                <div class="card-body table-responsive">
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                        CssClass="table table-striped table-bordered" DataSourceID="SqlDataSource6">
                        <Columns>
                            <asp:BoundField DataField="teacher_id" HeaderText="教師編號" SortExpression="teacher_id" />
                            <asp:BoundField DataField="teacher_name" HeaderText="教師姓名" SortExpression="teacher_name" />
                            <asp:BoundField DataField="course_id" HeaderText="課程編號" SortExpression="course_id" />
                            <asp:BoundField DataField="course_name" HeaderText="課程名稱" SortExpression="course_name" />
                            <asp:BoundField DataField="student_id" HeaderText="學生編號" SortExpression="student_id" />
                            <asp:BoundField DataField="student_name" HeaderText="學生姓名" SortExpression="student_name" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap Script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
