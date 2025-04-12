<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <style>
        .error{
            color:red;
            font-weight: bold;
            display: block;
        }
    </style>
    <link href="css/bootstrap.css" rel="stylesheet">
</head>

<div class="container mt-5">
    <h2 class="text-center">Register</h2>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <c:if test="${not empty success}">
        <div class="alert alert-success">${success}</div>
    </c:if>

    <form:form action="/register" method="post" modelAttribute="lectureUser">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="mb-3">
            <form:label path="username" id="unameLabel">Username:</form:label><br/>
            <form:errors path="username" cssClass="error"/>
            <form:input id="username" path="username" />
        </div>
        <div class="mb-3">
            <form:label path="password" id="passwordLabel">Password:</form:label><br/>
            <form:errors path="password" cssClass="error"/>
            <form:input id="password" type="password" path="password" />
        </div>
        <div class="mb-3">
        <form:label path="confirmPassword">Confirm Password</form:label><br/>
        <form:errors path="confirmPassword" cssClass="error"/>
        <form:input type="password" path="confirmPassword"/><br/><br/>
        </div>
        <div class="mb-3">
            <form:label path="fullName" id="fullNameLabel">Full Name:</form:label><br/>
            <form:input id="fullName" path="fullName"/>
        </div>
            <form:label path="email" id="emailLabel">Email:</form:label><br/>
            <form:input id="email" path="email"/>
        <div class="mb-3">
            <form:label path="phone" id="phoneLabel">Phone:</form:label><br/>
            <form:input id="phone" path="phone"/>
        </div>
        <div class="mb-3">
            <form:label path="roles">Roles:</form:label><br/>
            <form:errors path="roles" cssClass="error" />
            <form:checkbox path="roles" value="ROLE_USER"/>Role_USER
            <form:checkbox path="roles" value="ROLE_ADMIN"/>Role_ADMIN
        </div>
        <input type="submit" value="Register"></>
    </form:form>
    <p>Already have an account? <a href="login">Log in</a></p>
</div>
</html>