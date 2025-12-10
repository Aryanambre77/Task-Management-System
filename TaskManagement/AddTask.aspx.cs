using System;
using System.Data.SqlClient;

namespace TaskManagement
{
    public partial class AddTask : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string userID = Session["UserID"].ToString();
            string title = txtTitle.Text.Trim();
            string description = txtDescription.Text.Trim();
            string priority = ddlPriority.SelectedValue;
            string dueDate = txtDueDate.Text;

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TaskManagerConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Tasks (UserID, Title, Description, Priority, DueDate, Status) VALUES (@UserID, @Title, @Description, @Priority, @DueDate, 'Pending')";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userID);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@Priority", priority);
                cmd.Parameters.AddWithValue("@DueDate", dueDate);

                conn.Open();
                cmd.ExecuteNonQuery();

                Response.Redirect("TaskDashboard.aspx");
            }
        }
    }
}
