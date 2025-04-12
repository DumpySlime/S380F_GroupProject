<html>
<head>
    <title>Comment History</title>
</head>
<body>
<h2>Your Comment History</h2>
<c:choose>
    <c:when test="${fn:length(commentHistory) == 0}">
        <i>There is no history of comment</i><br/>
    </c:when>
    <c:otherwise>
        <c:forEach items="${commentHistory}" var="comment">
            <c:if test="${comment.deleted}">
                <p>Comment Deleted</p>
            </c:if>
            <p>Comment id: ${comment.id}</p><br/>
            Time commented: ${comment.createTime}<br/>
            <!--Determine the comment source by checking whether Lecture object or Poll object is empty-->
            Comment From:
            <c:choose>
                <c:when test="${empty comment.lecture}">
                    Lecture
                </c:when>
                <c:otherwise>
                    Poll
                </c:otherwise>
            </c:choose>
            <br/>
            Comment: ${comment.context}<br/>
            <hr/>
        </c:forEach>
    </c:otherwise>
</c:choose>
<a href="<c:url value="/"/>">Return to course page</a>
</body>
</html>