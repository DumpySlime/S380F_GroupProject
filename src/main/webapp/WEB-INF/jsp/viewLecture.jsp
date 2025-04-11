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
<h2>Note #${lectureId}: <c:out value="${lecture.lectureTitle}"/></h2><br/>
<c:if test="${!empty lecture.notes}">
    Notes: <br/>
    <c:forEach items="${lecture.notes}" var="note" varStatus="status">
        <a href="<c:url value="/index/lecture/${lectureId}/note/${note.id}"/>">
            <c:out value="${note.name}"/></a>
        <!--update the security requirement as needed-->
            [<a href="<c:url value="/index/lecture/${lectureId}/delete/${note.id}" />">Delete</a>]
    </c:forEach><br/><br/>
</c:if>

<!-- Add Comment for every Users -->
<security:authorize access="isAuthenticated()">
    <h3>Add a Comment</h3>
    <form:form action="/index/lecture/view/${lecture.id}/comments/addComment" method="post">
        <textarea name="context" rows="4" cols="50" required></textarea><br>
        <button type="submit">Submit Comment</button>
    </form:form>
</security:authorize>

<!-- Display Comments -->
<h3>Comments</h3>
<c:forEach items="${comments}" var="comment">
    <p><strong>${comment.username}</strong> (${comment.createTime}):</p>
    <!-- Delete Comment -->
    <form:form action="/index/lecture/view/${lectureId}/comments/deleteComment/${comment.id}" method="post">
        <button type="submit">Delete</button>
    </form:form>

    <p>${comment.context}</p>
    <hr>
</c:forEach>
<a href="<c:url value="/index"/>">Return to course page</a>
</body>
</html>
