<!DOCTYPE html>
<html>
<head>
    <title>Teacher Support</title>
</head>
<body>
<h2>Create Lecture</h2>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="lectureForm">
    <form:label path="lectureTitle">Lecture title</form:label><br/>
    <form:input type="text" path="lectureTitle"/><br/><br/>
    <form:label path="comment">Comment</form:label><br/>
    <form:textarea path="comment" rows="5" cols="30"/><br/><br/>
    <b>Add Notes</b><br/>
    <input type="file" name="notes" multiple="multiple"/><br/><br/>
    <input type="submit" value="Submit"/>
</form:form>
</body>
</html>
