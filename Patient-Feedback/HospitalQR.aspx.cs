using QRCoder;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Patient_Feedback
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dropdwnlist();
               
            }

        }
        private void dropdwnlist()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

            string query = "SELECT hospital_id, name FROM mst_hospitals WHERE isactive = 1";

            var hospitalList = new List<dynamic>();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        hospitalList.Add(new
                        {
                            Text = reader["name"].ToString(),
                            Value = reader["hospital_id"].ToString()
                        });
                    }

                    con.Close();
                }
            }

            DropDownList1.DataSource = hospitalList;
            DropDownList1.DataTextField = "Text"; // Display text (hospital name)
            DropDownList1.DataValueField = "Value"; // Value (hospital ID)
            DropDownList1.DataBind();

            DropDownList1.Items.Insert(0, new ListItem("Select a Hospital", "0"));
            DropDownList1.SelectedIndex = -1;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            int selectedHospitalId = int.Parse(DropDownList1.SelectedValue);
            string selectedHospitalName = DropDownList1.SelectedItem.Text;

            if (selectedHospitalId == 0)
            {
                lblMessage.Text = "Please select a hospital.";
                imgQRCode.Visible = false;
                hlDownloadLink.Visible = false;
                return;
            }

            // Generate QR Code and save path to database
            GenerateQRCode(selectedHospitalId, selectedHospitalName);

            // Fetch the file name and path
            string fileName = $"{selectedHospitalName}.png";
            string filePath = $"~/QRImages/{fileName}";
            string serverFilePath = Server.MapPath(filePath);

            if (File.Exists(serverFilePath))
            {
                hlDownloadLink.NavigateUrl = filePath;
                hlDownloadLink.Text = "Download QR Code";
                imgQRCode.ImageUrl = filePath;
                imgQRCode.Visible = true;
                hlDownloadLink.Visible = true;
                lblMessage.Text = "";
            }
            else
            {
                lblMessage.Text = "QR Code not generated. Please try again.";
                imgQRCode.Visible = false;
                hlDownloadLink.Visible = false;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DropDownList1.SelectedIndex = -1;
            imgQRCode.Visible = false;
            hlDownloadLink.Visible = false;
        }
        private void GenerateQRCode(int hospitalId, string hospitalName)
        {
            // Generate URL for the QR Code
            string url = $"http://localhost:50507/HospitalQR.aspx?hospitalId={hospitalId}";

            using (QRCodeGenerator qrGenerator = new QRCodeGenerator())
            {
                QRCodeData qrCodeData = qrGenerator.CreateQrCode(url, QRCodeGenerator.ECCLevel.Q);
                using (QRCode qrCode = new QRCode(qrCodeData))
                {
                    using (Bitmap qrCodeImage = qrCode.GetGraphic(20))
                    {
                        string folderPath = Server.MapPath("~/QRImages/");
                        string filePath = Path.Combine(folderPath, $"{hospitalName}.png");

                        if (!Directory.Exists(folderPath))
                        {
                            Directory.CreateDirectory(folderPath);
                        }

                        // Save the QR code image as a PNG
                        qrCodeImage.Save(filePath, System.Drawing.Imaging.ImageFormat.Png);

                        // After saving the QR code, store the file path in the database
                        SaveQRCodePathToDatabase(hospitalId, filePath);
                    }
                }
            }
        }

        // This method updates the QR code file path in the database
        private void SaveQRCodePathToDatabase(int hospitalId, string qrCodePath)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE mst_hospitals SET qrcode = @QRCodePath WHERE hospital_id = @HospitalId";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@QRCodePath", qrCodePath);
                    cmd.Parameters.AddWithValue("@HospitalId", hospitalId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }


        protected void btnDownload_Click(object sender, EventArgs e)
        {
            LinkButton btnDownload = (LinkButton)sender;
            string fileName = btnDownload.CommandArgument;
            string filePath = Server.MapPath($"~/QRImages/{fileName}");

            if (File.Exists(filePath))
            {
                Response.ContentType = "image/png";
                Response.AppendHeader("Content-Disposition", $"attachment; filename={fileName}");
                Response.TransmitFile(filePath);
                Response.End();
            }
            else
            {
                Response.Write("<script>alert('File not found.')</script>");
                Response.Clear();
            }
        }


    }
}