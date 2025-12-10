using System;
using System.Data.SqlClient;

namespace TaskManagement
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            // Check if passwords match
            if (password != confirmPassword)
            {
                lblMessage.Text = "Passwords do not match.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Database connection
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TaskManagerConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Check if email already exists
                string checkEmailQuery = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
                SqlCommand cmdCheckEmail = new SqlCommand(checkEmailQuery, conn);
                cmdCheckEmail.Parameters.AddWithValue("@Email", email);
                conn.Open();
                int emailCount = (int)cmdCheckEmail.ExecuteScalar();
                conn.Close();

                if (emailCount > 0)
                {
                    lblMessage.Text = "Email is already registered.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return;
                }

                // Insert new user
                string query = "INSERT INTO Users (Name, Email, Password) VALUES (@Name, @Email, @Password)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Registration successful!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    Response.Redirect("Login.aspx"); // Redirect to login page after successful registration
                }
                catch (SqlException ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                finally
                {
                    conn.Close();
                }
            }
        }
    }
}
