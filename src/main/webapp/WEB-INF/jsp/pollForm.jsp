<html>
<head>
    <title>Poll Support</title>
</head>
<body>
<security:authorize access="hasRole('ADMIN') or principal.username == '${poll.teacherName}'">
    <a href="<c:url value="/index/poll/edit/${poll.id}" />">Edit</a>
</security:authorize>

<h2>${poll.question}</h2>
<form:form action="/index/poll/vote/${poll.id}" method="post" modelAttribute="voteForm">
    <form:radiobutton path="choice" value="A"/>A ${poll.optionAText} (${choiceACount})<br/>
    <form:radiobutton path="choice" value="B"/>B ${poll.optionBText} (${choiceBCount})<br/>
    <form:radiobutton path="choice" value="C"/>C ${poll.optionCText} (${choiceCCount})<br/>
    <form:radiobutton path="choice" value="D"/>D ${poll.optionDText} (${choiceDCount})<br/>
    <input type="submit" value="Submit"/>
</form:form>

<!-- Add Comment for every Users -->
<security:authorize access="isAuthenticated()">
    <h3>Add a Comment</h3>
    <form:form action="/index/poll/vote/${poll.id}/comments/addComment" method="post">
        <textarea name="context" rows="4" cols="50" required></textarea><br>
        <button type="submit">Submit Comment</button>
    </form:form>
</security:authorize>

<!-- Display Comments -->
<h3>Comments</h3>
<c:forEach items="${comments}" var="comment">
    <p><strong>${comment.username}</strong> (${comment.createTime}):</p>
    <!-- Delete Comment -->
    <security:authorize access="hasRole('ADMIN') or principal.username == '${poll.teacherName}'">
        <form:form action="/index/poll/vote/${pollId}/comments/deleteComment/${comment.id}" method="post">
            <button type="submit">Delete</button>
        </form:form>
    </security:authorize>
    <p>${comment.context}</p>
    <hr>
</c:forEach>
<a href="<c:url value="/index"/>">Return to course page</a>
</body>
</html>