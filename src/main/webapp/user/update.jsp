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
    <title>Update Profile</title>
    <style>
        *{
            font-family: Arial,sans-serif;
        }
        .message{
            color:red;
            font-size: 20px;
            text-align: center;

        }
    </style>
</head>
<body>
<div style="text-align: center;">
    <h1>User Management</h1>
    <h2>
        <a href="${pageContext.request.contextPath}/users?action=users">List All Users</a>
    </h2>
</div>
<p style="text-align: center">
    <c:if test="${requestScope['message']!=null}">
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit Profile
                </h2>
            </caption>
            <c:if test="${user != null}">
                <input type="hidden" name="id" value="<c:out value='${user.id}'/>"/>
            </c:if>
            <tr>
                <th>Profile Name:</th>
                <td>
                    <label>
                        <input type="text" name="name" size="45" value="${user.name}"/>
                    </label>
                </td>
            </tr>

            <tr>
                <th>Profile Phone:</th>
                <td>
                    <label>
                        <input type="tel" name="phone" size="45" value="${user.phone}"/>
                    </label>
                </td>
            </tr>
            <tr>
                <th>Profile Email:</th>
                <td>
                    <label>
                        <input type="email" name="email" size="45" value="${user.email}"/>
                    </label>
                </td>
            </tr>



            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
