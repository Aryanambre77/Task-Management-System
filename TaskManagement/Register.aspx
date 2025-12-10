<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TaskManagement.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <style>
        .register-page {
            background-image: url('Images/r3.jpg');
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
            padding: 40px;
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
            margin-bottom: 10px;
        }

        input[type="text"], input[type="password"], input[type="email"] {
            width: 100%;
            padding: 15px;
            margin: 10px  10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        input[type="text"]:focus, input[type="password"]:focus, input[type="email"]:focus {
            border-color: #4CAF50;
            outline: none;
        }

        .btn-primary {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 2px 2px;
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
            color: black;
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
    <div class="page-background register-page">
        <form id="form1" runat="server">
            <div class="form-container">
                <h1>Create an Account</h1>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

                <div class="form-field">
                    <asp:TextBox ID="txtName" runat="server" placeholder="Full Name" required="true" Height="34px" Width="266px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ForeColor="Red" ErrorMessage="Name is required." />
                </div>

                <div class="form-field">
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" required="true" Height="34px" Width="266px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Email is required." />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ForeColor="Red" 
                        ErrorMessage="Invalid email format." ValidationExpression="^[^@]+@[^@]+\.[^@]+$" />
                </div>

                <div class="form-field">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" required="true" Height="34px" Width="266px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ForeColor="Red" ErrorMessage="Password is required." />
                </div>

                <div class="form-field">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password" required="true" Height="34px" Width="266px"></asp:TextBox>
                    <asp:CompareValidator ID="cvPassword" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" ForeColor="Red" 
                        ErrorMessage="Passwords do not match." />
                </div>

                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-primary" Height="33px" Width="95px" OnClick="btnRegister_Click" />
                <p>Already have an account? <a href="Login.aspx">Login here</a></p>
            </div>
        </form>
    </div>
</body>
</html>
