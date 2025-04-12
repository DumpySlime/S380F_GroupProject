<!DOCTYPE html>
<html>
<head>
    <title>Teacher Support</title>
</head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<h2>Create Lecture</h2>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="lectureForm">
    <form:label path="lectureTitle">Lecture title</form:label><br/>
    <form:input type="text" path="lectureTitle"/><br/><br/>
    <form:label path="body">Body</form:label><br/>
    <form:textarea path="body" rows="5" cols="30"/><br/><br/>
    <b>Add Notes</b><br/>
    <input type="file" name="notes" multiple="multiple"/><br/><br/>
    <input type="submit" value="Submit"/>
</form:form>
<a href="<c:url value="/courseUser/list" />">Return to course page</a>
</body>
</html>
