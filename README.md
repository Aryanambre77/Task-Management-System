# 🗂️ Task Management System  

![ASP.NET](https://img.shields.io/badge/Framework-ASP.NET-blueviolet?style=for-the-badge)
![C#](https://img.shields.io/badge/Language-C%23-239120?style=for-the-badge)
![SQL-Server](https://img.shields.io/badge/Database-SQL%20Server-red?style=for-the-badge)
![HTML](https://img.shields.io/badge/Frontend-HTML-orange?style=for-the-badge)
![CSS](https://img.shields.io/badge/Design-CSS-blue?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)

---

## 📖 Overview  
The **Task Management System** is a full-featured web application built with **ASP.NET** and **C#** that helps users efficiently manage their tasks.  
It allows you to **create**, **update**, **delete**, and **filter** tasks based on **priority** and **status**, all through a clean and intuitive dashboard.  

This project focuses on improving organization, boosting productivity, and replacing outdated manual tracking methods like spreadsheets or handwritten to-do lists.

---

## 🎯 Problem Definition  
Managing multiple tasks becomes challenging when there’s no structured system, leading to:  
- Missed deadlines  
- Disorganization  
- Poor team collaboration  

Traditional tools lack features like **real-time tracking**, **priority filtering**, and **progress updates**, which this system provides.

---

## 🎯 Project Objectives  
The project aims to:  
- Enable **users to create, edit, and manage tasks easily.**  
- Allow **prioritization and filtering** of tasks for better clarity.  
- Provide **real-time updates** and an organized dashboard.  
- Secure **user authentication** with login and registration.  
- Store all data persistently in a **SQL Server database.**

---

## 🧰 Tech Stack  
| Category | Technology |
|-----------|-------------|
| **Frontend** | HTML, CSS, ASP.NET Web Forms |
| **Backend** | C#, ASP.NET |
| **Database** | SQL Server |
| **IDE** | Visual Studio |
| **Server** | IIS / Localhost |

---

## 🚀 Features  

### 👤 User Authentication  
- Register and login with secure credential validation.  
- Password confirmation and verification.  
- Each user maintains their personal task list.  

### 📋 Dashboard  
- Displays all tasks with **title, description, status, priority, and due date**.  
- Filter tasks dynamically by **status (Pending/Completed)** or **priority (High/Medium/Low)**.  

### 🧱 CRUD Operations  
- **Create:** Add new tasks.  
- **Read:** View all tasks in a table format.  
- **Update:** Modify tasks or change completion status.  
- **Delete:** Permanently remove tasks.  

### 🎨 User Interface  
- Modern and minimal design.  
- Smooth user experience and quick navigation.  

---

## 💾 Database Design  

### 🗃️ Table: `Users`
| Column | Type | Description |
|--------|------|-------------|
| UserID | int | Unique identifier |
| Name | varchar | User’s name |
| Email | varchar | Used for login |
| Password | varchar | Stored securely |

### 🗃️ Table: `Tasks`
| Column | Type | Description |
|--------|------|-------------|
| TaskID | int | Unique identifier |
| UserID | int | Linked with user |
| Title | varchar | Task name |
| Description | varchar | Details of task |
| Status | varchar | Pending / Completed |
| Priority | varchar | High / Medium / Low |
| DueDate | datetime | Task deadline |
| CreatedAt | datetime | Creation timestamp |

---

## 🧩 How It Works  

1. **Register/Login:**  
   Create an account or log in using your credentials.  
2. **Access Dashboard:**  
   Manage all your tasks from one central interface.  
3. **Add / Update / Delete Tasks:**  
   Perform full CRUD operations effortlessly.  
4. **Filter Tasks:**  
   Sort tasks by status or priority.  
5. **Database Integration:**  
   All data is stored and fetched from **SQL Server**.  

---

## 🖼️ Demo  

| Screen | Description |
|--------|--------------|
| **🔐 Register Page** | Create a new account by entering name, email, and password. |
| **🔑 Login Page** | Access your personalized task dashboard. |
| **📊 Dashboard** | View all your tasks with priority and status indicators. |
| **🧾 Add Task** | Add a new task with title, description, and due date. |
| **✏️ Edit Task** | Update task progress or modify details. |
| **🗑️ Delete Task** | Remove a task permanently after completion. |
| **🔍 Filters** | Filter tasks based on priority (High/Medium/Low) or status (Pending/Completed). |
| **💽 Database** | Stores all user and task information in SQL Server. |

---

## ⚙️ Installation & Setup  

1. **Clone the Repository**
   ```bash
   git clone https://github.com/<your-username>/Task-Management-System.git

2. **Open the Project**

3. **Launch Visual Studio**

4. **Open the .sln file**

5. **Configure Database**

6. **Import the SQL tables (Users, Tasks) into SQL Server**

7. **Update connection string in Web.config**

8. **Run the Application**

9. **Access the app at http://localhost:<port>/**

---

## 🔮 Future Enhancements

📱 Responsive mobile design

🧑‍🤝‍🧑 Team collaboration features

🔔 Email/SMS notifications for due tasks

📊 Progress charts and analytics

## 👨‍💻 Author

Developed by: Aryan Ambre
📧 aryanambre77@gmail.com

## 🏁 Conclusion

The Task Management System helps users stay organized, manage priorities, and complete work efficiently.
With its smooth UI, CRUD functionality, and reliable data storage, it’s a complete productivity solution built on the ASP.NET framework.
