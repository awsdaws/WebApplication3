<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="WebApplication3.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title></title>

<!-- Bootstrap 5.2.3 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server" class="container my-4">
        <div class="table-responsive">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MYDBConnectionString %>" DeleteCommand="DELETE FROM [Employee] WHERE [emp001] = @emp001" InsertCommand="INSERT INTO [Employee] ([emp002], [empexit], [emp006]) VALUES (@emp002, @empexit, @emp006)" SelectCommand="SELECT [emp001], [emp002], [empexit], [emp006] FROM [Employee]" UpdateCommand="UPDATE [Employee] SET [emp002] = @emp002, [empexit] = @empexit, [emp006] = @emp006 WHERE [emp001] = @emp001">
                <DeleteParameters>
                    <asp:Parameter Name="emp001" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="emp002" Type="String" />
                    <asp:Parameter Name="empexit" Type="String" />
                    <asp:Parameter Name="emp006" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="emp002" Type="String" />
                    <asp:Parameter Name="empexit" Type="String" />
                    <asp:Parameter Name="emp006" Type="String" />
                    <asp:Parameter Name="emp001" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MYDBConnectionString %>" SelectCommand="SELECT [emptitle_001], [emptitle_002] FROM [EmpTitle]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MYDBConnectionString %>" SelectCommand="SELECT [empexit002], [empexit003], [empexit001] FROM [EmpExit]"></asp:SqlDataSource>

            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="emp001" DataSourceID="SqlDataSource1" CssClass="table table-striped table-bordered align-middle" PagerStyle-CssClass="pagination justify-content-center" Width="100%">
                <Columns>
                    <asp:CommandField ShowEditButton="True" ButtonType="Button" EditText="編輯" CancelText="取消" UpdateText="更新" ControlStyle-CssClass="btn btn-sm btn-primary me-1" />

                    <%-- 職員編號：唯讀 --%>
                    <asp:BoundField DataField="emp001" HeaderText="職員編號" InsertVisible="False" ReadOnly="True" SortExpression="emp001" />

                    <%-- 職員姓名：唯讀 --%>
                    <asp:TemplateField HeaderText="職員姓名" SortExpression="emp002">
                        <ItemTemplate>
                            <asp:Label ID="Label_emp002" runat="server" Text='<%# Bind("emp002") %>' CssClass="form-control-plaintext" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="Label_emp002_edit" runat="server" Text='<%# Bind("emp002") %>' CssClass="form-control-plaintext" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <%-- 職位：唯讀顯示職位名稱，但保留下拉來源 --%>
                    <asp:TemplateField HeaderText="職位" SortExpression="empexit">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource2"
                                DataTextField="emptitle_002" DataValueField="emptitle_001"
                                SelectedValue='<%# Bind("emp006") %>' Enabled="False" CssClass="form-select form-select-sm" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource2"
                                DataTextField="emptitle_002" DataValueField="emptitle_001"
                                SelectedValue='<%# Bind("emp006") %>' Enabled="False" CssClass="form-select form-select-sm" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <%-- 狀態：編輯時可選，其他時為唯讀 --%>
                    <asp:TemplateField HeaderText="狀態" SortExpression="emp006">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3"
                                DataTextField="empexit003" DataValueField="empexit001"
                                SelectedValue='<%# Bind("empexit") %>' Enabled="False" CssClass="form-select form-select-sm" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3"
                                DataTextField="empexit003" DataValueField="empexit001"
                                SelectedValue='<%# Bind("empexit") %>' CssClass="form-select form-select-sm" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
