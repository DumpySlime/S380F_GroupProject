<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Poll</title>
</head>
<body>
<h2>Poll #${pollId}: <c:out value="${poll.pollQuestion}"/></h2>
<i>Author - <c:out value="${poll.pollAuthor}" /></i><br/><br/>
<div>
    <input type="radio" name="choice" value="poll.option1" id="poll.option1Id">
    <label for="poll.option1Id">A) ${poll.option1}</label>
</div>
<div>
    <input type="radio" name="choice" value="poll.option1" id="poll.option2Id">
    <label for="poll.option2Id">B) ${poll.option2}</label>
</div>
<div>
    <input type="radio" name="choice" value="poll.option1" id="poll.option3Id">
    <label for="poll.option3Id">C) ${poll.option3}</label>
</div>
<div>
    <input type="radio" name="choice" value="poll.option1" id="poll.option4Id">
    <label for="poll.option4Id">D) ${poll.option4}</label>
</div>
<a href="<c:url value="poll/pollList" />">Submit</a>
</body>
</html>
