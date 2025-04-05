<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 4/5/2025
  Time: 4:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Note Support</title>
</head>
<body>
<!--update the security requirement as needed-->
<security:authorize access="hasRole('ADMIN')">
    [<a href="<c:url value="/ticket/edit/${lecture.id}" />">Edit</a>]
</security:authorize>
<!--update the security requirement as needed-->
<security:authorize access="hasRole('ADMIN')">
    [<a href="<c:url value="/ticket/delete/${lecture.id}" />">Delete</a>]
</security:authorize>
<br/><br/>
<h2>Note #${lectureId}: <c:out value="${lecture.title}"/></h2><br/>
Comment<br/>
<c:out value="${lecture.comment}"/>
<c:if test="${!empty lecture.notes}">
    Notes: <br/>
    <c:forEach items="${lecture.notes}" var="note" varStatus="status">
        <a href="<c:url value="/lecture/${lectureId}/note/${note.id}"/>">
            <c:out value="${note.name}"/></a>
        <!--update the security requirement as needed-->
        <security:authorize access="hasRole('ADMIN')">
            [<a href="<c:url value="/lecture/${lectureId}/delete/${note.id}" />">Delete</a>]
        </security:authorize>
    </c:forEach><br/><br/>
</c:if>
<a href="<c:url value="/lecture"/>">Return to lecture page</a>
</body>
</html>
