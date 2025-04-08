<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Comment Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h1>Comment Management</h1>
        
        <div class="mb-3">
            <a href="<c:url value="/admin/dashboard" />" class="btn btn-secondary">Back to Dashboard</a>
        </div>

        <c:choose>
            <c:when test="${empty comments}">
                <div class="alert alert-info">No comments available</div>
            </c:when>
            <c:otherwise>
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Type</th>
                                <th>Content</th>
                                <th>Author</th>
                                <th>Created At</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${comments}" var="comment">
                                <tr>
                                    <td>${comment.id}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${comment.entityType == 'COURSE'}">
                                                Course Comment
                                            </c:when>
                                            <c:when test="${comment.entityType == 'POLL'}">
                                                Poll Comment
                                            </c:when>
                                            <c:otherwise>
                                                ${comment.entityType}
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${comment.content}</td>
                                    <td>${comment.createdBy}</td>
                                    <td><fmt:formatDate value="${comment.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td>
                                        <div class="btn-group">
                                            <a href="<c:url value="/admin/comments/${comment.entityType.toLowerCase()}/${comment.entityId}" />" class="btn btn-sm btn-info">View Related</a>
                                            <a href="<c:url value="/admin/comments/edit/${comment.id}" />" class="btn btn-sm btn-warning">Edit</a>
                                            <a href="<c:url value="/admin/comments/delete/${comment.id}" />" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this comment?')">Delete</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 