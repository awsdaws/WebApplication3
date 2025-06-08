<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="職員離職.aspx.cs" Inherits="WebApplication3.WebForm3" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>GridView resign 編輯</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .edit-resign-textbox {
            max-width: 180px;
            display: inline-block;
        }
        .btn-save {
            min-width: 70px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container my-4">
        <h2 class="mb-4">員工離職資料管理</h2>
        <div class="table-responsive">

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>"
                SelectCommand="SELECT [employeeID], [name], [title], [onbord], [resign] FROM [employee]">
            </asp:SqlDataSource>

            <asp:GridView ID="GridView2" runat="server"
                DataKeyNames="employeeID"
                DataSourceID="SqlDataSource1"
                AutoGenerateColumns="False"
                AllowPaging="True"
                CssClass="table table-striped table-bordered align-middle"
                PagerStyle-CssClass="pagination justify-content-center"
                Width="100%"
                OnSelectedIndexChanged="GridView2_SelectedIndexChanged"
                OnRowCommand="GridView2_RowCommand"
                EditRowStyle-BackColor="#FFFFCC">

                <Columns>
                    <%-- 選取按鈕 --%>
                    <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="80px">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False"
                                CommandName="Select" CssClass="btn btn-outline-primary btn-sm"
                                Text="選取"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%-- 儲存按鈕：僅在編輯模式顯示 --%>
                    <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="90px">
                        <ItemTemplate>
                            <%-- 空白或無按鈕 --%>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="btnUpdate" runat="server" CommandName="UpdateResign"
                                CssClass="btn btn-success btn-sm btn-save" Text="儲存" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <%-- 職員編號 --%>
                    <asp:BoundField DataField="employeeID" HeaderText="職員編號" ReadOnly="True" ItemStyle-Width="110px" />

                    <%-- 職員姓名 --%>
                    <asp:BoundField DataField="name" HeaderText="職員姓名" ReadOnly="True" ItemStyle-Width="150px" />

                    <%-- 職位 --%>
                    <asp:BoundField DataField="title" HeaderText="職位" ReadOnly="True" ItemStyle-Width="150px" />

                    <%-- 入職時間 --%>
                    <asp:BoundField DataField="onbord" HeaderText="入職時間" ReadOnly="True" ItemStyle-Width="140px" />

                    <%-- 離職時間：Label 顯示 / TextBox 編輯 --%>
                    <asp:TemplateField HeaderText="離職時間" ItemStyle-Width="180px">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("resign") %>' CssClass="form-label"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("resign") %>' CssClass="form-control form-control-sm edit-resign-textbox" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <PagerStyle CssClass="pagination justify-content-center" />
            </asp:GridView>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
