<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12/12/2023
  Time: 11:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Đăng nhập Netflix</title>
  <style>
    body {
      font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
      background-color: #000;
      color: #fff;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .login-container {
      text-align: center;
      width: 300px;
    }
    .logo {
      margin-bottom: 20px;
    }
    .login-form {
      display: flex;
      flex-direction: column;
    }
    .login-form input {
      padding: 10px;
      margin-bottom: 10px;
      border: none;
      border-radius: 4px;
    }
    .login-form button {
      padding: 10px;
      background-color: #E50914;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    .login-form button:hover {
      background-color: #f40612;
    }
  </style>
</head>
<body>
<div class="login-container">
  <img src="img/logo/" alt="Netflix Logo" class="logo">
  <form class="login-form">
    <input type="email" placeholder="Email hoặc số điện thoại">
    <input type="password" placeholder="Mật khẩu">
    <button type="submit">Đăng nhập</button>
  </form>
</div>
</body>
</html>

