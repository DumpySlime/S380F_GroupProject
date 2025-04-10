<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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

<a href="<c:url value='/courseUser'/>">Manage User Accounts</a><br /><br />
<h2>Lectures</h2>
<!--update the security requirement as needed-->
    <a href="<c:url value="/index/lecture/create"/>">Create Lecture</a><br/><br/>
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
            <security:authorize access="hasRole('ADMIN') or
                principal.username=='${entry.teacherName}'">
                [<a href="<c:url value="/index/lecture/edit/${entry.id}" />">Edit</a>]
            </security:authorize>
            <security:authorize access="hasRole('ADMIN')">
                [<a href="<c:url value="/index/lecture/delete/${entry.id}" />">Delete</a>]
            </security:authorize>
            <br/>
        </c:forEach>
    </c:otherwise>
</c:choose>
</body>
</html>
