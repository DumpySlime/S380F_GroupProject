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
    <title>Teacher Support</title>
</head>
<body>
<!--update the security requirement as needed-->
    [<a href="<c:url value="/course/ticket/edit/${lecture.id}" />">Edit</a>]

<!--update the security requirement as needed-->
    [<a href="<c:url value="/course/ticket/delete/${lecture.id}" />">Delete</a>]

<br/><br/>
<h2>Note #${lectureId}: <c:out value="${lecture.lectureTitle}"/></h2><br/>
Comment<br/>
<c:out value="${lecture.comment}"/>
<c:if test="${!empty lecture.notes}">
    Notes: <br/>
    <c:forEach items="${lecture.notes}" var="note" varStatus="status">
        <a href="<c:url value="/course/lecture/${lectureId}/note/${note.id}"/>">
            <c:out value="${note.name}"/></a>
        <!--update the security requirement as needed-->
            [<a href="<c:url value="/lecture/${lectureId}/delete/${note.id}" />">Delete</a>]
    </c:forEach><br/><br/>
</c:if>
<a href="<c:url value="/course/index"/>">Return to course page</a>
</body>
</html>
