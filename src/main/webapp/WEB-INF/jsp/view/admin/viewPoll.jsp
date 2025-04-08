<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Poll</title>
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
        <h1>Poll #${pollId} Details</h1>
        
        <div class="mb-3">
            <a href="<c:url value="/admin/dashboard" />" class="btn btn-secondary">Return to Dashboard</a>
        </div>
        
        <div class="card mb-4">
            <div class="card-header">
                <h3>Poll Information</h3>
            </div>
            <div class="card-body">
                <c:if test="${poll != null}">
                    <div class="row mb-3">
                        <div class="col-md-3"><strong>Title:</strong></div>
                        <div class="col-md-9">${poll.title}</div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-3"><strong>Description:</strong></div>
                        <div class="col-md-9">${poll.description}</div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-3"><strong>Created By:</strong></div>
                        <div class="col-md-9">${poll.createdBy}</div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-3"><strong>Created At:</strong></div>
                        <div class="col-md-9">${poll.createdAt}</div>
                    </div>
                </c:if>
                
                <c:if test="${poll == null}">
                    <p class="text-muted">Poll information not available</p>
                </c:if>
            </div>
        </div>
        
        <div class="comment-section">
            <h3>Poll Comments</h3>
            <div class="mb-3">
                <a href="<c:url value="/admin/comments/poll/${pollId}" />" class="btn btn-primary">View Comments</a>
                <a href="<c:url value="/admin/comments/poll/${pollId}/add" />" class="btn btn-success">Add Comment</a>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 