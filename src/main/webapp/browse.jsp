<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12/13/2023
  Time: 10:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Netflix - Thế giới giải trí trong tầm tay bạn</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo/logo.png" type="image/png">
    <script src="https://kit.fontawesome.com/4e9e7bbd1b.js" crossorigin="anonymous"></script>
    <style>
        @font-face {
            font-family: SawarabiMincho;
            src: url(/fonts/SawarabiMincho-Regular.ttf);
        }
        @font-face {
            font-family: LexendDeca;
            src: url(/fonts/LexendDeca-VariableFont_wght.ttf);
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Netflix Sans, Helvetica Neue, Segoe UI, Roboto, Ubuntu, sans-serif;
            color: white;
        }

        body {
            background-color: #333;
            color: #fff;
            height: 100vh;
            margin: 0;
        }

        .container {
            width: 100%;
            background-color: rgba(0, 0, 0, 0.6);
        }

        nav {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 50px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: black;
            z-index: 10;
        }
        .left{
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
        }
        .left img {
            width: 150px;
        }

        .left ul {
            list-style-type: none;
            display: flex;
            gap: 30px;
            padding-left: 60px;
        }

        .left ul li a {
            color: rgba(243, 243, 243, 0.85);
            text-decoration: none;
        }


        .right img {
            width: 35px;
        }
    .right{
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
    }
        .right a {
            list-style-type: none;
            display: flex;
            gap: 30px;
            padding: 0 10px;
        }

        .right ul li {
            color: white;
        }
        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            right: 0;
            left: 50%;
            transform: translateX(-50%);
            display: none;
            position: absolute;
            background-color: #000000;
            min-width: 130px;
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
            z-index: 1;
            margin-top: 10px;
        }
        .dropdown-content::before {
            content: "";
            position: absolute;
            bottom: 100%;
            left: 50%;
            margin-left: -5px;
            border-width: 5px;
            border-style: solid;
            border-color: transparent transparent #f9f9f9 transparent;
        }
        .dropdown-content a {
            color: #fff;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #383737;
            color:#000;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }
        .movieImg {
            width: 100%;
            height: 750px;
            background-size: cover;
            background: linear-gradient(to top, rgba(0, 0, 0, 0.8) 0, rgba(0, 0, 0, 0) 60%, rgba(0, 0, 0, 0.8) 100%), url("https://www.quirkybyte.com/wp-content/uploads/2016/12/pd.jpg") center;
            background-size: cover;
            position: relative;
            border-radius: 10px;
            object-fit: fill;
            opacity: 0.9;
        }

        .movieName {
            position: absolute;
            display: flex;
            flex-direction: column;
            bottom: 120px;
            left: 20px;
            margin: 10px;

        }

        .movieName h1 {
            font-size: 65px;
            width: 400px;
            text-align: center;
            line-height: 66px;
            height: 140px;
            font-family: SawarabiMincho,sans-serif;
            color: red;
            margin-left: 80px;
        }

        .btn {
            display: flex;
            width: 250px;
            justify-content: space-between;
            margin-left: 160px;
        }

        .btn button {
            width: 49%;
        }

        .btn button {
            background-color: #737373;
            color: rgb(255, 255, 255);
            font-weight: bolder;
            padding: 5px;
            outline: none;
            border: none;

        }

        .btn button:nth-of-type(1) {
            background-color: white;
            color: black;
            font-weight: bolder;
            padding: 5px;
            border-radius: 5px;
            outline: none;
            border: none;
            justify-content: center;
        }

        .btn button:nth-of-type(1) i {
            color: black;
        }

        .moviesDesc {
            width: 650px;
            padding: 20px 0;
            font-weight: 400;
            font-family: LexendDeca, "Arial", sans-serif;            line-height: 2;
        }

        .first {
            width: 90%;
            margin: 50px auto 0;
        }

        div.ex1 {
            border-radius: 5px;
            width: 100%;
            overflow-x: auto;
            display: flex;
            overflow-y: hidden;
        }

        .ex1 div img {
            width: 250px;
            height: 350px;
            object-fit: cover;
            margin-right: 10px;
            border-radius: 5px;
        }

        .ex1 div {
            position: relative;
        }


        .first h1 {
            font-size: 20px;
            margin-bottom: 10px;
            font-family: Arial, Helvetica, sans-serif;
        }

        .ex1 div .heart {
            position: absolute;
            padding: 10px;
            border-radius: 50%;
            top: 10px;
            right: 20px;
            outline: none;
            border: none;
            background-color: rgba(49, 46, 46, 0.4);
        }

        .ex1 div .heart:hover {
            border-radius: 30%;
            border: none;
            background-color: rgba(97, 97, 97, 0.7);
            box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.3);
        }

        .ex1 div .download {
            position: absolute;
            padding: 10px;
            bottom: 10px;
            left: 10px;
            outline: none;
            border: none;
            background-color: rgba(44, 43, 43, 0.5);
        }

        .ex1 div .download:hover {
            border: none;
            background-color: rgba(97, 97, 97, 0.7);
            box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.3);
        }


        a {
            text-decoration: none;
        }
        .footer{
            padding: 60px 15% 10px;
            color:#777;
            background-color: rgba(0, 0, 0, 0.6);
        }
        .footer h2{
            font-size: 18px;
            font-weight: 400;
            margin-bottom: 30px;
        }
        .footer .column{
            flex-basis: 25%;
            flex-grow: 1;
            margin-bottom:20px;
        }
        .footer .column a{
            display: block;
            text-decoration: none;
            color:#ffffff;
            font-size: 15px;
            margin-bottom: 10px;
        }
        .footer .row{
            align-items: flex-start;
            padding: 10px 0;
            border-bottom: none;
        }
        .column select{
            padding: 10px;
            border: none;
        }
        .footer .language{
            color:#fff;
            padding: 10px 20px;
            border-radius:3px ;
            background:none;
            border: 1px solid white;
            margin-top: 10px;
        }
        .column p{
            margin-top: 10px;
            color:white;
        }
        .row {
            display: flex;
            width: 100%;
            align-items: center;
            flex-wrap: wrap;
            padding: 50px;
            margin-bottom: 20px;
            border-bottom: 8px solid#383737;
        }
        @media screen and (max-width: 768px) {
            .left {
                justify-content: flex-start;
                padding-left: 10px;
            }

            .left img {
                width: 120px;
            }

            .left ul {
                padding-left: 10px;
                gap: 15px;
            }

            .right {
                margin-right: 10px;
            }

            .btn {
                margin-left: 10px;
                width: 100%;
                justify-content: space-between;
            }

            .btn button {
                width: 48%;
            }

            .movieName h1 {
                font-size: 40px;
                width: 250px;
                margin-left: 20px;
            }

            .ex1 div img {
                width: 180px;
                height: 250px;
                margin-right: 5px;
            }

            .footer {
                padding: 30px 5% 10px;
            }

            .footer .column {
                flex-basis: 100%;
                margin-bottom: 20px;
            }

            .row {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <nav>
        <div class="left">
            <a href="HomePage/homepage.jsp"><img src="img/logo/netflix-logo.png" alt="Netflix Logo"></a>
            <ul>
                <li><a href="#">Trang chủ</a></li>
                <li><a href="#">Phim truyền hình</a></li>
                <li><a href="#">Phim mới</a></li>
                <li><a href="#">Phổ biến</a></li>
            </ul>
        </div>
        <div class="right">
            <p style="color: rgba(243, 243, 243, 0.85); ">Trẻ em</p>
            <a href="#"><img src="https://cdn.picpng.com/bell/bell-notification-communication-67055.png" alt="Icon thông báo"></a>
            <div class="dropdown"onclick="toggleDropdownF(this)">
                <c:if test="${sessionScope.loggedInUser != null}">

                  <a href="#" >
                    <img src="img/red.jpg" alt="Hình đại diện người dùng" class="dropbtn">
                  </a>
                    <div class="dropdown-content" >
                        <a href="${pageContext.request.contextPath}/users">Link 1</a>
                        <a href="${pageContext.request.contextPath}/users"><c:out value="Chào mừng, ${sessionScope.loggedInUser.name}" /></a>
                        <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                    </div>
                </c:if>
                <c:if test="${sessionScope.loggedInUser == null}">
                    <img src="img/red.jpg" alt="Hình đại diện người dùng" class="dropbtn">
                    <div class="dropdown-content">
                        <a href="#">Link 1</a>
                        <a href="user/manager.jsp">Manager Profiles</a>
                        <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                    </div>
                </c:if>
            </div>
        </div>
    </nav>
    <div class="movie">
        <div class="movieImg">
            <div class="movieName">
                <h1>Fast & Furious 8</h1>
                <div class="btn">
                    <button><i class="fa fa-play"></i> Play</button>
                    <button><i class="fa fa-plus"></i> My List</button>
                </div>
                <div class="moviesDesc"> Lần đầu tiên, Dominic Toretto phản bội gia đình và những người bạn của mình.
                    Đặc vụ Hobbs vì thế bị tống vào tù. Mọi người đều hoang mang trước sự thay đổi của người anh cả vẫn
                    luôn bảo vệ cho cả nhóm. Liệu có bí mật nào đằng sau việc Toretto phản bội? Nhân vật bí ẩn Cipher
                    đóng vai trò gì trong sự việc này? Việc kết hợp của nhóm với “kẻ thù cũ” Shaw sẽ đem lại kết quả thế
                    nào?
                </div>
            </div>
        </div>
    </div>
    <div class="first">
        <h1>Chủ đề dành cho bạn</h1>
        <div class="ex1">
            <div>
                <img src="https://img.rgstatic.com/content/movie/cdae4bdf-9f82-4c91-9a9b-50468836341e/poster-500.jpg">
                <button class="heart"><i class="fa fa-heart"></i></button>
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>
            </div>
            <div>
                <img src="https://i.pinimg.com/474x/f5/37/55/f5375575dd856586873b2bfee350476c--scary-movies-horror-movies.jpg">
                <button class="heart"><i class="fa fa-heart"></i></button>
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>

            </div>
            <div>
                <img src="https://www.themoviedb.org/t/p/original/qVo6p5zNiUr1R3GWnsqsZNcmhmw.jpg">
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>
                <button class="heart"><i class="fa fa-heart"></i></button>
            </div>
            <div>
                <img src="https://assets.nflxext.com/us/boxshots/hd1080/70262639.jpg">
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>
                <button class="heart"><i class="fa fa-heart"></i></button>
            </div>
            <div>
                <img
                        src="https://www.digitaltrends.com/wp-content/uploads/2022/05/cbcml2h866snqhar8j9dq9r4ud6.jpg?p=1#038;p=1.jpg">
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>
                <button class="heart"><i class="fa fa-heart"></i></button>
            </div>
            <div>
                <img src="https://www.digitaltrends.com/wp-content/uploads/2023/01/xo0fgAUoEeVQ7KsKeMWypyglvnf.jpg?p=1#038;p=1.jpg">
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>
                <button class="heart"><i class="fa fa-heart"></i></button>
            </div>
            <div>
                <img src="https://www.digitaltrends.com/wp-content/uploads/2022/06/1SOiUTDnwW9gU4GzSIsOCQUlHJF.jpg?p=1#038;p=1.jpg">
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>
                <button class="heart"><i class="fa fa-heart"></i></button>
            </div>
            <div>
                <img src="https://www.digitaltrends.com/wp-content/uploads/2022/12/ga8R3OiOMMgSvZ4cOj8x7prUNYZ.jpg?p=1#038;p=1.jpg">
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>
                <button class="heart"><i class="fa fa-heart"></i></button>
            </div>
            <div>
                <img
                        src="https://www.digitaltrends.com/wp-content/uploads/2022/02/voxl654m7p36y8flu8oqd7dfwwk.jpg?p=1#038;p=1.jpg">
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>
                <button class="heart"><i class="fa fa-heart"></i></button>
            </div>


        </div>
    </div>
    <div class="first">
        <h1>Phim kinh dị</h1>
        <div class="ex1">
            <div>
                <img src="https://hellhorror.com/images/inTheaters/origs/92cc2-summoning-sylvia-2023-poster-w500-h750-q60-fcrop.jpg">
                <button class="heart"><i class="fa fa-heart"></i></button>
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>
            </div>
            <div>
                <img src="https://image.vietnamnews.vn/uploadvnnews/Article/2019/12/17/57797_mat.jpg">
                <button class="heart"><i class="fa fa-heart"></i></button>
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>

            </div>
            <div>
                <img src="https://www.newdvdreleasedates.com/images/movies/scream-2022.jpg">
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>
                <button class="heart"><i class="fa fa-heart"></i></button>
            </div>
            <div>
                <img src="https://assets.nflxext.com/us/boxshots/hd1080/70300205.jpg">
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>
                <button class="heart"><i class="fa fa-heart"></i></button>
            </div>
            <div>
                <img src="https://i2.wp.com/horrorpatch.com/wp-content/uploads/2018/02/Hes-Out-There.jpg?ssl=1">
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>
                <button class="heart"><i class="fa fa-heart"></i></button>
            </div>
            <div>
                <img src="https://i.pinimg.com/originals/64/c9/2f/64c92fa88a71497b910e910c0a4896ea.jpg">
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>
                <button class="heart"><i class="fa fa-heart"></i></button>
            </div>
            <div>
                <img src="https://upload.wikimedia.org/wikipedia/en/f/ff/The_Ritual_UK_poster.png">
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>
                <button class="heart"><i class="fa fa-heart"></i></button>
            </div>
        </div>
    </div>
    <div class="first">
        <h1>Phim dành cho trẻ em</h1>
        <div class="ex1">
            <div>
                <img src="https://s-media-cache-ak0.pinimg.com/736x/69/7c/62/697c626d90167a3dd6ef25c2f8e3c72a.jpg">
                <button class="heart"><i class="fa fa-heart"></i></button>
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>
            </div>
            <div>
                <img src="https://www.todaysparent.com/wp-content/uploads/2018/04/best-kids-movies-us-netflix-kung-fu-panda.jpg">
                <button class="heart"><i class="fa fa-heart"></i></button>
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>

            </div>
            <div>
                <img src="https://assets.nflxext.com/us/boxshots/hd1080/80108238.jpg">
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>
                <button class="heart"><i class="fa fa-heart"></i></button>
            </div>
            <div>
                <img
                        src="https://3.bp.blogspot.com/-9oT_xRpiWl0/WppHFCW7itI/AAAAAAAActc/OZfaSy_CHU4TufgvhaiP-PGJPPxV3JYhgCLcBGAs/s1600/DXUyLi3VQAEYoAN.jpg">
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>
                <button class="heart"><i class="fa fa-heart"></i></button>
            </div>

            <div>
                <img src="https://image.tmdb.org/t/p/original/292ShxSyJHPcKT2zmwPd99fB0sm.jpg">
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>
                <button class="heart"><i class="fa fa-heart"></i></button>
            </div>
            <div>
                <img src="https://m.media-amazon.com/images/M/MV5BNWNhY2EzMjEtZjFlNy00ZmM2LWI4MTQtN2Q2Nzc5NjJhNDQ0XkEyXkFqcGdeQXVyNzkyMDA5MTc@._V1_FMjpg_UX1000_.jpg">
                <button class="download"><i class="fa fa-download"></i>&nbsp;Download</button>
                <button class="heart"><i class="fa fa-heart"></i></button>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <h2>Bạn có câu hỏi? Liên hệ với chúng tôi.</h2>
    <div class="row">
        <div class="column">
            <a href="#">Câu hỏi thường gặp</a>
            <a href="#">Quan hệ với nhà đầu tư</a>
            <a href="#">Quyền riêng tư</a>
            <a href="#">Kiểm tra tốc độ</a>
            <select name="language" class="language">
                <option value="Vietnamese">Tiếng việt</option>
                <option value="English">English</option>
            </select>
            <p>Netflix Việt Nam</p>

        </div>
        <div class="column">
            <a href="#">Trung tâm trợ giúp</a>
            <a href="#">Việc làm</a>
            <a href="#">Tùy chọn cookie</a>
            <a href="#">Thông báo pháp lý</a>

        </div>
        <div class="column">
            <a href="#">Tài khoản</a>
            <a href="#">Các cách xem</a>
            <a href="#">Thông tin doanh nghiệp</a>
            <a href="#">Chỉ có trên netflix</a>

        </div>
        <div class="column">
            <a href="#">Trung tâm đa phương tiện</a>
            <a href="#">Quan hệ với nhà đầu tư</a>
            <a href="#">Điều khoản sử dung</a>
            <a href="#">Liên hệ với chúng tôi</a>
        </div>
    </div>
</div>
<script>
    let isDropdownOpen = false;

    function toggleDropdownF(dropdown) {
        isDropdownOpen = !isDropdownOpen;

        if (isDropdownOpen) {
            dropdown.classList.add('active');
        } else {
            dropdown.classList.remove('active');
        }
    }

    function toggleDropdown() {
        var dropdownList = document.querySelector('.profile-dropdown-list');
        dropdownList.style.display = dropdownList.style.display === 'none' ? 'block' : 'none';
    }

</script>
</body>
</html>
