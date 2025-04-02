<html>
<head>
    <title>Teacher Support</title>
</head>
<body>
<h2>Course #${courseId}: <c:out value="${course.courseName}"/> <c:out value="${course.lectureTitle}"/></h2>
[<a href="<c:url value="/course/delete/${course.id}" />">Delete</a>]<br/><br/>
<i>Customer Name - <c:out value="${course.teacherName}"/></i><br/><br/>
<c:out value="${course.comment}"/><br/><br/>
<c:if test="${!empty course.lectures}">
    Lectures Note:
    <c:forEach items="${course.lectures}" var="lecture" varStatus="status">
        <c:if test="${!status.first}">, </c:if>
        <a href="<c:url value="/course/${courseId}/lecture/${lecture.id}" />">
            <c:out value="${lecture.name}"/></a>
        [<a href="<c:url value="/course/${courseId}/delete/${course.id}" />">Delete</a>]
    </c:forEach><br/><br/>
</c:if>
<a href="<c:url value="/course" />">Return to list tickets</a>
</body>
</body>
</html>
