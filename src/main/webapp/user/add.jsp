<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/13/2023
  Time: 9:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management</title>
</head>
<body>
<form method="post">
    <table border="1" cellpadding="5">
        <caption>
            <h1>Add New Profile</h1>
            <h2>
                <a href="${pageContext.request.contextPath}/users">Back to Profile List</a>
            </h2>
        </caption>
        <tr>
            <th>
                Profile Name:
            </th>
            <td>
                <label>
                    <input type="text" name="name" id="name" size="45"/>
                </label>
            </td>
        </tr>

        <tr>
            <th>
                Profile phone:
            </th>
            <td>
                <label>
                    <input type="text" name="phone" id="phone" size="45"/>
                </label>
            </td>
        </tr>

        <tr>
            <th>
                Profile email:
            </th>
            <td>
                <label>
                    <input type="text" name="email" id="email" size="15"/>
                </label>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <label>
                    <input type="submit" value="Save"/>
                </label>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
