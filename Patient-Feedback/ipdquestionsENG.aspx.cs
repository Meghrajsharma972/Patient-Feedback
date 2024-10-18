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
using System.Net.Mail;

namespace Patient_Feedback
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void DoctorFedbackYES(object sender, EventArgs e)
        {
            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string isSatisfied =  (Request.Form["Q1"]); // Assuming Q1 is the name of the radio buttons
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

        protected void DoctorFedbackNO(object sender, EventArgs e)
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

        protected void btnNurseFedbackYES(object sender, EventArgs e)
        {
            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string isSatisfied = (Request.Form["Q1"]); // Assuming Q1 is the name of the radio buttons
            string observation = Request.Form["txtfeebdackObservation1"];
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

        protected void btnNurseFeedbackNo(object sender, EventArgs e)
        {
            DataTable feedbackTable = new DataTable();
            feedbackTable.Columns.Add("FeedbackQuestionID", typeof(int));
            feedbackTable.Columns.Add("RatingID", typeof(int));

            // Fill DataTable with selected values from form
            feedbackTable.Rows.Add(5, Request.Form["Nq1"]); // Question 1
            feedbackTable.Rows.Add(6, Request.Form["Nq2"]); // Question 2
            feedbackTable.Rows.Add(7, Request.Form["Nq3"]); // Question 3
            feedbackTable.Rows.Add(8, Request.Form["Nq4"]); // 


            // Call the method to save all questions at once
            //feedbackID, feedbackTable

            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string feedbackCategoryID = "1";
            string isSatisfied = (Request.Form["Q1"]);
            string radiobutton = (Request.Form["DRq1"]);
            string observation = Request.Form["txtfeebdackObservation2"];
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

        protected void btnAdmissionFeedbackYES(object sender, EventArgs e)
        {
            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string isSatisfied = (Request.Form["Q1"]); // Assuming Q1 is the name of the radio buttons
            string observation = Request.Form["txtAdmissionObservation1"];
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

        protected void btnAdmissionFeedbackNo(object sender, EventArgs e)
        {
            DataTable feedbackTable = new DataTable();
            feedbackTable.Columns.Add("FeedbackQuestionID", typeof(int));
            feedbackTable.Columns.Add("RatingID", typeof(int));

            // Fill DataTable with selected values from form
            feedbackTable.Rows.Add(8, Request.Form["Adq1"]); // Question 1
            feedbackTable.Rows.Add(9, Request.Form["Adq2"]); // Question 2
            feedbackTable.Rows.Add(10, Request.Form["Adq3"]); // Question 3
            



            // Call the method to save all questions at once
            //feedbackID, feedbackTable

            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string feedbackCategoryID = "1";
            string isSatisfied = (Request.Form["Q1"]);
            string radiobutton = (Request.Form["DRq1"]);
            string observation = Request.Form["txtAdmissionObservation2"];
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

        protected void btnDischargeFeedbackYES(object sender, EventArgs e)
        {
            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string isSatisfied = (Request.Form["Q1"]); // Assuming Q1 is the name of the radio buttons
            string observation = Request.Form["txtDischargeObservation1"];
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

        protected void btnDischargeFeedbackNo(object sender, EventArgs e)
        {
            DataTable feedbackTable = new DataTable();
            feedbackTable.Columns.Add("FeedbackQuestionID", typeof(int));
            feedbackTable.Columns.Add("RatingID", typeof(int));

            // Fill DataTable with selected values from form
            feedbackTable.Rows.Add(11, Request.Form["Dq1"]); // Question 1
            feedbackTable.Rows.Add(12, Request.Form["Dq2"]); // Question 2
            feedbackTable.Rows.Add(13, Request.Form["Dq3"]); // Question 3
            feedbackTable.Rows.Add(14, Request.Form["Dq4"]); // Question 4



            // Call the method to save all questions at once
            //feedbackID, feedbackTable

            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string feedbackCategoryID = "1";
            string isSatisfied = (Request.Form["Q1"]);
            string radiobutton = (Request.Form["DRq1"]);
            string observation = Request.Form["txtDischargeObservation2" +
                ""];
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

        protected void btnbillingFeedbackYES(object sender, EventArgs e)
        {
            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string isSatisfied = (Request.Form["Q1"]); // Assuming Q1 is the name of the radio buttons
            string observation = Request.Form["txtBillingObservation1"];
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


        protected void btnbillingFeedbackNo(object sender, EventArgs e)
        {
            DataTable feedbackTable = new DataTable();
            feedbackTable.Columns.Add("FeedbackQuestionID", typeof(int));
            feedbackTable.Columns.Add("RatingID", typeof(int));

            // Fill DataTable with selected values from form
            feedbackTable.Rows.Add(15, Request.Form["Dq1"]); // Question 1
            feedbackTable.Rows.Add(16, Request.Form["Dq2"]); // Question 2
            feedbackTable.Rows.Add(17, Request.Form["Dq3"]); // Question 3
            feedbackTable.Rows.Add(18, Request.Form["Dq4"]); // Question 4



            // Call the method to save all questions at once
            //feedbackID, feedbackTable

            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string feedbackCategoryID = "1";
            string isSatisfied = (Request.Form["Q1"]);
            string radiobutton = (Request.Form["DRq1"]);
            string observation = Request.Form["txtBillingObservation2"];
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

        protected void btninvestigationFeedbackYES(object sender, EventArgs e)
        {
            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string isSatisfied = (Request.Form["Q1"]); // Assuming Q1 is the name of the radio buttons
            string observation = Request.Form["txtInvestigationObservation1"];
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

        protected void btninvestigationFeedbackNo(object sender, EventArgs e)
        {
            DataTable feedbackTable = new DataTable();
            feedbackTable.Columns.Add("FeedbackQuestionID", typeof(int));
            feedbackTable.Columns.Add("RatingID", typeof(int));

            // Fill DataTable with selected values from form
            feedbackTable.Rows.Add(5, Request.Form["rdInvestigationq1"]); // Question 1
            feedbackTable.Rows.Add(6, Request.Form["rdInvestigationq2"]); // Question 2
            feedbackTable.Rows.Add(7, Request.Form["rdInvestigationq3"]); // Question 3
            feedbackTable.Rows.Add(8, Request.Form["rdInvestigationq4"]); // Question 4



            // Call the method to save all questions at once
            //feedbackID, feedbackTable

            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string feedbackCategoryID = "1";
            string isSatisfied = (Request.Form["Q1"]);
            string radiobutton = (Request.Form["DRq1"]);
            string observation = Request.Form["txtInvestigationObservation2"];
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

        protected void btnFBFeedbackYES(object sender, EventArgs e)
        {
            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string isSatisfied = (Request.Form["Q1"]); // Assuming Q1 is the name of the radio buttons
            string observation = Request.Form["txtf&bObservation1"];
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

        protected void btnFBFeedbackNo(object sender, EventArgs e)
        {
            DataTable feedbackTable = new DataTable();
            feedbackTable.Columns.Add("FeedbackQuestionID", typeof(int));
            feedbackTable.Columns.Add("RatingID", typeof(int));

            // Fill DataTable with selected values from form
            feedbackTable.Rows.Add(5, Request.Form["rdF&Bq1"]); // Question 1
            feedbackTable.Rows.Add(6, Request.Form["rdF&Bq2"]); // Question 2
            feedbackTable.Rows.Add(7, Request.Form["rdF&Bq3"]); // Question 3
            



            // Call the method to save all questions at once
            //feedbackID, feedbackTable

            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string feedbackCategoryID = "1";
            string isSatisfied = (Request.Form["Q1"]);
            string radiobutton = (Request.Form["DRq1"]);
            string observation = Request.Form["txtf&bObservation2"];
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

        protected void btnHouseKeepingFeedbackYES(object sender, EventArgs e)
        {
            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string isSatisfied = (Request.Form["Q1"]); // Assuming Q1 is the name of the radio buttons
            string observation = Request.Form["txtHouseKeepingObservation1"];
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

        protected void btnHouseKeepingFeedbackNo(object sender, EventArgs e)
        {
            DataTable feedbackTable = new DataTable();
            feedbackTable.Columns.Add("FeedbackQuestionID", typeof(int));
            feedbackTable.Columns.Add("RatingID", typeof(int));

            // Fill DataTable with selected values from form
            feedbackTable.Rows.Add(5, Request.Form["rdHouseKeepingq1"]); // Question 1
            feedbackTable.Rows.Add(6, Request.Form["rdHouseKeepingq2"]); // Question 2
            feedbackTable.Rows.Add(7, Request.Form["rdHouseKeepingq3"]); // Question 3
        



            // Call the method to save all questions at once
            //feedbackID, feedbackTable

            int patientID = Convert.ToInt32(HttpContext.Current.Session["PatientID"]);
            string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection conn = new SqlConnection(strcon);
            conn.Open();
            string feedbackCategoryID = "1";
            string isSatisfied = (Request.Form["Q1"]);
            string radiobutton = (Request.Form["DRq1"]);
            string observation = Request.Form["txtHouseKeepingObservation2"];
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

        protected void btnOverallFeedbackYES(object sender, EventArgs e)
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

        protected void btnOverallFeedbackNo(object sender, EventArgs e)
        {
            DataTable feedbackTable = new DataTable();
            feedbackTable.Columns.Add("FeedbackQuestionID", typeof(int));
            feedbackTable.Columns.Add("RatingID", typeof(int));

            // Fill DataTable with selected values from form
            feedbackTable.Rows.Add(5, Request.Form["rdOverAllq1"]); // Question 1
            feedbackTable.Rows.Add(6, Request.Form["rdOverAllq2"]); // Question 2
            feedbackTable.Rows.Add(7, Request.Form["rdOverAllq3"]); // Question 3
            feedbackTable.Rows.Add(8, Request.Form["rdOverAllq4"]); // Question 4
            feedbackTable.Rows.Add(6, Request.Form["rdOverAllq5"]);
            feedbackTable.Rows.Add(7, Request.Form["rdOverAllq6"]);
            feedbackTable.Rows.Add(8, Request.Form["rdOverAllq7"]);
                                                   


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

        protected void Button12_Click(object sender, EventArgs e)
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