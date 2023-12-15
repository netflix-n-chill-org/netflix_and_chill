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
    <title>Netflix</title>
    <script src="https://kit.fontawesome.com/4e9e7bbd1b.js" crossorigin="anonymous"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Netflix Sans, Helvetica Neue, Segoe UI, Roboto, Ubuntu, sans-serif;
        }
        body {
            color: black;
            height: 100vh;
            margin: 0;
        }

        .header::before {
            content: "";
            position: absolute;
            height: 100%;
            width: 100%;
            opacity: 0.6;
            z-index: -1;

        }
        .left{
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
        }
        .header .navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px 60px;
            border-bottom: 1px solid #e6e6e6;
        }

        .logo {
            width: 150px;
            cursor: pointer;
        }
        .header .navbar .right button {
            font-size: 18px;
            font-weight: 400;
            padding: 7px 17px;
            background-color: #e50914;
            cursor: pointer;
            outline: none;
            border-radius: 4px;
            border: none;
        }

        .header .navbar .right button a {
            text-decoration: none;
            color: white;
        }
        .search-bar{
          display: flex;
            align-items: center;
        }
        .search-form
        {
            display: flex;
            align-items: center;
            float: right;
        }
        .search-form input[type="text"]{
            padding: 6px;
            margin-top: 8px;
            font-size: 17px;
           border-radius: 5px;
            width:350px;
            color:#012970;
            border: 1px solid rgba(1, 41, 112, 0.2);
            transition: 0.3s ease;
        }
        .search-form input[type="text"]:hover{
            border: 1px solid rgb(52, 121, 243);
        }
    </style>
</head>
<body>
<div class="header">
    <nav class="navbar">
        <div class="left">
            <a href="../HomePage/homepage.jsp">
                <img src="../img/logo/netflix-logo.png" alt="" class="logo">
            </a>
        </div>
        <div class="search-bar">
            <form class="search-form" method="post" action="#">
                <input type="text" name="query" placeholder="Search" title="Enter search keyword">
                <button type="submit" title="Search" style="color: rgb(1, 41, 112)">
                    <i class="fa-solid fa-magnifying-glass" ></i>
                </button>
            </form>
        </div>
        <div class="right">
            <a href="../HomePage/homepage.jsp">

            </a>
            <button><a href="">Đăng nhập</a></button>
        </div>
    </nav>
</div>
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