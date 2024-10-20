using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

namespace Patient_Feedback
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Create controls or bind data only on the first load
            }
        }

        protected void logButton_Click(object sender, EventArgs e)
        {
            try
            {
                string strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(strcon))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM mst_users WHERE username = @username AND password = @password", conn))
                    {
                        cmd.Parameters.AddWithValue("@username", txtUsername.Text.Trim());
                        cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim()); // Ideally, use hashed password

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                while (reader.Read())
                                {
                                    Session["username"] = reader["username"].ToString();
                                    Response.Redirect("admindeshboard.aspx");
                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('Invalid Credentials')</script>");
                                ClearInputFields();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}')</script>");
                System.Diagnostics.Debug.WriteLine("Exception: " + ex.Message);
            }
        }

        private void ClearInputFields()
        {
            txtUsername.Text = string.Empty;
            txtPassword.Text = string.Empty;
        }
    }
}
