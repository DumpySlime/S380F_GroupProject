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
<security:authorize access="hasRole('ADMIN')">
    <a href="<c:url value="/lecture/create"/>">Create Note</a><br/><br/>
</security:authorize>
<c:choose>
    <c:when test="${fn:length(lectureDatabase) == 0}">
        <i>There is no lecture</i>
    </c:when>
    <c:otherwise>
        <c:forEach items="${lectureDatabase}" var="entry">
            Note ${entry.id}:
            <a href="<c:url value="/lecture/view/${entry.id}" />">
                <c:out value="${entry.name}"/></a>
            <!--update the security requirement as needed-->
            <security:authorize access="hasRole('ADMIN')">
                [<a href="<c:url value="/lecture/edit/${lecture.id}" />">Edit</a>]
            </security:authorize>
            [<a href="<c:url value="/lecture/edit/${entry.lectureId}" />">Edit</a>]
            [<a href="<c:url value="/lecture/delete/${entry.lectureId}" />">Delete</a>]
            <br/>
        </c:forEach>
    </c:otherwise>
</c:choose>

<h2>Polls</h2>

<a href="<c:url value="/poll/create" />">Create Poll</a><br/><br/>
<c:choose>
    <c:when test="${fn:length(pollDatabase) == 0}">
        <i>There is no poll</i>
    </c:when>
    <c:otherwise>
        <c:forEach items="${pollDatabase}" var="entry">
            Poll ${entry.id}:
            <a href="<c:url value="/poll/view/${entry.id}" />">
                <c:out value="${entry.question}"/></a>
            (author: <c:out value="${entry.author}"/>)
            <!--update the security requirement as needed-->
            <security:authorize access="hasRole('ADMIN')">
                [<a href="<c:url value="/poll/edit/${entry.pollId}" />">Edit</a>]
            </security:authorize>
            <!--update the security requirement as needed-->
            <security:authorize access="hasRole('ADMIN')">
                [<a href="<c:url value="/poll/delete/${entry.pollId}" />">Delete</a>]
            </security:authorize>
            <br/>
        </c:forEach>
    </c:otherwise>
</c:choose>
</body>
</html>
