using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Patient_Feedback
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Loginbtn(object sender, EventArgs e)
        {
            try
            {
                
                Response.Redirect("admindashboard.aspx");
            }
            
            
            catch (Exception ex)
            {
                Response.Write($"<script>alert('" + ex.Message + "')</script>");
                System.Diagnostics.Debug.WriteLine("Exception: " + ex.Message);
            }
            
          
        }
    }
}