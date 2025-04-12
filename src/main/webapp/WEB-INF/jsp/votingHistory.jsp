<html>
<head>
    <title>Polling History</title>
</head>
<body>
<h2>Your Voting History</h2>
<c:choose>
    <c:when test="${fn:length(votingHistory) == 0}">
        <i>There is no history of voting</i><br/>
    </c:when>
    <c:otherwise>
        <c:forEach items="${votingHistory}" var="vote">
            <c:if test="${vote.poll.deleted}">
                <p>Poll Deleted</p>
            </c:if>
            <p>Vote id: ${vote.id}</p><br/>
            Time voted: ${vote.createTime}<br/>
            Poll Author: ${vote.poll.teacherName}<br/>
            Total Votes: ${fn:length(vote.poll.votes)}<br/>
            Poll Question: ${vote.poll.question}<br/>
            A: ${vote.poll.optionAText}<br/>
            B: ${vote.poll.optionBText}<br/>
            C: ${vote.poll.optionCText}<br/>
            D: ${vote.poll.optionDText}<br/>
            Your Answer: ${vote.choice}<br/>
            <hr/>
        </c:forEach>
    </c:otherwise>
</c:choose>
<a href="<c:url value="/"/>">Return to course page</a>
</body>
</html>