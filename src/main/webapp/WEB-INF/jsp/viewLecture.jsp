<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Teacher Support</title>
</head>
<body>
<!--update the security requirement as needed-->
    [<a href="<c:url value="/index/lecture/edit/${lecture.id}" />">Edit</a>]

<!--update the security requirement as needed-->
    [<a href="<c:url value="/index/lecture/delete/${lecture.id}" />">Delete</a>]

<br/><br/>
<h2>Lecture #${lectureId}: <c:out value="${lecture.lectureTitle}"/></h2><br/>
<h2>Body:${lecture.body}</h2>
<c:if test="${!empty lecture.notes}">
    <h2>Notes:</h2>
    <c:forEach items="${lecture.notes}" var="note" varStatus="status">
        <a href="<c:url value="/index/lecture/${lectureId}/note/${note.id}"/>">
            <c:out value="${note.name}"/></a>
        <!--update the security requirement as needed-->
            [<a href="<c:url value="/index/lecture/${lectureId}/delete/${note.id}" />">Delete</a>]
    </c:forEach><br/><br/>
</c:if>

<!-- Display Comments -->
<!-- registered user add Comment here-->
<h3>${comments.size()} Comments</h3>
<security:authorize access="isAuthenticated()">
    <form:form action="/index/lecture/view/${lecture.id}/comments/addComment" method="post">
        <textarea name="context" rows="1" cols="50" placeholder="Add a comment..." required></textarea><br>
        <button type="submit">Comment</button>
    </form:form>
</security:authorize>
<c:forEach items="${comments}" var="comment">
    <p><strong>${comment.username}</strong> (${comment.createTime}):</p>
    <p>${comment.context}</p>    <!-- Delete Comment -->
    <form:form action="/index/lecture/view/${lectureId}/comments/deleteComment/${comment.id}" method="post">
        <button type="submit">Delete</button>
    </form:form>

    <hr>
</c:forEach>
<a href="<c:url value="/index"/>">Return to course page</a>
</body>
</html>
