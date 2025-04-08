<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create User - Online Course Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        .container {
            display: flex;
            min-height: 100vh;
        }
        .sidebar {
            width: 250px;
            background-color: #333;
            color: white;
            padding: 20px 0;
        }
        .sidebar h2 {
            padding: 0 20px;
            margin-bottom: 30px;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
        }
        .sidebar li {
            padding: 10px 20px;
        }
        .sidebar li:hover {
            background-color: #444;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
        }
        .content {
            flex: 1;
            padding: 20px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 10px;
            border-bottom: 1px solid #ddd;
        }
        .page-title {
            font-size: 24px;
        }
        .back-link {
            color: #337ab7;
            text-decoration: none;
        }
        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            max-width: 600px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            background-color: #5cb85c;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }
        button:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <h2>Admin System</h2>
            <ul>
                <li><a href="/admin/dashboard">Dashboard</a></li>
                <li><a href="/admin/users">User Management</a></li>
                <li><a href="/admin/materials">Course Materials</a></li>
                <li><a href="/admin/materials/batch-upload">Batch Upload</a></li>
                <li><a href="/logout">Logout</a></li>
            </ul>
        </div>
        <div class="content">
            <div class="header">
                <div class="page-title">Create New User</div>
                <a href="/admin/users" class="back-link">Back to User List</a>
            </div>
            
            <div class="form-container">
                <form:form method="POST" modelAttribute="userForm">
                    <div class="form-group">
                        <form:label path="username">Username</form:label>
                        <form:input path="username" required="true" />
                    </div>
                    
                    <div class="form-group">
                        <form:label path="password">Password</form:label>
                        <form:password path="password" required="true" />
                    </div>
                    
                    <div class="form-group">
                        <form:label path="fullName">Full Name</form:label>
                        <form:input path="fullName" required="true" />
                    </div>
                    
                    <div class="form-group">
                        <form:label path="email">Email</form:label>
                        <form:input path="email" type="email" required="true" />
                    </div>
                    
                    <div class="form-group">
                        <form:label path="role">Role</form:label>
                        <form:select path="role" required="true">
                            <form:option value="ROLE_ADMIN">Administrator</form:option>
                            <form:option value="ROLE_USER">Regular User</form:option>
                        </form:select>
                    </div>
                    
                    <button type="submit">Create User</button>
                </form:form>
            </div>
        </div>
    </div>
</body>
</html> 