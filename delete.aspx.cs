using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        //註解：進入編輯模式
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
        }

        //註解：取消編輯
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
        }

        //註解：更新時將 "請選擇" 轉為 DBNull
        protected void SqlDataSource1_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            ConvertGradeToDbNull(e);
        }

        //註解：將 grade 的空值轉為 DBNull
        private void ConvertGradeToDbNull(SqlDataSourceCommandEventArgs e)
        {
            if (e.Command.Parameters.Contains("grade"))
            {
                var gradeParam = e.Command.Parameters["grade"];
                if (gradeParam != null && string.IsNullOrWhiteSpace(gradeParam.Value?.ToString()))
                {
                    gradeParam.Value = DBNull.Value;
                }
            }
        }

        //註解：只讓 grade 欄位可編輯，其他欄位顯示為唯讀
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //註解：處理正在編輯的資料列
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowState.HasFlag(DataControlRowState.Edit))
            {
                for (int i = 1; i < e.Row.Cells.Count; i++)
                {
                    //註解：grade 欄位 index 是第 5 欄，保留可編輯
                    if (i != 5 && e.Row.Cells[i].Controls.Count > 0)
                    {
                        Control ctrl = e.Row.Cells[i].Controls[0];
                        if (ctrl is TextBox txt)
                        {
                            Literal literal = new Literal();
                            literal.Text = txt.Text;
                            e.Row.Cells[i].Controls.Clear();
                            e.Row.Cells[i].Controls.Add(literal);
                        }
                    }
                }
            }
        }

        //註解：更新後離開編輯模式
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridView1.EditIndex = -1;
        }
    }
}
