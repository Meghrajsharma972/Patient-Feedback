<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Patient_Feedback.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-image: url('Images/loginform.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: flex-end; /* Aligns the content to the right */
            align-items: center;
            font-family: 'Arial', sans-serif;
            padding-right: 50px; /* Add some padding from the right edge */
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.2);
            width: 400px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            transition: border-color 0.3s;
        }

        .login-container input[type="text"]:focus,
        .login-container input[type="password"]:focus {
            border-color: #007BFF;
            outline: none;
        }

        .login-container .login_btn {
            width: 100%;
            padding: 10px;
            background-color: #FFC312; /* Stylish yellow color */
            color: black;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
            margin-top: 10px; /* Added margin for spacing */
            margin-right:60px;
        }

        .login-container .login_btn:hover {
            background-color: white; /* Changes to white on hover */
            color: black; /* Keeps text color black on hover */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Adds a shadow effect */
        }

        .footer {
            margin-top: 10px;
            font-size: 14px;
        }

        .footer a {
            color: #007BFF;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>

    <div class="login-container">
        <h2>Login</h2>
        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="User ID" />
        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password" />
        <asp:Button ID="loginBtn" runat="server" CssClass="login_btn" Text="Login" OnClick="logButton_Click" />

        <div class="footer">
            <p><a href="#">Forgot Password?</a></p>
            <p>Don't have an account? <a href="createuser.aspx">Sign Up</a></p>
        </div>
    </div>
</asp:Content>
