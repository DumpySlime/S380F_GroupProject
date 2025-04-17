<html>
<head>
    <title>User Support</title>
</head>
<body>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="userForm">
  <h3>Username: ${user.username}</h3>
  <form:label path="password">password:</form:label><br/>
  <form:input type="password" path="password"/><br/><br/>

  <form:label path="fullName">fullname:</form:label><br/>
  <form:input type="text" path="fullName"/><br/><br/>

  <form:label path="email">email</form:label><br/>
  <form:input type="text" path="email"/><br/><br/>

  <form:label path="phone">phone:</form:label><br/>
  <form:input type="text" path="phone"/><br/><br/>

  <br/>
  <input type="submit" value="Save"/>
</form:form>
<a href="<c:url value="/index" />">Return to course page</a>
</body>
</html>
