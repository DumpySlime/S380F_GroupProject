<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Poll Support</title>
</head>
<body>
<security:authorize access="isAuthenticated() && (hasRole('ADMIN') or principal.username == '${poll.teacherName}')">
    <a href="<c:url value="/index/poll/edit/${poll.id}" />">Edit</a>
</security:authorize>

<h2>${poll.question}</h2>
A ${poll.optionAText} (${choiceACount})<br/>
B ${poll.optionBText} (${choiceBCount})<br/>
C ${poll.optionCText} (${choiceCCount})<br/>
D ${poll.optionDText} (${choiceDCount})<br/>
<!-- Display Comments -->
<!-- registered user add Comment here-->
<h3>${comments.size()} Comments</h3>
    <security:authorize access="isAuthenticated()">
        <form:form action="/index/poll/vote/${poll.id}/comments/addComment" method="post">
            <textarea name="context" rows="1" cols="50" placeholder="Add a comment..." required></textarea><br>
            <button type="submit">Comment</button>
        </form:form>
    </security:authorize>
<c:forEach items="${comments}" var="comment">
    <p><strong>${comment.username}</strong> (${comment.createTime}):</p>
    <!-- Delete Comment -->
    <security:authorize access="isAuthenticated() && (hasRole('ADMIN') or principal.username == '${poll.teacherName}')">
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