using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication3
{
    public partial class 學生 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.AppendDataBoundItems = false;
                DropDownList2.AppendDataBoundItems = false;
                LabelMessage.Text = "";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(TextBox1.Text) ||
                    string.IsNullOrWhiteSpace(TextBox2.Text) ||
                    string.IsNullOrWhiteSpace(TextBox3.Text) ||
                    string.IsNullOrWhiteSpace(TextBox4.Text))
                {
                    LabelMessage.ForeColor = System.Drawing.Color.Red;
                    LabelMessage.Text = "請填寫所有欄位。";
                    return;
                }

                if (!DateTime.TryParse(TextBox3.Text, out DateTime enrollmentDate))
                {
                    LabelMessage.ForeColor = System.Drawing.Color.Red;
                    LabelMessage.Text = "請輸入有效的註冊日期（格式 yyyy-MM-dd）。";
                    return;
                }

                int newId = GetNextId();

                SqlDataSource1.InsertParameters["id"].DefaultValue = newId.ToString();
                SqlDataSource1.InsertParameters["name"].DefaultValue = TextBox1.Text.Trim();
                SqlDataSource1.InsertParameters["national_id"].DefaultValue = TextBox2.Text.Trim();
                SqlDataSource1.InsertParameters["gender"].DefaultValue = DropDownList1.SelectedValue;
                SqlDataSource1.InsertParameters["enrollment_date"].DefaultValue = enrollmentDate.ToString("yyyy-MM-dd");
                SqlDataSource1.InsertParameters["grade"].DefaultValue = DropDownList2.SelectedValue;
                SqlDataSource1.InsertParameters["address"].DefaultValue = TextBox4.Text.Trim();

                SqlDataSource1.Insert();

                // 鎖定欄位
                TextBox1.Enabled = false;
                TextBox2.Enabled = false;
                DropDownList1.Enabled = false;
                TextBox3.Enabled = false;
                DropDownList2.Enabled = false;
                TextBox4.Enabled = false;
                Button1.Enabled = false;

                LabelMessage.ForeColor = System.Drawing.Color.Green;
                LabelMessage.Text = $"資料已成功新增！(id={newId})";
            }
            catch (Exception ex)
            {
                LabelMessage.ForeColor = System.Drawing.Color.Red;
                LabelMessage.Text = "新增失敗：" + ex.Message;
            }
        }

        private int GetNextId()
        {
            int nextId = 1;
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["AcademicConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT ISNULL(MAX(id), 0) + 1 FROM Students";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        nextId = Convert.ToInt32(result);
                    }
                }
            }

            return nextId;
        }
    }
}
