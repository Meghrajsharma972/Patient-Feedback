using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Threading;
using System.Web.UI;

namespace Patient_Feedback
{
    public partial class opddetails : Page
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
            ViewState["SetLanguage"] = "en"; SetLanguage("en");
        }

        
        private void SetLanguage(string languageCode)
        {
            Thread.CurrentThread.CurrentCulture = new CultureInfo(languageCode);
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(languageCode);

            // Determine the resource file based on the selected language
            //  string resourceFile = languageCode == "hi" ? "Resourceopdhi" : "Resourceopdeng";

            // Update labels based on the selected language
            Label1.Text = GetGlobalResourceObject("LResource", "LabelName").ToString();
            Label2.Text = GetGlobalResourceObject("LResource", "LabelMobile").ToString();
            Label3.Text = GetGlobalResourceObject("LResource", "LabelOPD").ToString();
            Label4.Text = GetGlobalResourceObject("LResource", "LabelEmail").ToString();
        }

        protected void ButtonOPDdetail_Click(object sender, EventArgs e)
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
                    Response.Redirect("opdquestionsENG.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('" + ex.Message + "')</script>");
                System.Diagnostics.Debug.WriteLine("Exception: " + ex.Message);
            }
        }


        //    try
        //    {
        //        // Retrieve the selected language from ViewState
        //        string selectedLanguage = ViewState["SetLanguage"] as string;
        //        int hospital_id = Convert.ToInt32(Session["hospital_id"]);
        //        string patientType = Session["PatientType"] as string;
        //        Response.Write($"<script>alert('" + patientType + "')</script>");
        //        // Response.Write($"<script>alert('" + patientType + "')</script>");

        //        // Connection string
        //        string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        //        SqlConnection conn = new SqlConnection(strcon);
        //        conn.Open();

                
        //        if (selectedLanguage == "hi")
        //        {
               
        //            SqlCommand cmd = new SqlCommand("sp_InsertPatient", conn);
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@name", TextBox1.Text.Trim());
        //            cmd.Parameters.AddWithValue("@mobile", TextBox2.Text.Trim());
        //            cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
        //            cmd.Parameters.AddWithValue("@patienttype", patientType);
        //            cmd.Parameters.AddWithValue("@hospital_id", hospital_id); // Hospital ID from session
        //            cmd.Parameters.AddWithValue("@PatientTypeNo", TextBox3.Text.Trim());

        //            // ExecuteScalar returns the new Patient ID
        //            object result = cmd.ExecuteScalar();
        //            int newPatientID = Convert.ToInt32(result);

        //            // Store the new Patient ID in the session
        //            Session["PatientID"] = newPatientID;
                    
        //            Response.Redirect("opdquestionHIN.aspx");

        //          //  ClearData();

                    
                   
        //        }
                
        //        else
        //        {
                   
        //            SqlCommand cmd = new SqlCommand("sp_InsertPatient", conn);
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.AddWithValue("@name", TextBox1.Text.Trim());
        //            cmd.Parameters.AddWithValue("@mobile", TextBox2.Text.Trim());
        //            cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
        //            cmd.Parameters.AddWithValue("@patienttype", patientType);
        //            cmd.Parameters.AddWithValue("@hospital_id", hospital_id); // Hospital ID from session
        //            cmd.Parameters.AddWithValue("@PatientTypeNo", TextBox3.Text.Trim());

        //            // ExecuteScalar returns the new Patient ID
        //            object result = cmd.ExecuteScalar();
        //            int newPatientID = Convert.ToInt32(result);

        //            // Store the new Patient ID in the session
        //            Session["PatientID"] = newPatientID;

                   
        //            Response.Redirect("opdquestionsENG.aspx");
        //        }
                
                    

                
        //        conn.Close();
        //    }
        //    catch (Exception ex)
        //    {
        //        // Handle and log the exception
        //        Response.Write($"<script>alert('" + ex.Message + "')</script>");
        //        System.Diagnostics.Debug.WriteLine("Exception: " + ex.Message);
        //    }
        //}

        
        

    }
    
}
