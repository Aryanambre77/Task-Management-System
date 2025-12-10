using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace TaskManagement
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Make sure you use the correct connection string
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TaskManagerConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Query to check if the email and password exist (without any encryption)
                string query = "SELECT UserID FROM Users WHERE Email = @Email AND Password = @Password";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);  // Direct comparison with the plain text password

                try
                {
                    conn.Open();
                    object result = cmd.ExecuteScalar(); // Executes the query and returns the UserID

                    if (result != null)
                    {
                        // User is authenticated, store UserID in the session
                        Session["UserID"] = result.ToString();
                        Response.Redirect("TaskDashboard.aspx"); // Redirect to the dashboard
                    }
                    else
                    {
                        // Invalid email or password
                        lblMessage.Text = "Invalid email or password.";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }
    }
}
