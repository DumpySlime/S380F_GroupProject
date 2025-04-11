<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<!DOCTYPE html>
<html>
<head>
    <title>Log in</title>
</head>
<body>
<!-- Login Status -->
<h2>Login Page</h2>
    <c:if test="${param.error != null}">
        The user name or password is incorrect
    </c:if>
<c:if test="${param.logout != null}">
        <p>You have logged out successfully.</p>
</c:if>

<!-- Login Form-->
    <form action="/login" method="POST">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br/><br/>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" required><br/><br/>

            <input type="checkbox" id="remember-me" name="remember-me"/>
            <label for="remember-me" id="rememberMeLabel">Remember me</label><br/><br/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button type="submit" value="Log In">Login</button>
    </form>
    <p>No account? <a href="register">Register immediately</a></p>
    <p>I am a guest? <a href="index">Login with guest</a></p>
</div>
</body>
</html>
