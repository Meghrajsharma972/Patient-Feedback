using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Patient_Feedback
{
    public partial class UserDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        void BindGrid()
        {
            string strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();
                string query = "SELECT UserID, Name, Username, Password, Role, UserEmail, CreatedBy, ModifiedOn FROM mst_users WHERE IsActive = '1'";
                SqlCommand cmd = new SqlCommand(query, conn);
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                conn.Close();
            }
        }
        //protected void btnSearch_Click(object sender, EventArgs e)
        //{
        //    string strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        //    using (SqlConnection conn = new SqlConnection(strcon))
        //    {
        //        string query = "SELECT * FROM mst_users WHERE Name LIKE '%' + @SearchText + '%' OR Username LIKE '%' + @SearchText + '%'";
        //        using (SqlCommand cmd = new SqlCommand(query, conn))
        //        {
        //            cmd.Parameters.AddWithValue("@SearchText", txtSearch.Text.Trim());
        //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //            {
        //                DataTable dt = new DataTable();
        //                sda.Fill(dt);
        //                GridView1.DataSource = dt;
        //                GridView1.DataBind();
        //            }
        //        }
        //    }
        //}

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Add"))
            {
                TextBox txtAddName = (TextBox)GridView1.FooterRow.FindControl("txtAddName");
                TextBox txtAddUsername = (TextBox)GridView1.FooterRow.FindControl("txtAddUsername");
                TextBox txtAddPassword = (TextBox)GridView1.FooterRow.FindControl("txtAddPassword");
                TextBox txtAddEmail = (TextBox)GridView1.FooterRow.FindControl("txtAddEmail");
                TextBox txtAddRole = (TextBox)GridView1.FooterRow.FindControl("txtAddRole");

                string strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(strcon))
                {
                    conn.Open();
                    string query = "INSERT INTO mst_users (Name, Username, Password, Role, UserEmail, CreatedBy, ModifiedOn) " +
                                   "VALUES (@Name, @Username, @Password, @Role, @UserEmail, @CreatedBy, GETDATE())";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Name", txtAddName.Text);
                        cmd.Parameters.AddWithValue("@Username", txtAddUsername.Text);
                        cmd.Parameters.AddWithValue("@Password", txtAddPassword.Text);
                        cmd.Parameters.AddWithValue("@Role", txtAddRole.Text);
                        cmd.Parameters.AddWithValue("@UserEmail", txtAddEmail.Text);
                        cmd.Parameters.AddWithValue("@CreatedBy", "Admin"); // Replace with session or relevant value
                        cmd.ExecuteNonQuery();
                    }
                    conn.Close();
                }

                Response.Write("<script>alert('Record Added Successfully');</script>");
                BindGrid();
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGrid();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            Label lblUserID = (Label)row.FindControl("lblDisplayUserID"); // Use the correct ID for display template

            string strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();
                string query = "UPDATE mst_users SET IsActive = '0' WHERE UserID = @UserID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", lblUserID.Text); // Correctly referencing lblDisplayUserID
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            BindGrid();
        }


        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label lblUserID = (Label)GridView1.Rows[e.RowIndex].FindControl("lblEditUserID");
            TextBox txtEditName = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditName");
            TextBox txtEditUsername = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditUsername");
            TextBox txtEditPassword = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditPassword");
            TextBox txtEditEmail = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditEmail");
            TextBox txtEditRole = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditRole");

            string strcon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                conn.Open();
                string query = "UPDATE mst_users SET Name = @Name, username = @Username, password = @password, role = @role, useremail = @useremail, modifiedon = GETDATE() WHERE UserID = @UserID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", txtEditName.Text);
                cmd.Parameters.AddWithValue("@username", txtEditUsername.Text);
                cmd.Parameters.AddWithValue("@password", txtEditPassword.Text);
                cmd.Parameters.AddWithValue("@role", txtEditRole.Text);
                cmd.Parameters.AddWithValue("@useremail", txtEditEmail.Text);
                cmd.Parameters.AddWithValue("@UserID", lblUserID.Text);
                cmd.Parameters.AddWithValue("@modifiedon", DateTime.Now);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            GridView1.EditIndex = -1;
            BindGrid();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGrid();
        }
    }
}
