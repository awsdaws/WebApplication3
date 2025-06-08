using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            // 設定進入編輯模式
            GridView2.EditIndex = GridView2.SelectedIndex;
            GridView2.DataBind();
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateResign")
            {
                int index = GridView2.EditIndex;
                if (index < 0) return;

                int employeeID = Convert.ToInt32(GridView2.DataKeys[index].Value);
                GridViewRow row = GridView2.Rows[index];
                TextBox txtResign = (TextBox)row.FindControl("TextBox1");

                if (txtResign == null)
                {
                    ShowMessage("無法找到離職時間欄位。");
                    return;
                }

                string resign = txtResign.Text;

                string connStr = ConfigurationManager.ConnectionStrings["AcademicConnectionString"].ConnectionString;

                try
                {
                    using (SqlConnection conn = new SqlConnection(connStr))
                    {
                        string query = "UPDATE employee SET resign = @resign WHERE employeeID = @employeeID";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@resign", string.IsNullOrWhiteSpace(resign) ? (object)DBNull.Value : resign);
                        cmd.Parameters.AddWithValue("@employeeID", employeeID);

                        conn.Open();
                        int rows = cmd.ExecuteNonQuery();

                        ShowMessage(rows > 0 ? "資料更新成功！" : "資料更新失敗，找不到該筆資料。");
                    }
                }
                catch (Exception ex)
                {
                    ShowMessage("資料更新發生錯誤：" + ex.Message);
                }

                GridView2.EditIndex = -1;
                GridView2.DataBind();
            }
        }

        private void ShowMessage(string message)
        {
            string script = $"alert('{message}');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", script, true);
        }
    }
}
