<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditTask.aspx.cs" Inherits="TaskManagement.EditTask" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Task</title>
    <style>
        body {
            background-image: url('Images/u1.jpg');
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        h1 {
            color: #333;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin: 10px -10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        .btn-primary {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 18px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Edit Task</h1>
        <form id="form1" runat="server">
            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" Placeholder="Task Title"></asp:TextBox>
            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Placeholder="Task Description"></asp:TextBox>
            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                <asp:ListItem Value="Pending">Pending</asp:ListItem>
                <asp:ListItem Value="Completed">Completed</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlPriority" runat="server" CssClass="form-control">
                <asp:ListItem Value="Low">Low</asp:ListItem>
                <asp:ListItem Value="Medium">Medium</asp:ListItem>
                <asp:ListItem Value="High">High</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtDueDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn-primary" OnClick="btnSave_Click" />
        </form>
    </div>
</body>
</html>
