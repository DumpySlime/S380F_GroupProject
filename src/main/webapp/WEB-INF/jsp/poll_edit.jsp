
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<!--update the security requirement as needed-->
    [<a href="<c:url value="/poll/edit/${pollId}" />">Edit</a>]
<!--update the security requirement as needed-->
    [<a href="<c:url value="/poll/delete/${pollId}" />">Delete</a>]
<br/><br/>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="poll">
<h2><c:out value="${poll.question}"/></h2><br/>
<!--<i>Vote count: <c:out value="${pollService.getTotalVotes()}"/></i><br/><br/>-->

    A) <form:radiobutton path="optionA" value="${poll.optionA}"/><br/>
    B) <form:radiobutton path="optionB" value="${poll.optionB}"/><br/>
    C) <form:radiobutton path="optionC" value="${poll.optionC}"/><br/>
    D) <form:radiobutton path="optionD" value="${poll.optionD}"/><br/>
</form:form>
</body>
</html>
