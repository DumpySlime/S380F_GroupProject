
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Poll</title>
</head>
<body>
<h2>Create a Poll</h2>
<form:form method="POST" modelAttribute="pollForm">
  <form:label path="question">Question</form:label><br/>
  <form:input type="text" path="question"/><br/><br/>
  <form:label path="author">Author</form:label><br/>
  <form:input type="text" path="author"/><br/><br/>
  <form:label path="option1">Option 1</form:label><br/>
  <form:input type="text" path="option1"/><br/><br/>
  <form:label path="option2">Option 2</form:label><br/>
  <form:input type="text" path="option2"/><br/><br/>
  <form:label path="option3">Option 3</form:label><br/>
  <form:input type="text" path="option3"/><br/><br/>
  <form:label path="option4">Option 4</form:label><br/>
  <form:input type="text" path="option4"/><br/><br/>
  <form:label path="comment">Comment</form:label><br/>
  <form:textarea path="comment" rows="5" cols="30"/><br/><br/>
<input type="submit" value="Submit"/>
</form:form>
</body>
</html>
