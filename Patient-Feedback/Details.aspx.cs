using System;
using System.Globalization;
using System.Threading;
using System.Web.UI; 
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;

using System.Web.UI.WebControls;
using System.Configuration;

namespace Patient_Feedback
{
    public partial class Details : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set default language to English
                SetLanguage("en");
               
            }
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            SetLanguage("hi");
            ViewState["SetLanguage"] = "hi";
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            SetLanguage("en");
            ViewState["SetLanguage"] = "en";
        }

        private void SetLanguage(string languageCode)
            
        {
            Thread.CurrentThread.CurrentCulture = new CultureInfo(languageCode);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(languageCode);

            Label1.Text = GetGlobalResourceObject("Resource", "LabelName").ToString();
            Label2.Text = GetGlobalResourceObject("Resource", "LabelMobile").ToString();
            Label3.Text = GetGlobalResourceObject("Resource", "LabelIPD").ToString();
            Label4.Text = GetGlobalResourceObject("Resource", "LabelEmail").ToString();
        }

        protected void ButtonIPDdetail_Click(object sender, EventArgs e)
        {
            try
            {
                string selectedLanguage = ViewState["SetLanguage"] as string;
                int hospital_id = Convert.ToInt32(Session["hospital_id"]);
                string patientType = Session["PatientType"] as string;
                Response.Write($"<script>alert('" + patientType + "')</script>");
                string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
                SqlConnection conn = new SqlConnection(strcon);
                conn.Open();

                SqlCommand cmd = new SqlCommand("sp_InsertPatient", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@mobile", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@patienttype", patientType); // Assuming a patient type
                cmd.Parameters.AddWithValue("@hospital_id", 1);
                cmd.Parameters.AddWithValue("@PatientTypeNo", TextBox3.Text.Trim());

                // ExecuteScalar returns the new Patient ID
                object result = cmd.ExecuteScalar();
                int newPatientID = Convert.ToInt32(result);

                // Store the new Patient ID in the session
                Session["PatientID"] = newPatientID;

                // Clear form fields
                TextBox1.Text = string.Empty;
                TextBox2.Text = string.Empty;
                TextBox3.Text = string.Empty;
                TextBox4.Text = string.Empty;

                // Close the connection
                conn.Close();

                // Redirect based on the selected language
                if (selectedLanguage == "hi")
                {
                    Response.Redirect("ipdquestionHIN.aspx");
                }
                else
                {
                    Response.Redirect("ipdquestionsENG.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('" + ex.Message + "')</script>");
                System.Diagnostics.Debug.WriteLine("Exception: " + ex.Message);
            }
        }


        //void details()
        //  {
        //      string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        //      SqlConnection conn = new SqlConnection(strcon);
        //      conn.Open();
        //      SqlCommand cmd = new SqlCommand("INSERT INTO tbl_patient (patient_id, name, mobile, age, gender, email, patienttype, hospital_id, createon, createby, LastModifiedOn) VALUES (10, 'Test', '', NULL, 'test', 'test@gmail.com', 0, ' 01', CURRENT_TIMESTAMP, '', CURRENT_TIMESTAMP); ", conn);
        //      cmd.Parameters.AddWithValue("@name", TextBox1.Text.Trim());
        //      cmd.Parameters.AddWithValue("@mobile", TextBox2.Text.Trim());
        //      cmd.Parameters.AddWithValue("@patient_id", TextBox3.Text.Trim());
        //      cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
        //      cmd.ExecuteNonQuery();
        //      conn.Close();



        //  }

    }
}
