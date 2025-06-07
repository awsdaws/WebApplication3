using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class WebForm1 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.Visible = false;
                GridView2.Visible = false;
                GridView3.Visible = false;
            }
            else
            {
                // 重新載入查詢語句（重要）
                if (ViewState["Sql"] != null)
                {
                    SqlDataSource1.SelectCommand = ViewState["Sql"].ToString();
                }
            }
        }

        // 🔍 查詢指定職員編號
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(TextBox1.Text))
            {
                string sql = "SELECT [employeeID], [name], [ID], [gender], [title], [address], [onbord], [resign] FROM [employee] WHERE [employeeID] = @employeeID";
                SqlDataSource1.SelectCommand = sql;
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("employeeID", TypeCode.Int32, TextBox1.Text);

                ViewState["Sql"] = sql;  // 儲存查詢語句

                GridView1.Visible = true;
                GridView1.DataBind();

                GridView2.Visible = true;
                GridView2.DataBind();

                GridView3.Visible = true;
                GridView3.DataBind();
            }
        }

        // 📋 顯示全部職員資料
        protected void Button2_Click(object sender, EventArgs e)
        {
            string sql = "SELECT [employeeID], [name], [ID], [gender], [title], [address], [onbord], [resign] FROM [employee]";
            SqlDataSource1.SelectCommand = sql;
            SqlDataSource1.SelectParameters.Clear();

            ViewState["Sql"] = sql;  // 儲存查詢語句

            GridView1.Visible = true;
            GridView1.DataBind();

            GridView2.Visible = false;
            GridView3.Visible = false;
        }

        // ⭐ GridView 分頁支援
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        // ⭐ GridView 選取行觸發授課查詢
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView2.Visible = true;
            GridView2.DataBind();

            GridView3.Visible = true;
            GridView3.DataBind();
        }
    }
}
