<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course Management</title>
</head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<h2>Online Course Website</h2>

<h2>Lectures</h2>
<!--update the security requirement as needed-->
    <a href="<c:url value="/course/lecture/create"/>">Create Lecture</a><br/><br/>
<c:choose>
    <c:when test="${fn:length(lectureDatabase) == 0}">
        <i>There is no lecture</i>
    </c:when>
    <c:otherwise>
        <c:forEach items="${lectureDatabase}" var="entry">
            Note ${entry.id}:
            <a href="<c:url value="/course/lecture/view/${entry.id}" />">
                <c:out value="${entry.lectureTitle}"/></a>
            [<a href="<c:url value="/course/lecture/edit/${entry.id}" />">Edit</a>]
            [<a href="<c:url value="/course/lecture/delete/${entry.id}" />">Delete</a>]
            <br/>
        </c:forEach>
    </c:otherwise>
</c:choose>

<h2>Polls</h2>
<!--update the security requirement as needed-->
<a href="<c:url value="/course/poll/create" />">Create Poll</a><br/><br/>
<c:choose>
    <c:when test="${fn:length(pollDatabase) == 0}">
        <i>There is no poll</i>
    </c:when>
    <c:otherwise>
        <c:forEach items="${pollDatabase}" var="entry">
            Poll ${entry.id}:
            <a href="<c:url value="/course/poll/view/${entry.id}" />">
                <c:out value="${entry.question}"/></a>
            <!--update the security requirement as needed-->
                [<a href="<c:url value="/course/poll/edit/${entry.id}" />">Edit</a>]
                [<a href="<c:url value="/course/poll/delete/${entry.id}" />">Delete</a>]
            <br/>
        </c:forEach>
    </c:otherwise>
</c:choose>
</body>
</html>
