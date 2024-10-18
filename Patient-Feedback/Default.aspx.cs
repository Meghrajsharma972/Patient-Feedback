using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Patient_Feedback
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["PatientType"] != null)
            {
                int patientType = (int)Session["PatientType"];
                
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["PatientType"] = "IPD";
            Response.Redirect("Details.aspx");
             
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["PatientType"] = "OPD";
            Response.Redirect("opddetails.aspx");
           
        }

    }
}