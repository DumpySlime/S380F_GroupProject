<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 4/5/2025
  Time: 4:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
</body>
</html>
