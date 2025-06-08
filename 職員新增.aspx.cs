using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication3
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                // 自動產生 employeeID（找最大值 + 1）
                int newID = GetNextEmployeeID();

                // 賦值給參數
                SqlDataSource1.InsertParameters["employeeID"].DefaultValue = newID.ToString();
                SqlDataSource1.InsertParameters["name"].DefaultValue = TextBox1.Text;
                SqlDataSource1.InsertParameters["ID"].DefaultValue = TextBox2.Text;
                SqlDataSource1.InsertParameters["gender"].DefaultValue = DropDownList1.SelectedValue;
                SqlDataSource1.InsertParameters["title"].DefaultValue = DropDownList2.SelectedValue;
                SqlDataSource1.InsertParameters["address"].DefaultValue = TextBox5.Text;
                SqlDataSource1.InsertParameters["onbord"].DefaultValue = TextBox6.Text;
                SqlDataSource1.InsertParameters["resign"].DefaultValue = "0";

                int result = SqlDataSource1.Insert();
                ShowAlert(result > 0 ? "新增成功！" : "新增失敗！");
            }
            catch (Exception ex)
            {
                ShowAlert("錯誤: " + ex.Message);
            }
        }

        private int GetNextEmployeeID()
        {
            int nextID = 1;
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["AcademicConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT ISNULL(MAX(employeeID), 0) + 1 FROM employee", conn);
                nextID = (int)cmd.ExecuteScalar();
            }
            return nextID;
        }

        private void ShowAlert(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", $"alert('{message}');", true);
        }

    }
}
