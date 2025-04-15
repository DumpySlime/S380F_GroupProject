<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course Management</title>
</head>
<security:authorize access="isAuthenticated()">
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</security:authorize>
<!--for public-->
<security:authorize access="!isAuthenticated()">
    <c:url var="loginUrl" value="/login"/>
    <form action="${loginUrl}" method="post">
        <input type="submit" value="Log in" />
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</security:authorize>

<h2>Online Course Website</h2><br/>
<security:authorize access="isAuthenticated()">
    <a href="<c:url value='/index/votinghistory'/>">Voting History</a><br/>
    <a href="<c:url value='/index/commenthistory'/>">Comment History</a><br/><br/>
    <a href="<c:url value='/courseUser'/>">Manage User Accounts</a><br /><br />
</security:authorize>
<!-- Display lectures-->
<h2>Lectures</h2>
<security:authorize access="isAuthenticated() && hasRole('ADMIN')">
    <a href="<c:url value="/index/lecture/create"/>">Create Lecture</a><br/><br/>
</security:authorize>
<c:choose>
    <c:when test="${fn:length(lectureDatabase) == 0}">
        <i>There is no lecture</i>
    </c:when>
    <c:otherwise>
        <c:forEach items="${lectureDatabase}" var="entry">
            Note ${entry.id}:
            <a href="<c:url value="/index/lecture/view/${entry.id}" />">
                <c:out value="${entry.lectureTitle}"/></a>
            <!-- Edit-->
            <security:authorize access="isAuthenticated() && (hasRole('ADMIN') or
                principal.username=='${entry.teacherName}')">
                [<a href="<c:url value="/index/lecture/edit/${entry.id}" />">Edit</a>]
            </security:authorize>
            <security:authorize access="isAuthenticated() && hasRole('ADMIN')">
                [<a href="<c:url value="/index/lecture/delete/${entry.id}" />">Delete</a>]
            </security:authorize>
            <br/>
        </c:forEach>
    </c:otherwise>
</c:choose>

<!-- Display poll page -->
<h2>Polls</h2>
<security:authorize access="isAuthenticated() && hasRole('ADMIN')">
    <a href="<c:url value="/index/poll/create"/>">Create Poll</a><br/><br/>
</security:authorize>
<c:choose>
    <c:when test="${fn:length(pollDatabase) == 0}">
        <i>There is no poll</i>
    </c:when>
    <c:otherwise>
        <c:forEach items="${pollDatabase}" var="entry">
            Poll ${entry.id}:
            <security:authorize access="isAuthenticated()">
            <a href="<c:url value="/index/poll/vote/${entry.id}" />">
                <c:out value="${entry.question}"/></a>
            </security:authorize>
            <!--link for public-->
            <security:authorize access="!isAuthenticated()">
                <a href="<c:url value="/index/poll/view/${entry.id}" />">
                    <c:out value="${entry.question}"/></a>
            </security:authorize>

            <!-- Edit -->
            <security:authorize access="isAuthenticated() && (hasRole('ADMIN') or
                principal.username=='${entry.teacherName}')">
                [<a href="<c:url value="/index/poll/edit/${entry.id}" />">Edit</a>]
            </security:authorize>
            <security:authorize access="isAuthenticated() && hasRole('ADMIN')">
                [<a href="<c:url value="/index/poll/delete/${entry.id}" />">Delete</a>]
            </security:authorize>
            <br/>
        </c:forEach>
    </c:otherwise>
</c:choose>
</body>
</html>
