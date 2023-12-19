<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12/18/2023
  Time: 5:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Password</title>
</head>
<body>
<p>Step 1 of 3</p>
<h1>Welcome back!</h1>
<h1>Joining Netflix is easy</h1>
<p>Enter your password and you'll be watching in no time</p>
<p>Email</p>${emailSignIn}<p id="email">
</p>
<form action="${pageContext.request.contextPath}/signup/password" method="post">
    <label>
        <input type="password" name="password" placeholder="Enter your password">
    </label><br><br>
    <a href="${pageContext.request.contextPath}/login/forgetPassword">Forget your password</a><br><br>
    <input type="submit" value="Next">
</form>
</body>
</html>
