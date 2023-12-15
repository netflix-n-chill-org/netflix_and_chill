<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/13/2023
  Time: 9:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Profile Management</title>
</head>
<body>
<div style="text-align: center">
    <h1>Profile Management</h1>
    <h2>
        <a href="${pageContext.request.contextPath}/users?action=add">Add New Profile</a>
        <c:if test="${limit == true}">
            <p style="color:red">CAN'T ADD ANYMORE USER!!!</p>
        </c:if>
    </h2>
</div>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>
            List of Users
        </h2></caption>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Actions</th>
            <th>Actions</th>
        </tr>

        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>

                <td >
                    <a href="/users?action=view&id=${user.getId()}">
                    <c:out value="${user.name}"/>
                    </a>
                </td>

                <td>
                    <c:out value="${user.phone}"/>
                </td>

                <td>
                    <c:out value="${user.email}"/>
                </td>

                <td>
                    <a href="${pageContext.request.contextPath}/users?action=update&id=${user.id}">Edit</a>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/users?action=delete&id=${user.id}">Delete</a>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/users?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>