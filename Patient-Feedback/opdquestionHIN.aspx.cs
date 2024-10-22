using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Patient_Feedback
{
    public partial class opdquestionHIN : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDoctorFedbackYES(object sender, EventArgs e)
        {
            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string isSatisfied = (Request.Form["Q1"]); // Assuming Q1 is the name of the radio buttons
            string observation = Request.Form["TextBox1"];
            int feedbackCategoryID = 1; // You mentioned it's hard-coded as 1
            SqlCommand cmd = new SqlCommand("sp_InsertFeedBack", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PatientID", patientID);
            cmd.Parameters.AddWithValue("@isSatisfied", isSatisfied);
            cmd.Parameters.AddWithValue("@Observation", observation ?? string.Empty);
            cmd.Parameters.AddWithValue("@FeedbackCategoryID", feedbackCategoryID);
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        protected void btnDoctorFedbackNO(object sender, EventArgs e)
        {
            DataTable feedbackTable = new DataTable();
            feedbackTable.Columns.Add("FeedbackQuestionID", typeof(int));
            feedbackTable.Columns.Add("RatingID", typeof(int));

            // Fill DataTable with selected values from form
            feedbackTable.Rows.Add(1, Request.Form["DRq1"]); // Question 1
            feedbackTable.Rows.Add(2, Request.Form["DRq2"]); // Question 2
            feedbackTable.Rows.Add(3, Request.Form["DRq3"]); // Question 3
            feedbackTable.Rows.Add(4, Request.Form["DRq4"]); // Question 4

            // Call the method to save all questions at once
            //feedbackID, feedbackTable

            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string feedbackCategoryID = "1";
            string isSatisfied = (Request.Form["Q1"]);
            string radiobutton = (Request.Form["DRq1"]);
            string observation = Request.Form["TextBox35"];
            SqlCommand cmd = new SqlCommand("sp_InsertFeedBack", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PatientID", patientID);
            cmd.Parameters.AddWithValue("@isSatisfied", isSatisfied);
            //cmd.Parameters.AddWithValue("@radiobutton", radiobutton);
            cmd.Parameters.AddWithValue("@Observation", observation ?? string.Empty);
            cmd.Parameters.AddWithValue("@FeedbackCategoryID", feedbackCategoryID);
            cmd.Parameters.AddWithValue("@typFeedbackNo", feedbackTable);
            //tvpParam.SqlDbType = SqlDbType.Structured;
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        protected void btnLabFeedbackYes(object sender, EventArgs e)
        {
            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string isSatisfied = (Request.Form["Q1"]); // Assuming Q1 is the name of the radio buttons
            string observation = Request.Form["txtNursingObservation1"];
            int feedbackCategoryID = 1; // You mentioned it's hard-coded as 1
            SqlCommand cmd = new SqlCommand("sp_InsertFeedBack", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PatientID", patientID);
            cmd.Parameters.AddWithValue("@isSatisfied", isSatisfied);
            cmd.Parameters.AddWithValue("@Observation", observation ?? string.Empty);
            cmd.Parameters.AddWithValue("@FeedbackCategoryID", feedbackCategoryID);
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        protected void btnLabFeedbackNo(object sender, EventArgs e)
        {
            DataTable feedbackTable = new DataTable();
            feedbackTable.Columns.Add("FeedbackQuestionID", typeof(int));
            feedbackTable.Columns.Add("RatingID", typeof(int));

            // Fill DataTable with selected values from form
            feedbackTable.Rows.Add(1, Request.Form["DRq1"]); // Question 1
            feedbackTable.Rows.Add(2, Request.Form["DRq2"]); // Question 2
            feedbackTable.Rows.Add(3, Request.Form["DRq3"]); // Question 3
            feedbackTable.Rows.Add(4, Request.Form["DRq4"]); // Question 4

            // Call the method to save all questions at once
            //feedbackID, feedbackTable

            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string feedbackCategoryID = "1";
            string isSatisfied = (Request.Form["Q1"]);
            string radiobutton = (Request.Form["DRq1"]);
            string observation = Request.Form["txtNursingObservation2"];
            SqlCommand cmd = new SqlCommand("sp_InsertFeedBack", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PatientID", patientID);
            cmd.Parameters.AddWithValue("@isSatisfied", isSatisfied);
            //cmd.Parameters.AddWithValue("@radiobutton", radiobutton);
            cmd.Parameters.AddWithValue("@Observation", observation ?? string.Empty);
            cmd.Parameters.AddWithValue("@FeedbackCategoryID", feedbackCategoryID);
            cmd.Parameters.AddWithValue("@typFeedbackNo", feedbackTable);
            //tvpParam.SqlDbType = SqlDbType.Structured;
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        protected void btnRadiologyYes(object sender, EventArgs e)
        {
            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string isSatisfied = (Request.Form["Q1"]); // Assuming Q1 is the name of the radio buttons
            string observation = Request.Form["txtRadiologyObservation1"];
            int feedbackCategoryID = 1; // You mentioned it's hard-coded as 1
            SqlCommand cmd = new SqlCommand("sp_InsertFeedBack", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PatientID", patientID);
            cmd.Parameters.AddWithValue("@isSatisfied", isSatisfied);
            cmd.Parameters.AddWithValue("@Observation", observation ?? string.Empty);
            cmd.Parameters.AddWithValue("@FeedbackCategoryID", feedbackCategoryID);
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        protected void btnRadiologyNo(object sender, EventArgs e)
        {
            DataTable feedbackTable = new DataTable();
            feedbackTable.Columns.Add("FeedbackQuestionID", typeof(int));
            feedbackTable.Columns.Add("RatingID", typeof(int));

            // Fill DataTable with selected values from form
            feedbackTable.Rows.Add(1, Request.Form["DRq1"]); // Question 1
            feedbackTable.Rows.Add(2, Request.Form["DRq2"]); // Question 2
            feedbackTable.Rows.Add(3, Request.Form["DRq3"]); // Question 3
            feedbackTable.Rows.Add(4, Request.Form["DRq4"]); // Question 4

            // Call the method to save all questions at once
            //feedbackID, feedbackTable

            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string feedbackCategoryID = "1";
            string isSatisfied = (Request.Form["Q1"]);
            string radiobutton = (Request.Form["DRq1"]);
            string observation = Request.Form["txtRadiologyObservation2"];
            SqlCommand cmd = new SqlCommand("sp_InsertFeedBack", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PatientID", patientID);
            cmd.Parameters.AddWithValue("@isSatisfied", isSatisfied);
            //cmd.Parameters.AddWithValue("@radiobutton", radiobutton);
            cmd.Parameters.AddWithValue("@Observation", observation ?? string.Empty);
            cmd.Parameters.AddWithValue("@FeedbackCategoryID", feedbackCategoryID);
            cmd.Parameters.AddWithValue("@typFeedbackNo", feedbackTable);
            //tvpParam.SqlDbType = SqlDbType.Structured;
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        protected void btnFrontofficeYes(object sender, EventArgs e)
        {
            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string isSatisfied = (Request.Form["Q1"]); // Assuming Q1 is the name of the radio buttons
            string observation = Request.Form["txtOverallObservation1"];
            int feedbackCategoryID = 1; // You mentioned it's hard-coded as 1
            SqlCommand cmd = new SqlCommand("sp_InsertFeedBack", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PatientID", patientID);
            cmd.Parameters.AddWithValue("@isSatisfied", isSatisfied);
            cmd.Parameters.AddWithValue("@Observation", observation ?? string.Empty);
            cmd.Parameters.AddWithValue("@FeedbackCategoryID", feedbackCategoryID);
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        protected void btnFrontofficeNo(object sender, EventArgs e)
        {
            DataTable feedbackTable = new DataTable();
            feedbackTable.Columns.Add("FeedbackQuestionID", typeof(int));
            feedbackTable.Columns.Add("RatingID", typeof(int));

            // Fill DataTable with selected values from form
            feedbackTable.Rows.Add(1, Request.Form["DRq1"]); // Question 1
            feedbackTable.Rows.Add(2, Request.Form["DRq2"]); // Question 2
            feedbackTable.Rows.Add(3, Request.Form["DRq3"]); // Question 3
            feedbackTable.Rows.Add(4, Request.Form["DRq4"]); // Question 4

            // Call the method to save all questions at once
            //feedbackID, feedbackTable

            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string feedbackCategoryID = "1";
            string isSatisfied = (Request.Form["Q1"]);
            string radiobutton = (Request.Form["DRq1"]);
            string observation = Request.Form["txtOverallObservation2"];
            SqlCommand cmd = new SqlCommand("sp_InsertFeedBack", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@PatientID", patientID);
            cmd.Parameters.AddWithValue("@isSatisfied", isSatisfied);
            //cmd.Parameters.AddWithValue("@radiobutton", radiobutton);
            cmd.Parameters.AddWithValue("@Observation", observation ?? string.Empty);
            cmd.Parameters.AddWithValue("@FeedbackCategoryID", feedbackCategoryID);
            cmd.Parameters.AddWithValue("@typFeedbackNo", feedbackTable);
            //tvpParam.SqlDbType = SqlDbType.Structured;
            cmd.ExecuteNonQuery();
            conn.Close();
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Thankyou.aspx");
        }

        protected void SendThankYouEmail()
        {
            try
            {

                string smtpUserName = System.Configuration.ConfigurationManager.AppSettings["smtpUserName"];
                string smtpPassword = System.Configuration.ConfigurationManager.AppSettings["smtpPassword"];

                // Fetch the logged-in user's email from the session
                string userEmail = Session["UserEmail"]?.ToString(); // Ensure the session variable contains the user's email

                if (string.IsNullOrEmpty(userEmail))
                {
                    throw new Exception("User email not found in session.");
                }
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress(smtpUserName);
                mail.To.Add(userEmail);
                mail.CC.Add("try.sharmaved0009@gmail.com");
                mail.Subject = "This is Test Subject for Email Test";
                mail.Body = "Thank you for taking the time to share your feedback with us. We truly value your input and appreciate your effort in helping us improve.";

                SmtpClient smtp_Client = new SmtpClient(System.Configuration.ConfigurationSettings.AppSettings["smtpClient"]);
                smtp_Client.Port = Convert.ToInt32(System.Configuration.ConfigurationSettings.AppSettings["smtpPort"]);
                smtp_Client.Credentials = new System.Net.NetworkCredential(smtpUserName, smtpPassword);
                smtp_Client.EnableSsl = Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["enableSSL"]);
                smtp_Client.Send(mail);


                Response.Write("<script>alert('Mail Sent successfully')</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}