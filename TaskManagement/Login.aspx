<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TaskManagement.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        .login-page {
            background-image: url('Images/l3.jpg');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.85);
            padding: 110px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        .form-container h1 {
            color: #333;
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 30px;
            text-align: center;
        }

        .form-field {
            margin-bottom: 20px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #4CAF50;
            outline: none;
        }

        .btn-primary {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 18px;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 10px;
        }

        .btn-primary:hover {
            background-color: #45a049;
        }

        p {
            margin-top: 20px;
            font-size: 16px;
            color:black;
        }

        a {
            color: #4CAF50;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="page-background login-page">
        <form id="form1" runat="server">
            <div class="form-container">
                <h1>Login to Your Account</h1>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

                <div class="form-field">
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" required="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Email is required." />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ForeColor="Red"
                        ErrorMessage="Invalid email format." ValidationExpression="^[^@]+@[^@]+\.[^@]+$" />
                </div>

                <div class="form-field">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" required="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ForeColor="Red" ErrorMessage="Password is required." />
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-primary" OnClick="btnLogin_Click" />
                <p>Don't have an account? <a href="Register.aspx">Sign up here</a></p>
            </div>
        </form>
    </div>
</body>
</html>
