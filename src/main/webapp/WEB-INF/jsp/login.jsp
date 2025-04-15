<!DOCTYPE html>
<html>
<head>
    <title>Log in</title>
    <link href="css/bootstrap.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
<!-- Login Status -->
<h2 class="text-center">Login Page</h2>
    <c:if test="${param.error != null}">
        The user name or password is incorrect
    </c:if>
    <c:if test="${param.logout != null}">
        <p>You have logged out successfully.</p>
    </c:if>

<!-- Login Form-->
    <form action="/login" method="POST">
        <div class="mb-3">
            <label for="username" class="form-label">Username:</label>
            <input type="text" class="form-control" id="username" name="username" required><br/><br/>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required><br/><br/>
        </div>
            <input type="checkbox" id="remember-me" name="remember-me"/>
            <label for="remember-me" id="rememberMeLabel">Remember me</label><br/><br/>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button type="submit" value="Log In">Login</button>
    </form>
    <p class="mt-3">No account? <a href="register">Register immediately</a></p>
    <p class="mt-3">Continue as guest? <a href="/index">View public content</a></p>
</div>
</body>
</html>
