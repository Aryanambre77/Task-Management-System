<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskDashboard.aspx.cs" Inherits="TaskManagement.TaskDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Task Dashboard</title>
    <style>
        /* General Styles for Task Dashboard */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
            background-color: #f1f1f1;
        }

        .dashboard-container {
            background-image: url('Images/r2.jpg');
            background-size: cover;
            height:100vh;
            background-position: center;
            color: white;
            padding: 60px 20px;
            text-align: center;
        }

        .dashboard-header {
            margin-bottom: 40px;
            color:black;
        }

        .dashboard-header h1 {
            font-size: 40px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 10px;
        }

        .dashboard-header p {
            font-size: 18px;
            color: rgba(255, 255, 255, 0.7);
            color:black;
        }

        .btn-primary {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 18px;
            cursor: pointer;
            border-radius: 5px;
            margin: 10px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #45a049;
        }

        /* Task Table Styling */
        .task-table-container {
            max-width: 90%;
            margin: 20px auto;
            background-color: rgba(255, 255, 255, 0.85);
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 20px;
            color:black;
        }

        .task-table {
            width: 100%;
            border-collapse: collapse;
        }

        .task-table th, .task-table td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
        }

        .task-table th {
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
        }

        .task-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .task-table tr:hover {
            background-color: #f1f1f1;
            cursor: pointer;
        }

        .task-table .delete-btn {
            background-color: red;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 18px;
            cursor: pointer;
            border-radius: 5px;
            margin: 10px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        /* Mobile responsiveness */
        @media screen and (max-width: 768px) {
            .task-table-container {
                padding: 15px;
            }
            .dashboard-header h1 {
                font-size: 30px;
            }
        }

        /* Additional styling for task action buttons */
        .task-actions {
            text-align: right;
            margin-top: 20px;
        }

       
        .filters {
            display: flex;
            justify-content: space-between;
            margin-bottom: 70px;
            align-content:center;
            align-items:center;
        }

        .filters select {
            padding: 10px;
            align-content:center;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
            align-items:center;
        }


    </style>
</head>
<body>

    <div class="dashboard-container">
        <div class="dashboard-header">
            <h1>Task Dashboard</h1>
            <p>Manage your tasks efficiently. Stay productive and on top of your work!</p>
        </div>
        <form id="form2" runat="server">


            


        <!-- Button to Add a New Task -->
        <div class="task-actions">
            <asp:Button ID="Button1" runat="server" Text="Add New Task" CssClass="btn-primary" OnClick="btnAddTask_Click" />
        </div>

        <!-- Task Table -->
        <div class="task-table-container">
                        <div class="filters">
    <asp:DropDownList ID="ddlStatusFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="FilterTasks" style="align-content:center">
        <asp:ListItem Value="">All Status</asp:ListItem>
        <asp:ListItem Value="Pending">Pending</asp:ListItem>
        <asp:ListItem Value="Completed">Completed</asp:ListItem>
    </asp:DropDownList>
    <asp:DropDownList ID="ddlPriorityFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="FilterTasks">
        <asp:ListItem Value="">All Priority</asp:ListItem>
        <asp:ListItem Value="Low">Low</asp:ListItem>
        <asp:ListItem Value="Medium">Medium</asp:ListItem>
        <asp:ListItem Value="High">High</asp:ListItem>
    </asp:DropDownList>
</div>


          <asp:GridView ID="GridViewTasks" runat="server" AutoGenerateColumns="false" CssClass="task-table" OnRowCommand="GridViewTasks_RowCommand" DataKeyNames="TaskID" OnRowDeleting="GridViewTasks_RowDeleting">
    <Columns>
        <asp:BoundField DataField="TaskID" HeaderText="Task ID" SortExpression="TaskID" />
        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
        <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
        <asp:BoundField DataField="DueDate" HeaderText="Due Date" SortExpression="DueDate" />
        
        
        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update" Text="Update" CommandArgument='<%# Eval("TaskID") %>' CssClass="btn-primary" OnClientClick="return confirm('Are you sure you want to edit this task?');" />
                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Delete" CommandArgument='<%# Eval("TaskID") %>' CssClass="delete-btn" OnClientClick="return confirm('Are you sure you want to delete this task?');" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>


        </div>
    </div>
    </form>
</body>
</html>
