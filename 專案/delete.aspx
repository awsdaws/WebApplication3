<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="delete.aspx.cs" Inherits="WebApplication1.delete" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GridView 編輯範例</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%-- GridView --%>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                DataKeyNames="id" DataSourceID="SqlDataSource1"
                AllowPaging="True"
                OnRowEditing="GridView1_RowEditing"
                OnRowCancelingEdit="GridView1_RowCancelingEdit"
                OnRowUpdating="GridView1_RowUpdating"
                OnRowDataBound="GridView1_RowDataBound" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
                    <asp:BoundField DataField="national_id" HeaderText="身分證字號" SortExpression="national_id" />
                    <asp:BoundField DataField="gender" HeaderText="性別" SortExpression="gender" />
                    <asp:BoundField DataField="enrollment_date" HeaderText="入學日期" SortExpression="enrollment_date" DataFormatString="{0:yyyy-MM-dd}" />
                    
                    <%-- Grade 欄位使用 DropDownList --%>
                    <asp:TemplateField HeaderText="年級" SortExpression="grade">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlGrade" runat="server" SelectedValue='<%# Bind("grade") %>'>
                                <asp:ListItem Text="請選擇" Value="" />
                                <asp:ListItem Text="1" Value="1" />
                                <asp:ListItem Text="2" Value="2" />
                                <asp:ListItem Text="3" Value="3" />
                                <asp:ListItem Text="4" Value="4" />
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <%# Eval("grade") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="address" HeaderText="地址" SortExpression="address" />

                    <%-- 編輯按鈕 --%>
                    <asp:CommandField ShowEditButton="True" />
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

            <%-- 資料來源 --%>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:AcademicConnectionString %>"
                SelectCommand="SELECT * FROM Students"
                UpdateCommand="UPDATE Students SET grade = @grade WHERE id = @id"
                OnUpdating="SqlDataSource1_Updating">
                <UpdateParameters>
                    <asp:Parameter Name="grade" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
