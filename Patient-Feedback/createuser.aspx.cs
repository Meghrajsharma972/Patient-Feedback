using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Patient_Feedback
{
    public partial class createuser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            // Validate that both passwords match before proceeding
            string password = Request.Form["password"];
            string confirmPassword = Request.Form["confirmPassword"];

            if (password != confirmPassword)
            {
                Response.Write("<script>alert('Passwords do not match!');</script>");
                return; // Stop processing if passwords do not match
            }

            // Proceed with creating the user in the database
            try
            {
                string strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(strcon))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO mst_users (Name,username, password, role, useremail) VALUES (@name, @username, @password, @role, @useremail)", conn))
                    {
                        cmd.Parameters.AddWithValue("@name", name.Text.Trim());
                        cmd.Parameters.AddWithValue("@username", username.Text.Trim());
                        cmd.Parameters.AddWithValue("@password", password.Trim());
                        cmd.Parameters.AddWithValue("@role", role.Text.Trim());
                        cmd.Parameters.AddWithValue("@useremail", useremail.Text.Trim());

                        cmd.ExecuteNonQuery();

                        name.Text = string.Empty;
                        username.Text = string.Empty;
                        
                        
                        role.Text = string.Empty;
                        useremail.Text = string.Empty;
                    }
                }
                Response.Write("<script>alert('User created successfully!');</script>");
                Response.Redirect("login.aspx");
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }
    }
}