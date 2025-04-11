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

<h2>Users</h2>
<a href="<c:url value="/courseUser/create" />">Create a User</a><br/><br/>
<c:choose>
  <c:when test="${fn:length(lectureUsers) == 0}">
    <i>There are no users in the system.</i>
  </c:when>
  <c:otherwise>
    <table>
      <tr>
        <th>Username</th><th>Password</th><th>Roles</th><th>Action</th>
      </tr>
      <c:forEach  var="cUser" items="${lectureUsers}">
        <tr>
          <td>${cUser.username}</td>
          <td>${fn:substringAfter(cUser.password, '{noop}')}</td>
          <td>
            <c:forEach items="${cUser.roles}" var="role" varStatus="status">
              <c:if test="${!status.first}">, </c:if>
              ${role.role}
            </c:forEach>
          </td>
          <td>
            [<a href="<c:url value="/courseUser/delete/${cUser.username}" />">Delete</a>]
          </td>
        </tr>
      </c:forEach>
    </table>
  </c:otherwise>
</c:choose>
</body>
</html>
