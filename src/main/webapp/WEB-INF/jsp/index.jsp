<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Online Course Website</h2>
<a href="<c:url value="/course/create" />">Create a course</a><br/><br/>
<c:choose>
    <c:when test="${fn:length(courseDatabase) == 0}">
        <i>There are no courses in the system.</i>
    </c:when>
    <c:otherwise>
        <c:forEach items="${courseDatabase}" var="entry">
            Course ${entry.courseName}:
            <a href="<c:url value="/course/course_material/${entry.id}" />">
                <c:out value="${entry.lectureTitle}"/></a>
            (teacher: <c:out value="${entry.teacherName}"/>)
            [<a href="<c:url value="/course/delete/${entry.id}" />">Delete</a>]<br />
        </c:forEach>
    </c:otherwise>
</c:choose>
</body>
</html>
