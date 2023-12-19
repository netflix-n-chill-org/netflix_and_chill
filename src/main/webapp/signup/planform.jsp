<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Netflix</title>
    <link rel="icon" href="../img/logo/logo.png" type="image/png">
    <link rel="stylesheet" href="../css/signup_main.css">

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
            margin: 20px;
        }

        .header::before {
            content: "";
            position: absolute;
            height: 100%;
            width: 100%;
            opacity: 0.6;
            z-index: -1;

        }

        .header .navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px 140px;
            border-bottom: 1px solid #e6e6e6;
        }

        .logo {
            width: 150px;
            cursor: pointer;
        }

        .header .navbar .right button {
            font-size: 18px;
            font-weight: 400;
            cursor: pointer;
            outline: none;
            border: none;
        }

        .header .navbar .right button a {
            text-decoration: none;
            color: #000;
            background-color: white;
        }

        .service-option i {
            margin-right: 10px;
        }

        .service-option p {
            display: flex;
            align-items: center;
        }
        #customers td, #customers th {
            padding: 8px;
            border-bottom: 2px solid #ddd;
        }

        #customers th {
            padding-top: 50px;
            padding-bottom: 50px;
            gap: 10px;
            text-align: center;
            background-color: rgb(254, 130, 130);
            color: white;
            border: 1px solid white;
        }

        #customers tr:not(:first-child) {
            border-bottom: 1px solid black;
        }
        .cards {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 40px;
        }

        .card {
            background: #fff;
            color: hsl(233, 13%, 49%);
            border-radius: 0.8rem;
        }

        .cards .card.active {
            background: linear-gradient(
                    135deg,
                    rgba(163, 168, 240, 1) 0%,
                    rgba(105, 111, 221, 1) 100%
            );
            color: #fff;
            display: flex;
            align-items: center;
            transform: scale(1.1);
            z-index: 1;
        }
        ul {
            margin: 2.6rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-around;
        }
        ul li {
            list-style-type: none;
            display: flex;
            justify-content: center;
            width: 100%;
            padding: 1rem 0;
        }
        ul li.price {
            font-size: 3rem;
            color: hsl(232, 13%, 33%);
            padding-bottom: 2rem;
        }
        .shadow {
            box-shadow: -5px 5px 15px 1px rgba(0, 0, 0, 0.1);
        }

        .card.active .price {
            color: #fff;
        }
        .btn {
            margin-top: 1rem;
            height: 2.6rem;
            width: 13.3rem;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 4px;
            background: linear-gradient(
                    135deg,
                    rgba(163, 168, 240, 1) 0%,
                    rgba(105, 111, 221, 1) 100%
            );
            color: #fff;
            outline: none;
            border: 0;
            font-weight: bold;
        }
        .active-btn {
            background: #fff;
            color: hsl(237, 63%, 64%);
        }
        .bottom-bar {
            border-bottom: 2px solid hsla(240, 8%, 85%, 0.582);
        }
        .card.active .bottom-bar {
            border-bottom: 2px solid hsla(240, 8%, 85%, 0.253);
        }
        .pack {
            font-size: 1.1rem;
        }


        .footer {
            border-top: 1px solid #e6e6e6;
            padding: 30px 10% 10px;
            color: #777;
            background-color: #f3f3f3;
            margin-top: 40px;
        }

        .footer h2 {
            font-size: 18px;
            font-weight: 400;
            margin-bottom: 30px;
        }

        .footer .column {
            flex-basis: 25%;
            flex-grow: 1;
            margin-bottom: 20px;
        }

        .footer .column a {
            display: block;
            text-decoration: none;
            color: #737373;
            font-size: 15px;
            margin-bottom: 10px;
        }

        .footer .row {
            align-items: flex-start;
            padding: 10px 0;
            border-bottom: none;
        }

        .column select {
            padding: 10px;
            border: none;
        }

        .footer .language {
            color: #333;
            font-size: 16px;
            height: 48px;
            padding: 10px 30px 12px 10px;
            background: #fff;
            border: 1px solid #a6a6a6;
            margin-top: 10px;
        }

        .column p {
            margin-top: 10px;
            color: white;
        }

        .row {
            display: flex;
            width: 100%;
            align-items: center;
            flex-wrap: wrap;
            padding: 50px;
            margin-bottom: 20px;
            border-bottom: 8px solid #383737;

        }

        td {
            text-align: center;
            padding: 10px;
        }

        #customers img {
            display: block;
            margin: 0 auto;
        }

        .highlighted {
            color: red;
            font-weight: 500;
        }

        /* Responsive Styles */
        @media only screen and (max-width: 600px) {
            .header .navbar {
                flex-direction: column;
                padding: 10px;
            }
            .footer .row {
                flex-direction: column;
            }
        }
        @media (max-width: 280px) {
            ul {
                margin: 1rem;
            }
            h1 {
                font-size: 1.2rem;
            }

            .cards {
                margin: 0;
                display: flex;
                flex-direction: column;
            }

            .card {
                transform: scale(0.8);
                margin-bottom: 1rem;
            }
            .cards .card.active {
                transform: scale(0.8);
            }
        }

        @media (min-width: 280px) and (max-width: 320px) {
            ul {
                margin: 20px;
            }
            .cards {
                display: flex;
                flex-direction: column;
            }
            .card {
                margin-bottom: 1rem;
            }
            .cards .card.active {
                transform: scale(1);
            }
        }

        @media (min-width: 320px) and (max-width: 414px) {
            .cards {
                display: flex;
                flex-direction: column;
            }
            .card {
                margin-bottom: 1rem;
            }
            .cards .card.active {
                transform: scale(1);
            }
        }
        @media (min-width: 414px) and (max-width: 768px) {
            .card {
                margin-bottom: 1rem;
                margin-right: 1rem;
            }
            .cards .card.active {
                transform: scale(1);
            }
        }
        @media (min-width: 768px) and (max-width: 1046px) {
            .cards {
                display: flex;
            }
            .card {
                margin-bottom: 1rem;
                margin-right: 1rem;
            }
            .cards .card.active {
                transform: scale(1);
            }
        }

    </style>
    <script src="https://kit.fontawesome.com/4e9e7bbd1b.js" crossorigin="anonymous"></script>

</head>
<body>
<div class="header">
    <nav class="navbar">
        <div class="left">
            <a href="../HomePage/homepage.jsp">
                <img src="../img/logo/netflix-logo.png" alt="" class="logo">
            </a>
        </div>
        <div class="right">
            <button><a href="../login/logout.jsp">Đăng xuất</a></button>
        </div>
    </nav>
</div>

<form action="/signup/planform" method="post">
<div class="cards">
    <div class="card shadow">
        <ul>
            <li class="pack">Gói cơ bản</li>
            <li id="basic" class="price bottom-bar">108.000 ₫</li>
            <li class="bottom-bar">Chất lượng video:Tốt</li>
            <li class="bottom-bar">Số lượng phim: 5</li>
            <li class="bottom-bar">Thưởng thức 1000 phút phim hấp dẫn</li>
            <li>
                <input type="submit" name="plan" value="Đăng ký" class="btn">
           </li>
        </ul>
    </div>
    <div class="card active">
        <ul>
            <li class="pack">Gói tiêu chuẩn</li>
            <li id="professional" class="price bottom-bar">260.000 ₫</li>
            <li class="bottom-bar">Chất lượng video:Tốt hơn</li>
            <li class="bottom-bar">Số lượng phim: 20</li>
            <li class="bottom-bar">Trải nghiệm 2000 phút phim đỉnh cao</li>
            <li>
                <input type="submit" name="plan" value="Đăng ký" class="btn active-btn">
        </li>
        </ul>
    </div>
    <div class="card shadow">
        <ul>
            <li class="pack">Gói Cao cấp</li>
            <li id="master" class="price bottom-bar">260.000 ₫</li>
            <li class="bottom-bar">Chất lượng video:Tốt hơn</li>
            <li class="bottom-bar">Số lượng phim: Không giới hạn</li>
            <li class="bottom-bar">Tận hưởng thế giới phim không giới hạn</li>
            <li>
                <input type="submit" name="plan" value="Đăng ký" class="btn">

          </li>
        </ul>
    </div>
</div>
<div class="footer">
    <h2>Bạn có câu hỏi? Liên hệ với chúng tôi.</h2>
    <div class="row">
        <div class="column">
            <a href="#">Câu hỏi thường gặp</a>
            <a href="#">Quyền riêng tư</a>
            <select name="language" class="language">
                <option value="Vietnamese">🌐 Tiếng việt</option>
                <option value="English">🌐 English</option>
            </select>
        </div>
        <div class="column">
            <a href="#">Trung tâm trợ giúp</a>
            <a href="#">Tùy chọn cookie</a>
        </div>
        <div class="column">
            <a href="#">Cửa hàng Netflix</a>
            <a href="#">Thông tin doanh nghiệp</a>
        </div>
        <div class="column">
            <a href="#">Điều khoản sử dung</a>
        </div>
    </div>
</div>
</form>
</body>
</html>
