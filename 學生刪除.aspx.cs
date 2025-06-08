using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class 學生刪除 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // 這裡可以不用額外寫更新程式，SqlDataSource會自動更新
            GridView1.EditIndex = -1;
            BindGrid();
        }

        protected void SqlDataSource1_Updating(object sender, SqlDataSourceCommandEventArgs e)
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

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowState.HasFlag(DataControlRowState.Edit))
            {
                for (int i = 1; i < e.Row.Cells.Count; i++)
                {
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
    }
}
