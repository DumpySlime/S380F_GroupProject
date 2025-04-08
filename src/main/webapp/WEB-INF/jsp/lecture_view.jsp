<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Teacher Support</title>
</head>
<body>
<!--update the security requirement as needed-->
    [<a href="<c:url value="/course/lecture/edit/${lecture.id}" />">Edit</a>]

<!--update the security requirement as needed-->
    [<a href="<c:url value="/course/lecture/delete/${lecture.id}" />">Delete</a>]

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
