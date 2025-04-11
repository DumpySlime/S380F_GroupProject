<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Register</h2>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <c:if test="${not empty success}">
        <div class="alert alert-success">${success}</div>
    </c:if>

    <form action="/register" method="post" modelAttribute="form">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <label for="username" id="unameLabel">Username</label>
            <input type="text" id="username" name="username" required>

            <label for="password" id="passwordLabel">Password</label>
            <input type="password" id="password" name="password" required>

            <label for="fullName" id="fullNameLabel">Full Name</label>
            <input type="text" id="fullName" name="fullName">

            <label for="email" id="emailLabel">Email</label>
            <input type="email" id="email" name="email">

            <label for="phone" id="phoneLabel">Phone</label>
            <input type="text" id="phone" name="phone">

            <label for="roles" id="rolesLabel">Role:</label>
            <select id="roles" name="roles">
                <option value="ROLE_USER" id="userLabel">User</option>
                <option value="ROLE_ADMIN" id="adminLabel">Admin</option>
            </select>
        <button type="submit" class="btn btn-primary">Register</button>
    </form>

    <p>Already have an account? <a href="login">Log in</a></p>
</div>
</body>
</html>