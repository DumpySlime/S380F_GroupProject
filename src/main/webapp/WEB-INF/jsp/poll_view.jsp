<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Poll Support</title>
</head>
<body>
<!--update the security requirement as needed-->
<security:authorize acces="hasRole('ADMIN')">
    [<a href="<c:url value="/poll/edit/${poll.pollId}" />">Edit</a>]
</security:authorize>
<!--update the security requirement as needed-->
<security:authorize acces="hasRole('ADMIN')">
    [<a href="<c:url value="/poll/delete/${poll.pollId}" />">Delete</a>]
</security:authorize>
<br/><br/>

<h2><c:out value="${poll.question}"/></h2>
<i>Author - <c:out value="${poll.author}" /></i><br/>
<i>Vote count: <c:out value="${pollService.getTotalVotes()}"/></i><br/><br/>

<form:form method="POST" enctype="multipart/form-data" modelAttribute="poll">
    A) <form:radiobutton path="optionA" value="${poll.optionA}"/><br/>
    B) <form:radiobutton path="optionB" value="${poll.optionB}"/><br/>
    C) <form:radiobutton path="optionC" value="${poll.optionC}"/><br/>
    D) <form:radiobutton path="optionD" value="${poll.optionD}"/><br/>
</form:form>
<!--
<form action="<c:url value="poll/vote/${pollId}" />" method = "POST">
    <div>
        <input type="radio" name="choice" value="${poll.optionA}" id="poll.optionAId">
        <label for="poll.optionAId">A) ${poll.optionA}</label>
    </div>
    <div>
        <input type="radio" name="choice" value="${poll.optionB}" id="poll.optionBId">
        <label for="poll.optionBId">B) ${poll.optionB}</label>
    </div>
    <div>
        <input type="radio" name="choice" value="${poll.optionC}" id="poll.optionCId">
        <label for="poll.optionCId">C) ${poll.optionC}</label>
    </div>
    <div>
        <input type="radio" name="choice" value="${poll.optionD}" id="poll.optionDId">
        <label for="poll.optionDId">D) ${poll.optionD}</label>
    </div>
    <input type="submit" value="Submit"/>
</form>
-->
<p>Comment: <c:out value="${poll.comment}"/></p>
<input type="submit" value="Submit"/>
</body>
</html>
