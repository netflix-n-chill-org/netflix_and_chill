<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12/18/2023
  Time: 7:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Netflix</title>
    <link rel="icon" href="../img/logo/logo.png" type="image/png">
     <style>
         * {
             margin: 0;
             padding: 0;
             box-sizing: border-box;
             font-family: Netflix Sans, Helvetica Neue, Segoe UI, Roboto, Ubuntu, sans-serif;
         }
         body {
             background: #000;
         }

         body::before {
             content: "";
             position: absolute;
             height: 100%;
             width: 100%;
             background-size: cover;
             background: linear-gradient(to top, rgba(0, 0, 0, 0.8) 0, rgba(0, 0, 0, 0) 60%, rgba(0, 0, 0, 0.8) 100%), url(../img/banner.jpg) center;
             opacity: 0.8;
             z-index: -1;
         }
         .header {
             position: fixed;
             padding: 25px 60px;
             z-index: 1;
         }

         .header a img {
             width: 167px;
         }
         .wrapper {
             position: absolute;
             left: 50%;
             top: 50%;
             border-radius: 4px;
             padding: 70px;
             width: 450px;
             transform: translate(-50%, -50%);
             background: rgba(0, 0, 0, 0.75);
             margin-top: 30px;
         }
         .wrapper h2 {
             color: #fff;
             font-size: 2rem;
         }.wrapper form {
              margin: 25px 0 65px;
          }

         form .input-box {
             position: relative;
             height: 50px;
             margin-bottom: 16px;
         }

         .input-box input {
             height: 100%;
             width: 100%;
             background: #333;
             border: none;
             outline: none;
             border-radius: 4px;
             color: #fff;
             font-size: 1rem;
             padding: 0 20px;
         }

         .input-box input:focus,
         .input-box input:valid {
             background: #444;
             padding: 16px 20px 0;
         }

         .input-box label {
             position: absolute;
             left: 20px;
             top: 50%;
             transform: translateY(-50%);
             font-size: 1rem;
             pointer-events: none;
             color: #8c8c8c;
             transition: all 0.1s ease;
         }

         .input-box input:focus ~ label,
         .input-box input:valid ~ label {
             font-size: 0.75rem;
             transform: translateY(-130%);
         }

         form button {
             width: 100%;
             padding: 16px 0;
             font-size: 1rem;
             background: #e50914;
             color: #fff;
             font-weight: 500;
             border-radius: 4px;
             border: none;
             outline: none;
             margin: 25px 0 10px;
             cursor: pointer;
             transition: 0.1s ease;
         }

         form button:hover {
             background: #c40812;
         }

         .wrapper a {
             text-decoration: none;
         }

         .wrapper a:hover {
             text-decoration: underline;
         }

         .wrapper label,
         .wrapper p,
         .wrapper a,
         .wrapper small {
             color: #b3b3b3;
         }

         form .options {
             display: flex;
             justify-content: space-between;
         }

         form .remember {
             display: flex;
         }

         form .remember input {
             margin-right: 5px;
             accent-color: #b3b3b3;
         }

         .options label,
         .options a {
             font-size: 0.9rem;
         }

         .wrapper p a {
             color: #fff;
         }

         .wrapper small {
             display: block;
             margin-top: 15px;
             color: #b3b3b3;
         }

         .wrapper small a {
             color: #0071eb;
         }
         @media (max-width: 740px) {
             body::before {
                 display: none;
             }

             .header,
             .wrapper {
                 padding: 20px;
             }

             .header a img {
                 width: 140px;
             }

             .wrapper {
                 width: 100%;
                 margin-top: 0;
                 top: 43%;
             }

             .wrapper form {
                 margin: 25px 0 40px;
             }
         }

     </style>
</head>
<%
    session = request.getSession();
    String username = (String) session.getAttribute("emailSignIn");
    if (username == null) {
        username = (String) request.getAttribute("emailSignIn");
        if (username == null) {
            username = "";
        }
    }

%>
<body>
<header class="header">
    <a href="../HomePage/homepage.jsp"><img src="../img/logo/netflix-logo.png" alt="" /></a>
</header>
<div class="wrapper">
    <h2>Đăng nhập</h2>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <c:if test="${isOnlineUser == true}">
            <p style="color: red">User online in other application</p>
        </c:if>
        <div class="input-box">
            <input type="text" id="username" name="username" required oninput="getValue()" value="<%=username%>" />
            <label>Email hoặc số điện thoại</label>
        </div>
        <c:if test="${auth == 0}">
            <p style="color: red" id="not">Email not sign up</p>
        </c:if>
        <div class="input-box">
            <input type="password" name="password" required />
            <label>Mật khẩu </label>
        </div>
        <c:if test="${auth > 0 && auth < 6}" >
            <p style="color: red">Wrong password ${auth} times</p>
        </c:if>
        <c:if test="${auth == 6}" >
            <p style="color: red">Block user</p>
        </c:if>
        <button type="submit">Đăng nhập</button>

        <div class="options">
            <div class="remember">
                <input type="checkbox" id="remember" />
                <label for="remember">Ghi nhớ tôi</label>
            </div>
            <a href="${pageContext.request.contextPath}/login/forgetPassword?username=" id="forgetPass1">Quên mật khẩu</a>
            <a href="${pageContext.request.contextPath}/login/forgetPassword?username=" id="forgetPass2">Cần trợ giúp</a>
        </div>
    </form>

    <p>Bạn mới tham gia Netflix? <a href="${pageContext.request.contextPath}/main">Đăng ký ngay.</a></p>
    <small>
        Quá trình đăng nhập được Google reCAPTCHA bảo vệ để đảm bảo bạn không phải là robot.
        <a href="#">Tìm hiểu thêm.</a>
    </small>
</div>
<script>
    function getValue() {
        const username = document.getElementById("username").value;
        document.getElementById("forgetPass1").href += username;
        document.getElementById("forgetPass2").href += username;
    }
</script>
</body>
</html>
