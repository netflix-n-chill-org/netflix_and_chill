<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12/15/2023
  Time: 10:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View customer</title>
</head>
<body>
<h1>Customer details</h1>
<p>
    <a href="${pageContext.request.contextPath}/users">Back to customer list</a>
</p>
<table>
    <tr>
        <td>Name: </td>
        <td>${requestScope["user"].getName()}</td>
    </tr>
    <tr>
        <td>Phone: </td>
        <td>${requestScope["user"].getPhone()}</td>
    </tr>
    <tr>
        <td>Email: </td>
        <td>${requestScope["user"].getEmail()}</td>
    </tr>
</table>
</body>
</html>
