<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Course Materials Management - Online Course Management System</title>
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
        .action-buttons a {
            display: inline-block;
            margin-left: 10px;
            padding: 8px 15px;
            border-radius: 4px;
            text-decoration: none;
            color: white;
        }
        .create-btn {
            background-color: #5cb85c;
        }
        .batch-btn {
            background-color: #5bc0de;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        th, td {
            text-align: left;
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .actions a {
            margin-right: 10px;
            text-decoration: none;
        }
        .edit {
            color: #5bc0de;
        }
        .delete {
            color: #d9534f;
        }
        .view {
            color: #5cb85c;
        }
        .course-id {
            display: inline-block;
            padding: 5px 10px;
            background-color: #eee;
            border-radius: 3px;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <h2>Admin System</h2>
            <ul>
                <li><a href="<c:url value="/admin/dashboard" />">Dashboard</a></li>
                <li><a href="<c:url value="/admin/users" />">User Management</a></li>
                <li><a href="<c:url value="/admin/materials" />">Course Materials</a></li>
                <li><a href="<c:url value="/admin/comments" />">Comment Management</a></li>
                <li><a href="<c:url value="/logout" />">Logout</a></li>
            </ul>
        </div>
        <div class="content">
            <div class="header">
                <div class="page-title">Course Materials Management</div>
                <div class="action-buttons">
                    <a href="<c:url value="/admin/materials/create" />" class="create-btn">Add Material</a>
                    <a href="<c:url value="/admin/materials/batch-upload" />" class="batch-btn">Batch Upload</a>
                </div>
            </div>
            
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Filename</th>
                        <th>Uploaded By</th>
                        <th>Course Info</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${materials}" var="material">
                        <tr>
                            <td>${material.id}</td>
                            <td>${material.title}</td>
                            <td>${material.description}</td>
                            <td>${material.fileName}</td>
                            <td>${material.uploadedBy}</td>
                            <td>
                                <span class="course-id">Course #${material.courseId}</span>
                                <a href="<c:url value="/admin/materials/course/view/${material.courseId}" />" class="view">View Details</a>
                            </td>
                            <td class="actions">
                                <a href="<c:url value="/admin/materials/edit/${material.id}" />" class="edit">Edit</a>
                                <a href="<c:url value="/admin/materials/delete/${material.id}" />" class="delete" 
                                   onclick="return confirm('Are you sure you want to delete this material?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                    
                    <c:if test="${empty materials}">
                        <tr>
                            <td colspan="7" style="text-align: center;">No materials available</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html> 