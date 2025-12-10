using System;
using System.Data.SqlClient;

namespace TaskManagement
{
    public partial class EditTask : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                int taskId = Convert.ToInt32(Request.QueryString["TaskID"]);
                LoadTask(taskId);
            }
        }

        private void LoadTask(int taskId)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TaskManagerConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Title, Description, Status, Priority, DueDate FROM Tasks WHERE TaskID = @TaskID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@TaskID", taskId);
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtTitle.Text = reader["Title"].ToString();
                    txtDescription.Text = reader["Description"].ToString();
                    ddlStatus.SelectedValue = reader["Status"].ToString();
                    ddlPriority.SelectedValue = reader["Priority"].ToString();
                    txtDueDate.Text = Convert.ToDateTime(reader["DueDate"]).ToString("yyyy-MM-dd");
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int taskId = Convert.ToInt32(Request.QueryString["TaskID"]);
            string title = txtTitle.Text.Trim();
            string description = txtDescription.Text.Trim();
            string status = ddlStatus.SelectedValue;
            string priority = ddlPriority.SelectedValue;
            DateTime dueDate = Convert.ToDateTime(txtDueDate.Text);

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TaskManagerConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE Tasks SET Title = @Title, Description = @Description, Status = @Status, Priority = @Priority, DueDate = @DueDate WHERE TaskID = @TaskID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@Status", status);
                cmd.Parameters.AddWithValue("@Priority", priority);
                cmd.Parameters.AddWithValue("@DueDate", dueDate);
                cmd.Parameters.AddWithValue("@TaskID", taskId);
                conn.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("TaskDashboard.aspx");
        }
    }
}
