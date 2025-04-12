<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head><title>Customer Support</title></head>
<style>
  .error{
    color: red;
    font-weight: bold;
    display: block;
  }
</style>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
  <input type="submit" value="Log out"/>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<h2>Create a User</h2>
<form:form method="POST" modelAttribute="lectureUser">
  <form:label path="username">Username</form:label><br/>
  <form:errors path="username" cssClass="error"/>
  <form:input type="text" path="username"/><br/><br/>

  <form:label path="password">Password</form:label><br/>
  <form:errors path="password" cssClass="error"/>
  <form:input type="text" path="password"/><br/><br/>

  <form:label path="confirmPassword">Confirm Password</form:label><br/>
  <form:errors path="confirmPassword" cssClass="error"/>
  <form:input type="text" path="confirmPassword"/><br/><br/>

  <form:label path="fullName">Fullname</form:label><br/>
  <form:input type="text" path="fullName"/><br/><br/>

  <form:label path="email">Email</form:label><br/>
  <form:input type="email" path="email"/><br/><br/>

  <form:label path="phone">Phone</form:label><br/>
  <form:input type="phone" path="phone"/><br/><br/>

  <form:label path="roles">Roles</form:label><br/>
  <form:errors path="roles" cssClass="error" />
  <form:checkbox path="roles" value="ROLE_USER"/>ROLE_USER
  <form:checkbox path="roles" value="ROLE_ADMIN"/>ROLE_ADMIN
  <br/><br/>
  <input type="submit" value="Add User"/>
</form:form>
</body>
</html>