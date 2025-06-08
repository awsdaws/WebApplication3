using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            string message;

            if (e.Exception != null)
            {
                message = "更新失敗：" + e.Exception.Message;
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                message = "更新失敗：未找到對應資料。";
            }
            else
            {
                message = "更新成功！";
            }

            // 註冊 JavaScript 彈窗
            string script = $"alert('{message}');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "updateAlert", script, true);
        }
    }
}