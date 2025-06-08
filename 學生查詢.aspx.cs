using System;
using System.Web.UI;

namespace WebApplication3
{
    public partial class 學生查詢 : Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            int studentId;

            if (int.TryParse(TextBox1.Text.Trim(), out studentId))
            {
                // 查詢指定 ID 的學生
                SqlDataSource1.SelectCommand = "SELECT * FROM Students WHERE id = @id";
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("id", TypeCode.Int32, studentId.ToString());

                GridView1.DataBind();
            }
            else
            {
                // 查詢全部
                SqlDataSource1.SelectCommand = "SELECT * FROM Students";
                SqlDataSource1.SelectParameters.Clear();
                GridView1.DataBind();

                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('請輸入正確的數字 ID！');", true);
            }
        }
    }
}
