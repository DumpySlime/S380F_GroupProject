<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Batch Upload Materials - Online Course Management System</title>
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
            max-width: 800px;
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
        .file-area {
            border: 2px dashed #ddd;
            padding: 20px;
            margin: 15px 0;
            text-align: center;
            border-radius: 4px;
        }
        .file-note {
            color: #777;
            margin: 10px 0;
        }
        button {
            background-color: #5cb85c;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
            font-size: 16px;
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
                <div class="page-title">Batch Upload Course Materials</div>
                <a href="/admin/materials" class="back-link">Return to Materials List</a>
            </div>
            
            <div class="form-container">
                <form:form method="POST" modelAttribute="batchForm" enctype="multipart/form-data">
                    <div class="form-group">
                        <form:label path="courseId">Course ID</form:label>
                        <form:input path="courseId" type="number" required="true" />
                    </div>
                    
                    <div class="form-group">
                        <form:label path="title">Common Title</form:label>
                        <form:input path="title" required="true" />
                    </div>
                    
                    <div class="form-group">
                        <form:label path="description">Common Description</form:label>
                        <form:textarea path="description" required="true" />
                    </div>
                    
                    <div class="form-group">
                        <form:label path="uploadedBy">Uploaded By</form:label>
                        <form:input path="uploadedBy" required="true" />
                    </div>
                    
                    <div class="form-group">
                        <label for="files">Select Multiple Files</label>
                        <div class="file-area">
                            <input type="file" id="files" name="files" multiple required />
                            <div class="file-note">Click here to select multiple files, or drag and drop files here</div>
                        </div>
                    </div>
                    
                    <button type="submit">Batch Upload</button>
                </form:form>
            </div>
        </div>
    </div>
</body>
</html> 