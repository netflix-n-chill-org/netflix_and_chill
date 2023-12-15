<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12/14/2023
  Time: 2:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Netflix</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo/logo.png" type="image/png">
    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: sans-serif;
        }

        body{
            background-color: #000000;
        }

        header{
            padding: 20px 0 0 100px;
        }

        header img{
            height: 45px;
            width: 140px;
        }

        .container{
            display: flex;
            flex-wrap: wrap;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin-top: 100px;
            color: #FFFFFF;
        }

        .container h1{
            font-size: 42px;
            font-weight: 100;
            margin: 0 0 20px 0;
        }

        .card-users{
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        .card a {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-decoration: none;
            color: #b3b3b3;
            padding: 10px;
        }

        .card a img {
            margin-right: 10px;
            height: 127px;
            width: 127px;
            border-radius: 4px;
        }

        .card p {
            text-align: center;
            margin-top: 5px;
        }
        .card > a > img:hover{
            border: 2px solid #FFFFFF;
        }

        .card > a:hover{
            color: #FFFFFF;
        }
        .container a:nth-child(3){
            text-decoration: none;
            color: #8c8c8c;
            border: 1px solid #8c8c8c;
            padding: 10px 30px;
            margin-top: 50px;
            text-align: center;
            text-transform: uppercase;
        }

        .container a:hover:nth-child(3){
            border: 1px solid #FFFFFF;
            color: #FFFFFF;
        }
        @media(max-width: 450px){
            header {
                padding: 15px 0 0 15px;
            }

            .container h1 {
                font-size: 32px;
                text-align: center;
            }
            .card{
                margin: 10px;
            }

            .card-users {
                justify-content: space-around;
                align-items: center;
                width: 100%;
            }
        }
    </style>
</head>
<body>
<header>
    <a href="../HomePage/homepage.jsp"><img src="../img/logo/netflix-logo.png" alt="Netflix Logo"></a>
</header>
<div class="container">
    <h1>Ai đang xem?</h1>

    <div class="card-users">
        <div class="card">
            <a href="${pageContext.request.contextPath}/users">
                <img src="../img/blue.jpg">
                <p>Việt</p>
            </a>
        </div>
        <div class="card">
            <a href="${pageContext.request.contextPath}/users">
                <img src="../img/red.jpg">
                <p>Hiếu</p>
            </a>
        </div>

        <div class="card">
            <a href="${pageContext.request.contextPath}/users">
                <img src="../img/green.jpg">
                <p>Thảo</p>
            </a>
        </div>


        <div class="card">
            <a href="${pageContext.request.contextPath}/users?action=add">
                <img src="../img/plus.png">
                <p>Thêm hồ sơ</p>
            </a>
        </div>
    </div>

    <a href="${pageContext.request.contextPath}/users">Manage profile</a>
</div>
</body>
</html>
