<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - Online Course Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        h1 {
            color: #333;
            margin-bottom: 30px;
        }
        
        .welcome {
            background-color: #f0f7ff;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 30px;
            border-left: 5px solid #0066cc;
        }
        
        .dashboard-menu {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        
        .menu-item {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            text-align: center;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        
        .menu-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .menu-item i {
            font-size: 48px;
            margin-bottom: 15px;
            color: #0066cc;
        }
        
        .menu-item h3 {
            margin: 0 0 10px 0;
            color: #333;
        }
        
        .menu-item p {
            color: #666;
            margin: 0;
        }
        
        a {
            text-decoration: none;
            color: inherit;
        }
        
        .logout {
            display: inline-block;
            margin-top: 30px;
            padding: 10px 20px;
            background-color: #f44336;
            color: white;
            border-radius: 5px;
            text-decoration: none;
        }
        
        .logout:hover {
            background-color: #d32f2f;
        }
        
        /* Font Awesome icon styles */
        .fa {
            display: inline-block;
            font: normal normal normal 14px/1 FontAwesome;
            font-size: inherit;
            text-rendering: auto;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
        
        .fa-users:before {
            content: "\f0c0";
        }
        
        .fa-book:before {
            content: "\f02d";
        }
        
        .fa-upload:before {
            content: "\f093";
        }
        
        .fa-cog:before {
            content: "\f013";
        }
        
        .fa-comment:before {
            content: "\f075";
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>
        
        <div class="welcome">
            <h2>Welcome, ${username}</h2>
            <p>Welcome to the Online Course Management System's admin dashboard. From here, you can manage users, course materials, and system settings.</p>
        </div>
        
        <div class="dashboard-menu">
            <a href="<c:url value="/admin/users" />">
                <div class="menu-item">
                    <i class="fa fa-users"></i>
                    <h3>User Management</h3>
                    <p>Manage system users, roles and permissions</p>
                </div>
            </a>
            
            <a href="<c:url value="/admin/materials" />">
                <div class="menu-item">
                    <i class="fa fa-book"></i>
                    <h3>Course Materials</h3>
                    <p>Manage course materials, lectures and resources</p>
                </div>
            </a>
            
            <a href="<c:url value="/admin/comments" />">
                <div class="menu-item">
                    <i class="fa fa-comment"></i>
                    <h3>Comment Management</h3>
                    <p>Manage comments for courses and polls</p>
                </div>
            </a>
            
            <a href="#">
                <div class="menu-item">
                    <i class="fa fa-cog"></i>
                    <h3>System Settings</h3>
                    <p>Configure system parameters and global settings</p>
                </div>
            </a>
        </div>
        
        <a href="<c:url value="/logout" />" class="logout">Logout</a>
    </div>
</body>
</html> 