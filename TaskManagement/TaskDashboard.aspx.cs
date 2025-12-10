using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskManagement
{
    public partial class TaskDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Ensure user is logged in
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            // Load tasks only when the page is loaded for the first time
            if (!IsPostBack)
            {
                LoadTasks();
            }
        }

        // Method to load tasks from the database
        private void LoadTasks()
        {
            string userID = Session["UserID"].ToString();
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TaskManagerConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT TaskID, Title, Status, Priority, DueDate FROM Tasks WHERE UserID = @UserID";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                da.SelectCommand.Parameters.AddWithValue("@UserID", userID);
                DataTable dt = new DataTable();
                da.Fill(dt);

                // Bind data to the GridView
                GridViewTasks.DataSource = dt;
                GridViewTasks.DataBind();
            }
        }

        // Event handler for adding a new task
        protected void btnAddTask_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddTask.aspx");
        }

        // Event handler for updating or deleting a task
        protected void GridViewTasks_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // If the command name is Delete
            if (e.CommandName == "Delete")
            {
                // Get the TaskID of the row
                int taskId = Convert.ToInt32(e.CommandArgument);

                // Connection string
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TaskManagerConnectionString"].ConnectionString;

                // Delete the task from the database
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM Tasks WHERE TaskID = @TaskID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@TaskID", taskId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                // Reload tasks after deletion
                LoadTasks();
            }

            // If the command name is Update (This part can be extended)
            else if (e.CommandName == "Update")
            {
                // Get the TaskID of the row
                int taskId = Convert.ToInt32(e.CommandArgument);
                // Redirect to UpdateTask.aspx passing the TaskID as query string
                Response.Redirect("UpdateTask.aspx?taskId=" + taskId);
            }
        }

        protected void GridViewTasks_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        private void LoadTasks(string statusFilter = "", string priorityFilter = "")
        {
            string userID = Session["UserID"].ToString();
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TaskManagerConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT TaskID, Title, Status, Priority, DueDate FROM Tasks WHERE UserID = @UserID";
                if (!string.IsNullOrEmpty(statusFilter))
                {
                    query += " AND Status = @Status";
                }
                if (!string.IsNullOrEmpty(priorityFilter))
                {
                    query += " AND Priority = @Priority";
                }

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userID);

                if (!string.IsNullOrEmpty(statusFilter))
                {
                    cmd.Parameters.AddWithValue("@Status", statusFilter);
                }
                if (!string.IsNullOrEmpty(priorityFilter))
                {
                    cmd.Parameters.AddWithValue("@Priority", priorityFilter);
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewTasks.DataSource = dt;
                GridViewTasks.DataBind();
            }
        }

        protected void FilterTasks(object sender, EventArgs e)
        {
            string statusFilter = ddlStatusFilter.SelectedValue;
            string priorityFilter = ddlPriorityFilter.SelectedValue;

            LoadTasks(statusFilter, priorityFilter);
        }
    }
}
