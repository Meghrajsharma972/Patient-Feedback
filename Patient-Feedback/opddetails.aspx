<%@ Page Title="OPD Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="opddetails.aspx.cs" Inherits="Patient_Feedback.opddetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <head>
        <style>
            body {
                font-family: Arial;
                margin: 0;
                padding: 0;
                background-color: #f8f8f8; /* Fallback color */
                background-image: radial-gradient(circle, rgba(255, 0, 0, 0.5) 2px, transparent 2px),
                                  radial-gradient(circle, rgba(255, 0, 0, 0.5) 2px, transparent 2px);
                background-position: 0 0, 25px 25px;
                background-size: 50px 50px;
            }

            .contener {
                width: 100%;
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
                background-color: white;
            }

            header, footer {
                background-color: darkblue;
                padding: 10px;
                text-align: center;
            }

            .Headcontent {
                color: lightseagreen;
                text-align: center;
            }

            /* Flexbox for centering labels and inputs */
            .form-container {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                text-align: left;
            }

            .form-label {
                margin-top: 10px;
                display: block;
                color: black;
                font-weight: bold;
                text-align: center; /* Centering the text */
                width: 100%; /* Full width for label */
            }

            .form-input {
                color: black;
                font-family: Arial;
                padding: 8px;
                width: 100%;
                max-width: 400px; /* Constrain max width of textboxes */
                box-sizing: border-box; /* Ensure padding doesn't affect width */
                margin: 5px 0; /* Add margin for spacing */
            }

            .error-message {
                color: red;
                text-align: center; /* Centering the error message */
                width: 100%; /* Full width for error message */
            }

            .language {
                color: black;
                margin-right: 10px;
                text-align: center;
            }

            /* Button centering */
            .form-button-container {
                text-align: center;
                margin-top: 20px;
            }
        </style>
    </head>

    <body>
        <header>
            <div class="Headcontent">
                <h1>OPD Feedback Form</h1>
                <h1>!!ओपीडी प्रतिपुष्टि प्रपत्र</h1>
            </div>
        </header>

        <div class="card">
            <div class="contener">
                <div class="Headcontent">
                    <p>Please select your preferred language and proceed to fill your details for feedback</p>
                </div>

                <div class="language">
                    <h1 style="font-size: xx-large;">Select Language:</h1>
                    <asp:RadioButton ID="RadioButton1" runat="server" Text="हिन्दी" style="margin-right: 20px;" AutoPostBack="true" GroupName="Lang" OnCheckedChanged="RadioButton1_CheckedChanged" />
                    <asp:RadioButton ID="RadioButton2" runat="server" Text="English" GroupName="Lang" AutoPostBack="true" OnCheckedChanged="RadioButton2_CheckedChanged" />
                </div>

                <!-- Center the form with flexbox -->
                <div class="form-container">
                    <div class="centered-form">
                        <asp:Label ID="Label1" runat="server" CssClass="form-label" Text="Name"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-input" Placeholder="Enter your name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="NameRequiredValidator" runat="server" ControlToValidate="TextBox1"
                            ErrorMessage="Name is required" CssClass="error-message" />
                    </div>

                    <div class="centered-form">
                        <asp:Label ID="Label2" runat="server" CssClass="form-label" Text="Mobile No."></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-input" Placeholder="Enter your Mobile no."></asp:TextBox>
                        <asp:RegularExpressionValidator ID="MobileValidator" runat="server" ControlToValidate="TextBox2"
                            ValidationExpression="^\d{10,12}$"
                            ErrorMessage="Enter valid Mobile No" CssClass="error-message" />
                    </div>

                    <div class="centered-form">
                        <asp:Label ID="Label3" runat="server" CssClass="form-label" Text="IPD No."></asp:Label>
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-input" Placeholder="Enter your IPD no."></asp:TextBox>
                        <asp:RegularExpressionValidator ID="IPDValidator" runat="server" ControlToValidate="TextBox3"
                            ValidationExpression="^\d+$"
                            ErrorMessage="Enter the valid Values" CssClass="error-message" />
                    </div>

                    <div class="centered-form">
                        <asp:Label ID="Label4" runat="server" CssClass="form-label" Text="Email ID"></asp:Label>
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-input" Placeholder="Enter your Email ID"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="EmailValidator" runat="server" ControlToValidate="TextBox4"
                            ValidationExpression="^[\w-\.]+@gmail\.com$"
                            ErrorMessage="Email must be a valid @gmail.com address" CssClass="error-message" />
                    </div>

                    <div class="form-button-container">
                        <asp:Button ID="Button1" runat="server" Text="Proceed Next" CssClass="form-button btn btn-primary mt-2" OnClick="ButtonOPDdetail_Click" />
                    </div>
                </div>
            </div>
        </div>

        <footer>
            <!-- Footer Content -->
        </footer>
    </body>

</asp:Content>
