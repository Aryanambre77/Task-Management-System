<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTask.aspx.cs" Inherits="TaskManagement.AddTask" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Task</title>
    <style>
        body {
            background-image: url('Images/a3.jpg');
            background-size: cover;
            background-position: center;
            display:block;
            font-family: Arial, sans-serif;
            color: #fff;
            padding:80px;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 10px;
            width: 400px;
            margin: 80px auto;
            color: #333;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }

        .form-container h1 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
        }

        .form-field {
            margin-bottom: 15px;
        }

        .form-field label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"], textarea, select {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        input[type="date"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .btn-primary {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            width: 100%;
            margin-top: 10px;
        }

        .btn-primary:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Add Task</h1>
        <form id="form1" runat="server">
            <div class="form-field">
                <label for="txtTitle">Task Title</label>
                <asp:TextBox ID="txtTitle" runat="server" placeholder="Enter task title"></asp:TextBox>
            </div>
            <div class="form-field">
                <label for="txtDescription">Description</label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="3" placeholder="Enter task description"></asp:TextBox>
            </div>
            <div class="form-field">
                <label for="ddlPriority">Priority</label>
                <asp:DropDownList ID="ddlPriority" runat="server">
                    <asp:ListItem>Low</asp:ListItem>
                    <asp:ListItem>Medium</asp:ListItem>
                    <asp:ListItem>High</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-field">
                <label for="txtDueDate">Due Date</label>
                <asp:TextBox ID="txtDueDate" runat="server" TextMode="Date"></asp:TextBox>
            </div>
            <asp:Button ID="btnSave" runat="server" Text="Save Task" CssClass="btn-primary" OnClick="btnSave_Click" />
        </form>
    </div>
</body>
</html>
