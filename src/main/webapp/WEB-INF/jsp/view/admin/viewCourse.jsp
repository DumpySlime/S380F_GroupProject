<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Course</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        .comment-section {
            margin-top: 30px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h1>Course #${courseId} Details</h1>
        
        <div class="mb-3">
            <a href="<c:url value="/admin/dashboard" />" class="btn btn-secondary">Return to Dashboard</a>
            <a href="<c:url value="/admin/materials" />" class="btn btn-secondary">Return to Materials List</a>
        </div>
        
        <div class="card mb-4">
            <div class="card-header">
                <h3>Course Materials</h3>
            </div>
            <div class="card-body">
                <c:choose>
                    <c:when test="${empty materials}">
                        <p class="text-muted">No materials available for this course</p>
                    </c:when>
                    <c:otherwise>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Material ID</th>
                                        <th>Title</th>
                                        <th>Description</th>
                                        <th>Filename</th>
                                        <th>Uploaded By</th>
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
                                                <a href="<c:url value="/admin/materials/edit/${material.id}" />" class="btn btn-sm btn-warning">Edit</a>
                                                <a href="<c:url value="/admin/materials/delete/${material.id}" />" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this material?')">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        <div class="comment-section">
            <h3>Course Comments</h3>
            <div class="mb-3">
                <a href="<c:url value="/admin/comments/course/${courseId}" />" class="btn btn-primary">View Comments</a>
                <a href="<c:url value="/admin/comments/course/${courseId}/add" />" class="btn btn-success">Add Comment</a>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 