<!DOCTYPE html>
<html>
<head>
    <title>Teacher Support</title>
</head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<h2>Create Poll</h2>
<form:form method="POST" modelAttribute="pollForm">
    <form:label path="question">Question</form:label><br/>
    <form:input type="text" path="question"/><br/><br/>
    <form:label path="optionAText">Option A</form:label><br/>
    <form:input type="text" path="optionAText"/><br/><br/>
    <form:label path="optionBText">Option B</form:label><br/>
    <form:input type="text" path="optionBText"/><br/><br/>
    <form:label path="optionCText">Option C</form:label><br/>
    <form:input type="text" path="optionCText"/><br/><br/>
    <form:label path="optionDText">Option D</form:label><br/>
    <form:input type="text" path="optionDText"/><br/><br/>
    <input type="submit" value="Submit"/>
</form:form>
</body>
</html>
