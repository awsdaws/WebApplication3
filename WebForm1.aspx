<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>職員查詢系統</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container my-4">
            <!-- 🔍 查詢功能 -->
            <div class="mb-3">
                <asp:Label ID="Label7" runat="server" Text="查詢職員編號：" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control d-inline w-auto mx-2"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="查詢" CssClass="btn btn-primary me-2" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="顯示全部" CssClass="btn btn-secondary" OnClick="Button2_Click" />
            </div>

            <!-- 🗂️ 資料來源 -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>"
                SelectCommand="">
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>"
                SelectCommand="SELECT * FROM [VIEW2] WHERE ([teacher_id] = @teacher_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="teacher_id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource6" runat="server"
                ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>"
                SelectCommand="SELECT * FROM [VIEW3] WHERE ([teacher_id] = @teacher_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView2" Name="teacher_id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <!-- 👨‍💼 職員資料 -->
            <div class="card my-4">
                <div class="card-header bg-success text-white fs-5">職員資料</div>
                <div class="card-body table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        CssClass="table table-bordered table-striped"
                        DataSourceID="SqlDataSource1"
                        DataKeyNames="employeeID"
                        AllowPaging="True" PageSize="10"
                        OnPageIndexChanging="GridView1_PageIndexChanging"
                        OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
                        >
                        <Columns>
                            <asp:BoundField DataField="employeeID" HeaderText="職員編號" ReadOnly="True" />
                            <asp:BoundField DataField="name" HeaderText="姓名" />
                            <asp:BoundField DataField="ID" HeaderText="身分證字號" />
                            <asp:BoundField DataField="gender" HeaderText="性別" />
                            <asp:BoundField DataField="title" HeaderText="職位" />
                            <asp:BoundField DataField="address" HeaderText="地址" />
                            <asp:BoundField DataField="onbord" HeaderText="入值日期" />
                            <asp:BoundField DataField="resign" HeaderText="離值日期" />
                            <asp:CommandField ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <!-- 📘 授課查詢 -->
            <div class="card my-4">
                <div class="card-header bg-primary text-white fs-5">授課查詢</div>
                <div class="card-body table-responsive">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                        CssClass="table table-striped table-bordered"
                        DataSourceID="SqlDataSource5"
                        DataKeyNames="teacher_id,course_id">
                        <Columns>
                            <asp:BoundField DataField="teacher_id" HeaderText="教師編號" ReadOnly="True" />
                            <asp:BoundField DataField="teacher_name" HeaderText="教師姓名" />
                            <asp:BoundField DataField="course_id" HeaderText="課程編號" ReadOnly="True" />
                            <asp:BoundField DataField="course_name" HeaderText="課程名稱" />
                            <asp:BoundField DataField="credits" HeaderText="學分" />
                            <asp:CommandField ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <!-- 🎓 授課學生查詢 -->
            <div class="card my-4">
                <div class="card-header bg-secondary text-white fs-5">授課學生查詢</div>
                <div class="card-body table-responsive">
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False"
                        CssClass="table table-striped table-bordered"
                        DataSourceID="SqlDataSource6">
                        <Columns>
                            <asp:BoundField DataField="teacher_id" HeaderText="教師編號" />
                            <asp:BoundField DataField="teacher_name" HeaderText="教師姓名" />
                            <asp:BoundField DataField="course_id" HeaderText="課程編號" />
                            <asp:BoundField DataField="course_name" HeaderText="課程名稱" />
                            <asp:BoundField DataField="student_id" HeaderText="學生編號" />
                            <asp:BoundField DataField="student_name" HeaderText="學生姓名" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
