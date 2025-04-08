<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 3/21/2025
  Time: 5:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<!DOCTYPE html>
<html>
<head>
    <title>Log in</title>
    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--%>
    <link href="css/bootstrap.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Log in</h2>
    <c:if test="${param.error != null}">
        <div class="alert alert-danger">The user name or password is incorrect</div>
    </c:if>
    <form action="${pageContext.request.contextPath}/login" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    <p class="mt-3">No account? <a href="${pageContext.request.contextPath}/register">Register immediately</a></p>
    <p class="mt-3">I am a guest? <a href="${pageContext.request.contextPath}/index">Login with guest</a></p>
</div>
</body>
</html>
