<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>${title}</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h1>${title}</h1>
        
        <div class="mb-3">
            <a href="<c:url value="/admin/comments/${entityType.toLowerCase()}/${entityId}/add" />" class="btn btn-primary">Add Comment</a>
            <c:choose>
                <c:when test="${entityType == 'COURSE'}">
                    <a href="<c:url value="/admin/materials/course/view/${entityId}" />" class="btn btn-secondary">Return to Course</a>
                </c:when>
                <c:when test="${entityType == 'POLL'}">
                    <a href="<c:url value="/admin/materials/poll/view/${entityId}" />" class="btn btn-secondary">Return to Poll</a>
                </c:when>
            </c:choose>
            <a href="<c:url value="/admin/dashboard" />" class="btn btn-secondary">Return to Dashboard</a>
        </div>

        <c:choose>
            <c:when test="${empty comments}">
                <div class="alert alert-info">No comments available</div>
            </c:when>
            <c:otherwise>
                <div class="list-group">
                    <c:forEach items="${comments}" var="comment">
                        <div class="list-group-item">
                            <div class="d-flex justify-content-between align-items-center">
                                <h5 class="mb-1">${comment.createdBy}</h5>
                                <small><fmt:formatDate value="${comment.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/></small>
                            </div>
                            <p class="mb-1">${comment.content}</p>
                            <div class="d-flex gap-2 mt-2">
                                <a href="<c:url value="/admin/comments/edit/${comment.id}" />" class="btn btn-sm btn-warning">Edit</a>
                                <a href="<c:url value="/admin/comments/delete/${comment.id}" />" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this comment?')">Delete</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 