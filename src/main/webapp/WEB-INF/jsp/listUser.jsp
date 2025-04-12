<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Support User Management</title>
</head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
  <input type="submit" value="Log out" />
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<br/>
<br/>

<a href="<c:url value="/index" />">Return to course list</a>

<h2>User Management System</h2>
<security:authorize access="hasRole('ADMIN')">
  <a href="<c:url value="/courseUser/create" />">Create a User</a><br/><br/>
</security:authorize>

<c:choose>
  <c:when test="${fn:length(lectureUsers) == 0}">
    <i>There are no users in the system.</i>
  </c:when>
  <c:otherwise>

    <security:authorize access="hasRole('ADMIN') and hasRole('USER')">
    <table>
      <tr>
        <th>Username</th>
        <th>Full Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Roles</th>
        <th>Action</th>
      </tr>
      <c:forEach  var="cUser" items="${lectureUsers}">
        <tr>
          <td>${cUser.username}</td>
          <td>${cUser.fullName}</td>
          <td>${cUser.email}</td>
          <td>${cUser.phone}</td>
          <td>
            <c:forEach items="${cUser.roles}" var="role" varStatus="status">
              <c:if test="${!status.first}">, </c:if>
              ${role.role}
            </c:forEach>
          </td>
          <td>
            [<a href="<c:url value='/courseUser/edit/${cUser.username}' />">Edit</a>]
            [<a href="<c:url value='/courseUser/delete/${cUser.username}' />">Delete</a>]
          </td>
        </tr>
      </c:forEach>
    </table>
    </security:authorize>

    <!-- User Table -->
    <security:authorize access="hasRole('USER') and !hasRole('ADMIN')">
      <h3>Your Information</h3>
      <table>
        <tr>
          <th>Username</th>
          <th>Full Name</th>
          <th>Email</th>
          <th>Phone</th>
          <th>Roles</th>
          <th>Action</th>
        </tr>
        <c:forEach var="cUser" items="${lectureUsers}">
          <c:if test="${cUser.username == currentUser.username}">
            <tr>
              <td>${cUser.username}</td>
              <td>${cUser.fullName}</td>
              <td>${cUser.email}</td>
              <td>${cUser.phone}</td>
              <td>
                <c:forEach items="${cUser.roles}" var="role" varStatus="status">
                  <c:if test="${!status.first}">, </c:if>
                  ${role.role}
                </c:forEach>
              </td>
              <td>
                [<a href="<c:url value='/courseUser/edit/${cUser.username}' />">Edit</a>]
              </td>
            </tr>
          </c:if>
        </c:forEach>
      </table>
    </security:authorize>

  </c:otherwise>
</c:choose>
</body>
</html>
