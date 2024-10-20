<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createuser.aspx.cs" Inherits="Patient_Feedback.createuser" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create User</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    
    <style>
        html, body {
            background-image: url('Images/loginform.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            height: 90%;
            font-family: 'Numans', sans-serif;
            margin-top:40px;
        }

        .container {
            height: 100%;
            display: flex; /* Use flexbox to align items */
            justify-content: flex-end; /* Align content to the right */
            align-items: center; /* Center vertically */
        }

        .card {
            height: auto;
            width: 400px;
            background-color: rgba(0, 0, 0, 0.5) !important; /* Semi-transparent background for card */
        }

        .card-header h3 {
            color: white;
        }

        .input-group-prepend span {
            width: 70px;
            background-color: #FFC312;
            color: black;
            border: 0 !important;
        }

        input:focus {
            outline: 0 0 0 0 !important;
            box-shadow: 0 0 0 0 !important;
        }

        .login_btn {
            color: black;
            background-color: #FFC312;
            width: 100%;
        }

        .login_btn:hover {
            color: black;
            background-color: white;
        }

        .social_icon span {
            font-size: 70px;
            margin-left: 10px;
            color: #FFC312;
        }

        .social_icon span:hover {
            color: white;
            cursor: pointer;
        }

        .social_icon {
            position: absolute;
            right: 20px;
            top: -45px;
        }
    </style>
    <script>
        function validatePasswords() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;

            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-center h-100">
            <div class="card">
                <div class="card-header">
                    <h3>Create User</h3>
                    <div class="d-flex justify-content-end social_icon">
                        <span><i class="fab fa-facebook-square"></i></span>
                        <span><i class="fab fa-google-plus-square"></i></span>
                        <span><i class="fab fa-twitter-square"></i></span>
                    </div>
                </div>
                <div class="card-body">
                    <form runat="server" onsubmit="return validatePasswords();">
                        <div class="form-group">
                           <%-- <input type="text" id="name" class="form-control mt-3" placeholder="Name" required="required" />--%>
                             <asp:TextBox ID="name" runat="server" Class="form-control mt-3" Placeholder="Name" required="required"  ></asp:TextBox>
                        </div>

                        <div class="form-group">
                           <%-- <input type="text" id="username" class="form-control mt-3" placeholder="User ID" required="required" />--%>
                               <asp:TextBox ID="username" runat="server" Class="form-control mt-3" Placeholder="User ID" required="required"  ></asp:TextBox>
                        </div>

                        <div class="form-group">
                           <%-- <input type="password" id="password" class="form-control mt-3" placeholder="Password" required="required" />--%>
                              <asp:TextBox ID="password" TextMode="Password" runat="server" Class="form-control mt-3" Placeholder="Password" required="required"  ></asp:TextBox>
                        </div>

                        <div class="form-group">
                           <%-- <input type="password" id="confirmPassword" class="form-control mt-3" placeholder="Confirm Password" required="required" />--%>
                            <asp:TextBox ID="confirmPassword" TextMode="Password" runat="server" Class="form-control mt-3" Placeholder="Confirm Password" required="required"  ></asp:TextBox>
                        </div>

                        <div class="form-group">
                           <%-- <input type="text" id="role" class="form-control mt-3" placeholder="Role" required="required" />--%>
                             <asp:TextBox ID="role" runat="server" Class="form-control mt-3" Placeholder="Role" required="required"  ></asp:TextBox>
                        </div>

                        <div class="form-group">
                           <%-- <input type="email" id="email" class="form-control mt-3" placeholder="Email ID" required="required" />--%>
                             <asp:TextBox ID="useremail" runat="server" Class="form-control mt-3" Placeholder="Email ID" required="required"  ></asp:TextBox>
                        </div>

                        <div class="form-group">
             <asp:Button ID="Button1" runat="server" value="Create User" class="btn login_btn" Text="Submit" OnClick="CreateUser_Click" />
                            <input id="Button1" type="button" href="" value="button" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
