using System;
using System.Web.UI;

namespace WebApplication1
{
    public partial class WebForm1 : Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            int studentId;

            if (int.TryParse(TextBox1.Text.Trim(), out studentId))
            {
                // 動態設定查詢條件
                SqlDataSource1.SelectCommand = "SELECT * FROM Students WHERE id = @id";
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("id", TypeCode.Int32, studentId.ToString());

                GridView1.DataBind(); // 重新綁定 GridView
            }
            else
            {
                // 若輸入無效，恢復顯示全部
                SqlDataSource1.SelectCommand = "SELECT * FROM Students";
                SqlDataSource1.SelectParameters.Clear();
                GridView1.DataBind();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('請輸入正確的數字 ID！');", true);
            }
        }
    }
}
