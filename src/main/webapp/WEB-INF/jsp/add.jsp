<!DOCTYPE html>
<html>
<head>
    <title>Teacher Support</title>
</head>
<body>
<h2>Create a Course</h2>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="courseForm">
    <form:label path="teacherName">Teacher Name</form:label><br/>
    <form:input type="text" path="teacherName"/><br/><br/>
    <form:label path="courseName">Course Name</form:label><br/>
    <form:input type="text" path="courseName"/><br/><br/>
    <form:label path="lectureTitle">Lecture Title</form:label><br/>
    <form:input type="text" path="lectureTitle"/><br/><br/>
    <form:label path="Comment">Comment</form:label><br/>
    <form:textarea path="comment" rows="5" cols="30"/><br/><br/>
    <b>Lecture Notes</b><br/>
    <input type="file" name="lectures" multiple="multiple"/><br/><br/>
    <input type="submit" value="Submit"/>
</form:form>
</body>
</html>
