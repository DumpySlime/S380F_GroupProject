<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 4/5/2025
  Time: 5:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Teacher Support</title>
</head>
<body>
<h2>Edit Lecture: ${lecture.id}</h2>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="lectureForm">
    <form:label path="lectureTitle">Lecture Title</form:label><br/>
    <form:input type="text" path="lectureTitle"/><br/><br/>
    <form:label path="comment">Comment</form:label><br/>
    <form:textarea path="comment" rows="5" cols="30"/><br/><br/>
    <b>Add more Lecture Notes</b><br/>
    <input type="file" name="notes" multiple="multiple"/><br/><br/>
    <input type="submit" value="Save"/>
</form:form>
<a href="<c:url value="/course/index" />">Return to course page</a>
</body>
</html>

</body>
</html>
