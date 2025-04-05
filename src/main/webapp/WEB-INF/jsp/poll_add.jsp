
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Teacher Support</title>
</head>
<body>
<h2>Create a Poll</h2>
<form:form method="POST" modelAttribute="pollForm">
  <form:label path="question">Question</form:label><br/>
  <form:input type="text" path="question"/><br/><br/>
  <form:label path="optionA">Option A</form:label><br/>
  <form:input type="text" path="optionA"/><br/><br/>
  <form:label path="optionB">Option B</form:label><br/>
  <form:input type="text" path="optionB"/><br/><br/>
  <form:label path="optionC">Option C</form:label><br/>
  <form:input type="text" path="optionC"/><br/><br/>
  <form:label path="optionD">Option D</form:label><br/>
  <form:input type="text" path="optionD"/><br/><br/>
  <form:label path="comment">Comment</form:label><br/>
  <form:textarea path="comment" rows="5" cols="30"/><br/><br/>
<input type="submit" value="Submit"/>
</form:form>
</body>
</html>
