<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Poll Support</title>
</head>
<body>
<!--update the security requirement as needed-->
    [<a href="<c:url value="/course/poll/edit/${poll.id}" />">Edit</a>]

<!--update the security requirement as needed-->
    [<a href="<c:url value="/course/poll/delete/${poll.id}" />">Delete</a>]

<br/><br/>

<h2><c:out value="${poll.question}"/></h2>
<!--<i>Vote count: <c:out value="${pollService.getTotalVotes()}"/></i><br/><br/>-->

<form:form method="POST" enctype="multipart/form-data" modelAttribute="poll">
    A) <form:radiobutton path="selectedOption" value="${poll.optionA}" /><br/>
    B) <form:radiobutton path="selectedOption" value="${poll.optionB}" /><br/>
    C) <form:radiobutton path="selectedOption" value="${poll.optionC}" /><br/>
    D) <form:radiobutton path="selectedOption" value="${poll.optionD}" /><br/>

    <p>Comment: <c:out value="${poll.comment}"/></p>
    <input type="submit" value="Submit"/>
</form:form>
<a href="<c:url value="/course/index" />">Return to course page</a>
</body>
</html>
