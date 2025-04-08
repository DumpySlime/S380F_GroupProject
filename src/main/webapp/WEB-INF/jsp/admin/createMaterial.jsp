<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Course Material - Online Course Management System</title>
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
        input, textarea, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        textarea {
            height: 100px;
            resize: vertical;
        }
        .file-note {
            font-size: 12px;
            color: #777;
            margin-top: 5px;
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
                <div class="page-title">Add Course Material</div>
                <a href="/admin/materials" class="back-link">Return to Materials List</a>
            </div>
            
            <div class="form-container">
                <form:form method="POST" modelAttribute="materialForm" enctype="multipart/form-data">
                    <div class="form-group">
                        <form:label path="courseId">Course ID</form:label>
                        <form:input path="courseId" type="number" required="true" />
                    </div>
                    
                    <div class="form-group">
                        <form:label path="title">Title</form:label>
                        <form:input path="title" required="true" />
                    </div>
                    
                    <div class="form-group">
                        <form:label path="description">Description</form:label>
                        <form:textarea path="description" required="true" />
                    </div>
                    
                    <div class="form-group">
                        <form:label path="uploadedBy">Uploaded By</form:label>
                        <form:input path="uploadedBy" required="true" />
                    </div>
                    
                    <div class="form-group">
                        <form:label path="file">File</form:label>
                        <form:input path="file" type="file" required="true" />
                        <div class="file-note">Please select a file to upload (max 10MB)</div>
                    </div>
                    
                    <button type="submit">Add Material</button>
                </form:form>
            </div>
        </div>
    </div>
</body>
</html> 