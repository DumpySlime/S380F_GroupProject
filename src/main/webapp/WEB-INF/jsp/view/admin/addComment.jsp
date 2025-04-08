<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${title}</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h1>${title}</h1>
        
        <form action="<c:url value="/admin/comments/add" />" method="post">
            <input type="hidden" name="entityType" value="${entityType}">
            <input type="hidden" name="entityId" value="${entityId}">
            
            <div class="mb-3">
                <label for="content" class="form-label">Comment Content</label>
                <textarea class="form-control" id="content" name="content" rows="5" required></textarea>
            </div>
            
            <div class="mb-3">
                <button type="submit" class="btn btn-primary">Submit Comment</button>
                <a href="<c:url value="/admin/comments/${entityType.toLowerCase()}/${entityId}" />" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 